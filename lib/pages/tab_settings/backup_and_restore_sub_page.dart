import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';

import '../../models/backup_data.dart';
import '../../providers/app_settings.dart';
import '../../providers/custom_food_provider.dart';
import '../../providers/tracked_food_provider.dart';
import '../../services/complete_days_database_service.dart';
import '../../services/custom_foods_database_service.dart';
import '../../services/encryption_service.dart';
import '../../services/tracked_foods_database_service.dart';
import '../../widgets/info_card.dart';
import '../../widgets/select_action_card.dart';

class BackupAndRestoreSubPage extends StatefulWidget {
  static const routeName = '/settings/backup-and-restore';

  const BackupAndRestoreSubPage({Key? key}) : super(key: key);

  @override
  BackupAndRestoreSubPageState createState() => BackupAndRestoreSubPageState();
}

class BackupAndRestoreSubPageState extends State<BackupAndRestoreSubPage> {
  bool _isCreatingBackup = false;
  final _serverSettingsFormKey = GlobalKey<FormState>();
  final _passwordsFormKey = GlobalKey<FormState>();
  final _serverUrlController = TextEditingController();
  final _usernameController = TextEditingController();
  final _pathAndFilenameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _encryptionPasswordController = TextEditingController();

  String get _backupTargetPathWithoutFilename =>
      '${_serverUrlController.text}${path.dirname(_pathAndFilenameController.text)}';

  String get _backupTargetPathWithFilename =>
      '${_serverUrlController.text}${_pathAndFilenameController.text}';

  @override
  didChangeDependencies() {
    final appSettings = Provider.of<AppSettings>(context, listen: false);

    _serverUrlController.text = appSettings.backupServerUrl;
    _usernameController.text = appSettings.backupUsername;
    _pathAndFilenameController.text = appSettings.backupPathAndFilename;

    super.didChangeDependencies();
  }

