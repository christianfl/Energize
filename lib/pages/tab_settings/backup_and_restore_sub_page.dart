import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../providers/app_settings.dart';
import '../../services/backup_service.dart';
import '../../services/webdav_service.dart';
import '../../widgets/info_card.dart';
import '../../widgets/select_action_card.dart';

class BackupAndRestoreSubPage extends StatefulWidget {
  static const routeName = '/settings/backup-and-restore';
  static const defaultBackupFileName = 'backup.json.aes';
  static const defaultBackupPath = 'Energize';

  const BackupAndRestoreSubPage({super.key});

  @override
  BackupAndRestoreSubPageState createState() => BackupAndRestoreSubPageState();
}

class BackupAndRestoreSubPageState extends State<BackupAndRestoreSubPage> {
  /// Indicates whether a backup or restore is currently running
  bool _isBusy = false;
  final _serverSettingsFormKey = GlobalKey<FormState>();
  final _passwordsFormKey = GlobalKey<FormState>();

  /// FormKey for only the encryption passphrase (local backup/restore)
  final _encryptionPassphraseOnlyFormKey = GlobalKey<FormState>();
  final _serverUrlController = TextEditingController();
  final _usernameController = TextEditingController();
  final _pathAndFilenameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _encryptionPasswordController = TextEditingController();

  @override
  didChangeDependencies() {
    final appSettings = Provider.of<AppSettings>(context, listen: false);

    _serverUrlController.text = appSettings.backupServerUrl;
    _usernameController.text = appSettings.backupUsername;
    _pathAndFilenameController.text = appSettings.backupPathAndFilename;

    super.didChangeDependencies();
  }

