import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../providers/app_settings_provider.dart';
import '../../services/backup_service.dart';
import '../../services/webdav_service.dart';
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

  /// FormKey for mask of WebDAV Backup and Restore dialog
  final _webDAVBackupOrRestoreFormKey = GlobalKey<FormState>();
  // final _passwordsFormKey = GlobalKey<FormState>();

  /// FormKey for only the encryption password (local backup/restore)
  final _encryptionPasswordOnlyFormKey = GlobalKey<FormState>();
  final _serverUrlController = TextEditingController();
  final _usernameController = TextEditingController();
  final _pathAndFilenameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _encryptionPasswordController = TextEditingController();

  @override
  didChangeDependencies() {
    final appSettings =
        Provider.of<AppSettingsProvider>(context, listen: false);

    _serverUrlController.text = appSettings.backupServerUrl;
    _usernameController.text = appSettings.backupUsername;
    _pathAndFilenameController.text = appSettings.backupPathAndFilename;

    super.didChangeDependencies();
  }

  void _showError(BuildContext context, {String? text}) {
    // Default error text
    text ??= AppLocalizations.of(context)!.unknownErrorText;

    // Show error
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text.replaceAll('Exception: ', ''))),
    );

    // Stop loading spinner
    setState(() {
      _isBusy = false;
    });
  }

  /// Create an encrypted WebDAV backup
  _createWebDAVBackup(BuildContext context) async {
    // Ask for WebDAV server data and encryption password
    final wantsBackup = await _showWebDAVBackupOrRestoreDialog();

    if (!context.mounted) {
      return;
    }

    // Do backup only if confirmed
    if (wantsBackup == true) {
      // Show progress bar
      setState(() {
        _isBusy = true;
      });

      final encryptionPassword = _encryptionPasswordController.text;
      final createBackupReturnData =
          await BackupService.createBackup(encryptionPassword, context);
      final encryptedData = createBackupReturnData.encryptedData;
      final backupData = createBackupReturnData.backupData;

      // Create WebDAV backup

      bool backupSucceeded = true; // Just an assumption so far

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
        if (!context.mounted) return;
        _showError(context, text: exception.toString());
      } finally {
        // Backup done or failed, hide progress bar
        setState(() {
          _isBusy = false;
        });
      }

      if (backupSucceeded) {
        if (!context.mounted) return;

        // Show successful backup message
        final numberOfCustomFoods = backupData.customFood?.length ?? 0;
        final numberOfTrackedFoods = backupData.trackedFood?.length ?? 0;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '''
${AppLocalizations.of(context)!.successfullyCreatedBackup}
${AppLocalizations.of(context)!.exportedNumberOfFoodsMessage(
                numberOfCustomFoods,
                numberOfTrackedFoods,
              )}''',
            ),
          ),
        );
      }
    }
  }

  /// Restore an encrypted WebDAV backup
  _restoreWebDAVBackup(BuildContext context) async {
    // Ask for WebDAV server data and encryption password
    final wantsRestore = await _showWebDAVBackupOrRestoreDialog(
      isForBackup: false,
    );

    // Do backup only if confirmed
    if (wantsRestore == true) {
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
        if (!context.mounted) return;
        _showError(context, text: webDAVRestoreError.toString());

        // End function
        return;
      }

      if (!context.mounted) return;

      // Restore downloaded backup
      try {
        final encryptedBackupString = readBackup.toString();
        final backupData = await BackupService.restoreBackup(
          encryptedBackupString,
          _encryptionPasswordController.text,
          context,
        );

        // Show successful backup message
        final numberOfCustomFoods = backupData.customFood?.length ?? 0;
        final numberOfTrackedFoods = backupData.trackedFood?.length ?? 0;

        if (!context.mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '''
${AppLocalizations.of(context)!.successfullyRestoredBackup}
${AppLocalizations.of(context)!.importedNumberOfFoodsMessage(
                numberOfCustomFoods,
                numberOfTrackedFoods,
              )}''',
            ),
          ),
        );
      } catch (exception) {
        // In case something went wrong with decryption, etc.
        _showError(context, text: exception.toString());
      }
    }
  }

  /// Save setting for connection to the WebDAV server (excl. passwords)
  ///
  /// Passwords could in future be saved to Keystore
  /// or better handling with Password managers could be evaluated
  _saveWebDAVServerSettings() {
    final appSettings =
        Provider.of<AppSettingsProvider>(context, listen: false);

    appSettings.backupServerUrl = _serverUrlController.text;
    appSettings.backupUsername = _usernameController.text;
    appSettings.backupPathAndFilename = _pathAndFilenameController.text;
  }

  _clearBackupServerUrl() {
    final appSettings =
        Provider.of<AppSettingsProvider>(context, listen: false);
    appSettings.clearBackupServerUrl();
  }

  _clearBackupUsername() {
    final appSettings =
        Provider.of<AppSettingsProvider>(context, listen: false);
    appSettings.clearBackupUsername();
  }

  _resetBackupPathAndFilename() {
    final appSettings =
        Provider.of<AppSettingsProvider>(context, listen: false);
    appSettings.clearBackupPathAndFilename();
  }

  /// Dialog just for asking for needed data for backup/restore with WebDAV
  /// Returns true if clicked on save and values seem valid
  /// bool isForBackup switches between backup and restore texts and icons
  Future<bool?> _showWebDAVBackupOrRestoreDialog({isForBackup = true}) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return Dialog.fullscreen(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                isForBackup
                    ? AppLocalizations.of(context)!.createWebDAVBackup
                    : AppLocalizations.of(context)!.restoreWebDAVBackup,
              ),
              centerTitle: false,
              automaticallyImplyLeading: false,
              leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close),
              ),
              actions: <Widget>[
                IconButton(
                  onPressed: () {
                    // Only close dialog of values successfully validated
                    if (_webDAVBackupOrRestoreFormKey.currentState!
                        .validate()) {
                      // Save validated settings
                      _saveWebDAVServerSettings();
                      // Return true, indicating confirmation
                      Navigator.of(context).pop(true);
                    }
                  },
                  icon: Icon(
                    isForBackup ? Icons.cloud_upload : Icons.cloud_download,
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _webDAVBackupOrRestoreFormKey,
                  child: AutofillGroup(
                    child: Wrap(
                      runSpacing: 16,
                      children: [
                        Text(AppLocalizations.of(context)!.webDAVSettings),
                        TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            icon: const Icon(Icons.cloud),
                            labelText: AppLocalizations.of(context)!.serverURL,
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
                              return AppLocalizations.of(context)!
                                  .fieldMandatory;
                              // Simple check for URI
                            } else if (Uri.tryParse(value) == null) {
                              return AppLocalizations.of(context)!.invalidURL;
                            } else {
                              // More deep host check
                              if (!(value.startsWith('http://') ||
                                      value.startsWith('https://')) ||
                                  Uri.parse(value).host.isEmpty) {
                                return AppLocalizations.of(context)!.invalidURL;
                              }
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          autofillHints: const [AutofillHints.username],
                          decoration: InputDecoration(
                            filled: true,
                            icon: const Icon(Icons.person),
                            labelText: AppLocalizations.of(context)!.username,
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
                              return AppLocalizations.of(context)!
                                  .fieldMandatory;
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          autofillHints: const [AutofillHints.password],
                          obscureText: true,
                          decoration: InputDecoration(
                            filled: true,
                            icon: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                            ),
                            labelText: AppLocalizations.of(context)!.password,
                          ),
                          controller: _passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppLocalizations.of(context)!
                                  .fieldMandatory;
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            icon: const Icon(Icons.folder),
                            labelText:
                                AppLocalizations.of(context)!.pathAndFilename,
                            hintText:
                                '/${BackupAndRestoreSubPage.defaultBackupPath}/${BackupAndRestoreSubPage.defaultBackupFileName}',
                            suffixIcon: IconButton(
                              onPressed: () {
                                _pathAndFilenameController.text =
                                    '/${BackupAndRestoreSubPage.defaultBackupPath}/${BackupAndRestoreSubPage.defaultBackupFileName}';
                                _resetBackupPathAndFilename();
                              },
                              icon: const Icon(Icons.clear),
                            ),
                          ),
                          controller: _pathAndFilenameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppLocalizations.of(context)!
                                  .fieldMandatory;
                            }
                            return null;
                          },
                        ),
                        Text(
                          AppLocalizations.of(context)!.energizeBackup(
                            AppLocalizations.of(context)!.appName,
                          ),
                        ),
                        TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            icon: const Icon(Icons.lock),
                            filled: true,
                            labelText: AppLocalizations.of(context)!.password,
                          ),
                          controller: _encryptionPasswordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppLocalizations.of(context)!
                                  .fieldMandatory;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        Text(
                          AppLocalizations.of(context)!.backupPasswordNotice,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
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
                ? AppLocalizations.of(context)!.createLocalBackup
                : AppLocalizations.of(context)!.restoreLocalBackup,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                key: _encryptionPasswordOnlyFormKey,
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    icon: const Icon(Icons.lock),
                    labelText: AppLocalizations.of(context)!.password,
                  ),
                  controller: _encryptionPasswordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!.fieldMandatory;
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Text(
                AppLocalizations.of(context)!.backupPasswordNotice,
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
                if (_encryptionPasswordOnlyFormKey.currentState!.validate()) {
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
  _createLocalEncryptedBackup(BuildContext context) async {
    try {
      // Ask for encryption password
      final dialogConfirmed = await _showEncryptionPasswordInputDialog();

      // Check whether dialog was cancelled
      if (dialogConfirmed != true) {
        return;
      }

      if (!context.mounted) return;

      // Show progress bar
      setState(() {
        _isBusy = true;
      });

      final encryptionPassword = _encryptionPasswordController.text;
      final backup = await BackupService.createBackup(
        encryptionPassword,
        context,
      );
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

      if (!context.mounted) return;

      // Show successful backup message
      final numberOfCustomFoods = backup.backupData.customFood?.length ?? 0;
      final numberOfTrackedFoods = backup.backupData.trackedFood?.length ?? 0;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '''
${AppLocalizations.of(context)!.successfullyCreatedBackup}
${AppLocalizations.of(context)!.exportedNumberOfFoodsMessage(
              numberOfCustomFoods,
              numberOfTrackedFoods,
            )}''',
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
  _restoreLocalEncryptedBackup(BuildContext context) async {
    // Pick backup file to restore
    final FilePickerResult? pickerResult =
        await FilePicker.platform.pickFiles();
    final pickedPath = pickerResult?.files.single.path;

    // Picking was cancelled, bye!
    if (pickedPath == null) {
      return;
    }

    // Ask for decryption password
    final dialogConfirmed = await _showEncryptionPasswordInputDialog(
      forEncrypting: false,
    );

    // Check whether dialog was cancelled
    if (dialogConfirmed != true) {
      return;
    }

    final encryptionPassword = _encryptionPasswordController.text;

    // Prepare file
    final File file = File(pickedPath);

    // Show progress bar
    setState(() {
      _isBusy = true;
    });

    if (!mounted) return;

    // Restore backup
    try {
      final fileAsString = await file.readAsString(encoding: utf8);

      if (!context.mounted) return;

      final backupData = await BackupService.restoreBackup(
        fileAsString,
        encryptionPassword,
        context,
      );

      // Show successful backup message
      final numberOfCustomFoods = backupData.customFood?.length ?? 0;
      final numberOfTrackedFoods = backupData.trackedFood?.length ?? 0;

      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '''
${AppLocalizations.of(context)!.successfullyRestoredBackup}
${AppLocalizations.of(context)!.importedNumberOfFoodsMessage(
              numberOfCustomFoods,
              numberOfTrackedFoods,
            )}''',
          ),
        ),
      );
    } on FileSystemException {
      if (!context.mounted) return;

      _showError(context, text: 'The file could not be loaded');
    } catch (exception) {
      // In case something went wrong with decryption, etc.
      if (!context.mounted) return;

      _showError(context, text: exception.toString());
    } finally {
      // Restore probably done, hide progress bar
      setState(() {
        _isBusy = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.backupAndRestore),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            if (_isBusy) const LinearProgressIndicator(),
            Column(
              children: [
                GridView.count(
                  padding: const EdgeInsets.all(12.0),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  children: [
                    SelectActionCard(
                      icon: Icons.cloud_upload,
                      title: AppLocalizations.of(context)!.createWebDAVBackup,
                      onTap:
                          _isBusy ? null : () => _createWebDAVBackup(context),
                    ),
                    SelectActionCard(
                      icon: Icons.cloud_download,
                      title: AppLocalizations.of(context)!.restoreWebDAVBackup,
                      onTap:
                          _isBusy ? null : () => _restoreWebDAVBackup(context),
                    ),
                    SelectActionCard(
                      icon: Icons.file_upload,
                      title: AppLocalizations.of(context)!.createLocalBackup,
                      onTap: _isBusy
                          ? null
                          : () => _createLocalEncryptedBackup(context),
                    ),
                    SelectActionCard(
                      icon: Icons.file_download,
                      title: AppLocalizations.of(context)!.restoreLocalBackup,
                      onTap: _isBusy
                          ? null
                          : () => _restoreLocalEncryptedBackup(context),
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