  Dio _initializeDio() {
    final encoded =
        utf8.encode('${_usernameController.text}:${_passwordController.text}');
    final basicAuth = 'Basic ${base64Encode(encoded)}';

    Dio dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 5),
        headers: {'authorization': basicAuth},
        responseType: ResponseType.plain,
      ),
    );

    return dio;
  }

  _showError(BuildContext context, {String? text}) {
    // STandard error text
    text ??= 'An unknown error has occured';

    // Show error
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(text),
      ),
    );

    // Stop loading spinner
    setState(() {
      _isCreatingBackup = false;
    });
  }

  _backup() async {
    if (!_isBackupServerDataPresent) {
      return;
    }

    final hasUserConfirmedPasswords = await _showPasswordDialog();

    if (hasUserConfirmedPasswords == true) {
      // Show creating backup loading spinner
      setState(() {
        _isCreatingBackup = true;
      });

      Dio dio = _initializeDio();

      final backupData = BackupData(
        customFood: await CustomFoodDatabaseService.customFoods,
        trackedFood: await TrackedFoodDatabaseService.trackedFoods,
        completedDays: await CompleteDaysDatabaseService.completedDays,
      );

      final encodedBackupData = json.encode(backupData.toJson());
      final encryptedData = EncryptionService.encrypt(
        encodedBackupData,
        _encryptionPasswordController.text,
      );

      // Check if server URL is reachable (without additional folder)
      try {
        await dio.request(
          _serverUrlController.text,
          options: Options(
            method: 'PROPFIND',
          ),
        );
      } on DioException catch (e) {
        if (!mounted) return;

        String? errorMessage;

        if (e.error is SocketException) {
          errorMessage = 'The server address is unknown';
        } else if (e.type == DioExceptionType.connectionTimeout) {
          errorMessage = 'Timeout while trying to reach the address';
        } else if (e.response?.statusCode == 401) {
          errorMessage = 'WebDAV server username or password incorrect';
        }

        return _showError(context, text: errorMessage);
      } catch (e) {
        if (!mounted) return;

        return _showError(context);
      }

      // We know the server exists and we have valid credentials. Now look up the target folder
      try {
        Response res = await dio.request(
          _backupTargetPathWithoutFilename,
          options: Options(
            method: 'PROPFIND',
          ),
        );

        if (res.statusCode == 207) {
          // Target backup folder already exists: All is fine!
        } else if (res.statusCode == 404) {
          // Target backup folder does not exist

          // Create the folder
          try {
            await dio.request(
              _backupTargetPathWithoutFilename,
              options: Options(method: 'MKCOL'),
            );
          } catch (e) {
            // Error while creating the target folder for the backup
            if (!mounted) return;

            return _showError(context);
          }
        }
      } catch (e) {
        // Error while checking wether target backup folder exists or not
        if (!mounted) return;

        return _showError(context);
      }

      // Backup folder is accessible and does exist: Now upload backup to WebDAV share!
      try {
        await dio.put(_backupTargetPathWithFilename, data: encryptedData);

        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Successfully created backup.\nExported ${backupData.customFood?.length ?? 0} custom foods and ${backupData.trackedFood?.length ?? 0} tracked foods',
            ),
          ),
        );
      } catch (e) {
        // Error while uploading backup
        if (!mounted) return;

        return _showError(context);
      }

      // Backup done, hide loading spinner
      setState(() {
        _isCreatingBackup = false;
      });
    }
  }

  _restore() async {
    if (!_isBackupServerDataPresent) {
      return;
    }

    final hasUserConfirmedPasswords = await _showPasswordDialog();

    if (hasUserConfirmedPasswords == true) {
      Dio dio = _initializeDio();

      try {
        String decryptedString;
        BackupData backupData;

        if (!mounted) return;

        final customFoodProvider =
            Provider.of<CustomFoodProvider>(context, listen: false);
        final trackedFoodProvider =
            Provider.of<TrackedFoodProvider>(context, listen: false);

        await dio.get(_backupTargetPathWithFilename).then((value) => {
              decryptedString = EncryptionService.decrypt(
                value.toString(),
                _encryptionPasswordController.text,
              ),
              backupData = BackupData.fromJson(json.decode(decryptedString)),
              if (backupData.customFood != null)
                {
                  for (var customFood in backupData.customFood!)
                    {
                      customFoodProvider.addFood(customFood),
                    },
                },
              if (backupData.trackedFood != null)
                {
                  for (var trackedFood in backupData.trackedFood!)
                    {
                      trackedFoodProvider.addEatenFood(trackedFood),
                    },
                },
              if (backupData.completedDays != null)
                {
                  for (var completedDay in backupData.completedDays!)
                    {
                      CompleteDaysDatabaseService.insert(completedDay),
                    },
                },
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      'Successfully restored backup.\nImported ${backupData.customFood?.length ?? 0} custom foods and ${backupData.trackedFood?.length ?? 0} tracked foods'),
                ),
              ),
            });
      } on DioException catch (e) {
        // In case something went wrong with the WebDAV part

        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
                'Error ${e.response?.statusCode}: ${e.response?.statusMessage}'),
          ),
        );
      } on Error catch (e) {
        // In case something went wrong with decryption, etc.

        if (!mounted) return;

        String errorText;

        if (e.toString() ==
            'Invalid argument(s): Invalid or corrupted pad block') {
          errorText =
              'Something went wrong. Is the decryption password correct?';
        } else {
          errorText = 'Error while restoring backup: $e';
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(errorText),
          ),
        );
      }
    }
  }

  _saveBackupServerSettings() {
    final appSettings = Provider.of<AppSettings>(context, listen: false);

    appSettings.backupServerUrl = _serverUrlController.text;
    appSettings.backupUsername = _usernameController.text;
    appSettings.backupPathAndFilename = _pathAndFilenameController.text;
  }

  _clearBackupServerUrl() {
    final appSettings = Provider.of<AppSettings>(context, listen: false);
    appSettings.clearBackupServerUrl();
  }

  _clearBackupUsername() {
    final appSettings = Provider.of<AppSettings>(context, listen: false);
    appSettings.clearBackupUsername();
  }

  _resetBackupPathAndFilename() {
    final appSettings = Provider.of<AppSettings>(context, listen: false);
    appSettings.clearBackupPathAndFilename();
  }

  Future<void> _showSettingsDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('WebDAV server settings'),
          insetPadding: const EdgeInsets.all(16.0),
          contentPadding: const EdgeInsets.all(16.0),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Form(
                key: _serverSettingsFormKey,
                child: AutofillGroup(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.cloud),
                          labelText: 'Server URL',
                          hintText: 'https://',
                          suffixIcon: IconButton(
                            onPressed: () => {
                              _serverUrlController.text = '',
                              _clearBackupServerUrl(),
                            },
                            icon: const Icon(Icons.clear),
                          ),
                        ),
                        controller: _serverUrlController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a server address';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        autofillHints: const [AutofillHints.username],
                        decoration: InputDecoration(
                          icon: const Icon(Icons.person),
                          labelText: 'Username',
                          suffixIcon: IconButton(
                            onPressed: () => {
                              _usernameController.text = '',
                              _clearBackupUsername(),
                            },
                            icon: const Icon(Icons.clear),
                          ),
                        ),
                        controller: _usernameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a username';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.folder),
                          labelText: 'Path and filename',
                          hintText: '/Energize/backup.json.aes',
                          suffixIcon: IconButton(
                            onPressed: () => {
                              _pathAndFilenameController.text =
                                  '/Energize/backup.json.aes',
                              _resetBackupPathAndFilename(),
                            },
                            icon: const Icon(Icons.clear),
                          ),
                        ),
                        controller: _pathAndFilenameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a path/filename';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => {
                if (_serverSettingsFormKey.currentState!.validate())
                  {
                    _saveBackupServerSettings(),
                    Navigator.of(context).pop(),
                  },
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  /// Returns true if clicked on OK
  Future<bool?> _showPasswordDialog() async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Please enter passwords'),
          insetPadding: const EdgeInsets.all(16.0),
          contentPadding: const EdgeInsets.all(16.0),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Form(
                key: _passwordsFormKey,
                child: AutofillGroup(
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        autofillHints: const [AutofillHints.password],
                        obscureText: true,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.password),
                          labelText: 'WebDAV server password',
                        ),
                        controller: _passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the password';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.password),
                          labelText: 'Encryption Password',
                        ),
                        controller: _encryptionPasswordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter an encryption/decryption password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Please note the encryption password. You won\'t be able to restore your data without it.',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_passwordsFormKey.currentState!.validate()) {
                  Navigator.of(context).pop(true);
                }
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  bool get _isBackupServerDataPresent {
    final appSettings = Provider.of<AppSettings>(context, listen: false);

    if (appSettings.backupServerUrl.isEmpty ||
        appSettings.backupUsername.isEmpty ||
        appSettings.backupPathAndFilename.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Please click on the settings icon first and setup a WebDAV server.',
          ),
        ),
      );
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.backupAndRestore),
        actions: [
          IconButton(
            onPressed: () => _showSettingsDialog(),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
              child: InfoCard(
                message:
                    'Warning: Currently in alpha. You can backup and restore tracked and custom food and completed days at the moment. Settings, personalizations, targets, etc. are still missing. The encryption method might change in the future so it is not guaranteed that you can restore old backups within newer versions of Energize.',
                icon: Icon(Icons.warning),
                color: Colors.red,
              ),
            ),
            GridView.count(
              padding: const EdgeInsets.all(12.0),
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              children: [
                SelectActionCard(
                  icon: Icons.cloud_upload,
                  title: 'Create encrypted backup',
                  onTap: _isCreatingBackup ? null : () => _backup(),
                  isLoading: _isCreatingBackup,
                ),
                SelectActionCard(
                  icon: Icons.cloud_download,
                  title: 'Restore encrypted backup',
                  onTap: () {
                    _restore();
                  },
                  isLoading: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