  void _showError(BuildContext context, {String? text}) {
    // Default error text
    text ??= 'An unknown error has occured';

    // Show error
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(text.replaceAll('Exception: ', '')),
      ),
    );

    // Stop loading spinner
    setState(() {
      _isBusy = false;
    });
  }

  /// Create an encrypted WebDAV backup
  _createWebDAVBackup() async {
    if (!_isBackupServerDataPresent) {
      return;
    }

    final hasUserConfirmedPasswords = await _showPasswordDialog();

    if (hasUserConfirmedPasswords == true) {
      // Show creating backup loading spinner
      setState(() {
        _isBusy = true;
      });

      final encryptionPassword = _encryptionPasswordController.text;
      final createBackupReturnData =
          await BackupService.createBackup(encryptionPassword);
      final encryptedData = createBackupReturnData.encryptedData;
      final backupData = createBackupReturnData.backupData;

      // Create WebDAV backup

      bool backupSucceeded = true;

      try {
        await WebDAVService.writeFile(
          username: _usernameController.text,
          password: _passwordController.text,
          url: _serverUrlController.text,
          pathAndFilename: _pathAndFilenameController.text,
          data: encryptedData,
        );
      } catch (exception) {
        backupSucceeded = false;
        if (!mounted) return;
        _showError(context, text: exception.toString());
      } finally {
        // Backup done or failed, hide progress bar
        setState(() {
          _isBusy = false;
        });
      }

      if (backupSucceeded) {
        if (!mounted) return;

        // Show successful backup message
        final numberOfCustomFoods = backupData.customFood?.length ?? 0;
        final numberOfTrackedFoods = backupData.trackedFood?.length ?? 0;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '''
Successfully created backup.
Exported $numberOfCustomFoods custom foods and $numberOfTrackedFoods tracked foods''',
            ),
          ),
        );
      }
    }
  }

  /// Restore an encrypted WebDAV backup
  _restoreWebDAVBackup() async {
    if (!_isBackupServerDataPresent) {
      return;
    }

    final hasUserConfirmedPasswords = await _showPasswordDialog();

    if (hasUserConfirmedPasswords == true) {
      Object readBackup;

      // Read file from WebDAV
      try {
        readBackup = await WebDAVService.readFile(
          username: _usernameController.text,
          password: _passwordController.text,
          url: _serverUrlController.text,
          pathAndFilename: _pathAndFilenameController.text,
        );
      } catch (webDAVRestoreError) {
        if (!mounted) return;
        _showError(context, text: webDAVRestoreError.toString());

        // End function
        return;
      }

      if (!mounted) return;

      // Restore downloaded backup
      try {
        final encryptedBackupString = readBackup.toString();
        final backupData = BackupService.restoreBackup(
          encryptedBackupString,
          _encryptionPasswordController.text,
          context,
        );

        // Show successful backup message
        final numberOfCustomFoods = backupData.customFood?.length ?? 0;
        final numberOfTrackedFoods = backupData.trackedFood?.length ?? 0;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '''
Successfully restored backup.
Imported $numberOfCustomFoods custom foods and $numberOfTrackedFoods tracked foods''',
            ),
          ),
        );
      } catch (e) {
        // In case something went wrong with decryption, etc.
        String errorText;

        if (e.toString() ==
            'Invalid argument(s): Invalid or corrupted pad block') {
          errorText =
              'Something went wrong. Is the decryption password correct?';
        } else {
          errorText = 'Error while restoring backup';
        }

        _showError(context, text: errorText);
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
                          hintText:
                              '/${BackupAndRestoreSubPage.defaultBackupPath}/${BackupAndRestoreSubPage.defaultBackupFileName}',
                          suffixIcon: IconButton(
                            onPressed: () => {
                              _pathAndFilenameController.text =
                                  '/${BackupAndRestoreSubPage.defaultBackupPath}/${BackupAndRestoreSubPage.defaultBackupFileName}',
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
              child: Text(
                MaterialLocalizations.of(context).cancelButtonLabel,
              ),
            ),
            TextButton(
              onPressed: () {
                if (_passwordsFormKey.currentState!.validate()) {
                  Navigator.of(context).pop(true);
                }
              },
              child: Text(
                MaterialLocalizations.of(context).okButtonLabel,
              ),
            ),
          ],
        );
      },
    );
  }

  /// Asks for encryption/decryption password
  /// Used when:
  /// - creating an encrypted local backup
  /// - restoring an encrypted local backup
  Future<bool?> _showEncryptionPasswordInputDialog({
    bool forEncrypting = true,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            forEncrypting
                ? 'Create local encrypted backup'
                : 'Restore local encrypted backup',
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                key: _encryptionPassphraseOnlyFormKey,
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.password),
                    labelText: forEncrypting
                        ? 'Encryption passphrase'
                        : 'Decryption passphrase',
                  ),
                  controller: _encryptionPasswordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a passphrase';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Without the encryption password, it is impossible to restore a backup.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
                return;
              },
              child: Text(
                MaterialLocalizations.of(context).cancelButtonLabel,
              ),
            ),
            TextButton(
              onPressed: () {
                if (_encryptionPassphraseOnlyFormKey.currentState!.validate()) {
                  Navigator.of(context).pop(true);
                }
              },
              child: Text(MaterialLocalizations.of(context).okButtonLabel),
            ),
          ],
        );
      },
    );
  }

  /// Creates a local encrypted backup and saves it via native file picker
  _createLocalEncryptedBackup() async {
    try {
      // Ask for encryption passphrase
      final dialogConfirmed = await _showEncryptionPasswordInputDialog();

      // Check whether dialog was cancelled
      if (dialogConfirmed != true) {
        return;
      }

      // Show progress bar
      setState(() {
        _isBusy = true;
      });

      final encryptionPassword = _encryptionPasswordController.text;
      final backup = await BackupService.createBackup(encryptionPassword);
      final encryptedBackupDataAsBytes =
          Uint8List.fromList(backup.encryptedData.codeUnits);

      // Pick file destination
      final String? path = await FilePicker.platform.saveFile(
        fileName: BackupAndRestoreSubPage.defaultBackupFileName,
        bytes: encryptedBackupDataAsBytes,
      );

      // Backup probably done, hide progress bar
      setState(() {
        _isBusy = false;
      });

      // Picking was cancelled, bye!
      if (path == null) {
        return;
      }

      if (!mounted) return;

      // Show successful backup message
      final numberOfCustomFoods = backup.backupData.customFood?.length ?? 0;
      final numberOfTrackedFoods = backup.backupData.trackedFood?.length ?? 0;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '''
Successfully created backup.
Exported $numberOfCustomFoods custom foods and $numberOfTrackedFoods tracked foods''',
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      // Error while creating backup
      return _showError(context);
    }
  }

  /// Restores a local encrypted backup picked via native file picker
  _restoreLocalEncryptedBackup() async {
    // Ask for encryption passphrase
    final dialogConfirmed = await _showEncryptionPasswordInputDialog();

    // Check whether dialog was cancelled
    if (dialogConfirmed != true) {
      return;
    }

    // Pick file destination
    FilePickerResult? pickerResult = await FilePicker.platform.pickFiles();
    final pickedPath = pickerResult?.files.single.path;

    // Picking was cancelled, bye!
    if (pickedPath == null) {
      return;
    }

    // Prepare file
    File file = File(pickedPath);

    // Show progress bar
    setState(() {
      _isBusy = true;
    });

    final fileAsString = await file.readAsString(encoding: utf8);
    final encryptionPassword = _encryptionPasswordController.text;

    if (!mounted) return;

    // Restore backup
    try {
      final backupData = BackupService.restoreBackup(
        fileAsString,
        encryptionPassword,
        context,
      );

      // Show successful backup message
      final numberOfCustomFoods = backupData.customFood?.length ?? 0;
      final numberOfTrackedFoods = backupData.trackedFood?.length ?? 0;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '''
Successfully restored backup.
Imported $numberOfCustomFoods custom foods and $numberOfTrackedFoods tracked foods''',
          ),
        ),
      );
    } catch (e) {
      // In case something went wrong with decryption, etc.
      String errorText;

      if (e.toString() ==
          'Invalid argument(s): Invalid or corrupted pad block') {
        errorText = 'Something went wrong. Is the decryption password correct?';
      } else {
        errorText = 'Error while restoring backup';
      }

      _showError(context, text: errorText);
    } finally {
      // Restore probably done, hide progress bar
      setState(() {
        _isBusy = false;
      });
    }
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
        child: Stack(
          children: [
            if (_isBusy) const LinearProgressIndicator(),
            Column(
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
                      title: 'Create encrypted WebDAV backup',
                      onTap: _isBusy ? null : () => _createWebDAVBackup(),
                      isLoading: false,
                    ),
                    SelectActionCard(
                      icon: Icons.cloud_download,
                      title: 'Restore encrypted WebDAV backup',
                      onTap: _isBusy ? null : () => _restoreWebDAVBackup(),
                      isLoading: false,
                    ),
                    SelectActionCard(
                      icon: Icons.file_upload,
                      title: 'Create local encrypted backup',
                      onTap:
                          _isBusy ? null : () => _createLocalEncryptedBackup(),
                      isLoading: false,
                    ),
                    SelectActionCard(
                      icon: Icons.file_download,
                      title: 'Restore local encrypted backup',
                      onTap:
                          _isBusy ? null : () => _restoreLocalEncryptedBackup(),
                      isLoading: false,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
