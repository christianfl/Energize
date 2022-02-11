import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart' as enc;
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';

import '../../models/backup_data.dart';
import '../../providers/app_settings.dart';
import '../../providers/custom_food_provider.dart';
import '../../providers/tracked_food_provider.dart';
import '../../services/custom_foods_database_service.dart';
import '../../services/tracked_foods_database_service.dart';
import '../../widgets/info_card.dart';
import '../../widgets/select_action_card.dart';

class BackupAndRestoreSubPage extends StatefulWidget {
  static const routeName = '/settings/backup-and-restore';

  @override
  _BackupAndRestoreSubPageState createState() =>
      _BackupAndRestoreSubPageState();
}

class _BackupAndRestoreSubPageState extends State<BackupAndRestoreSubPage> {
  final _serverSettingsFormKey = GlobalKey<FormState>();
  final _passwordsFormKey = GlobalKey<FormState>();
  var _serverUrlController = TextEditingController();
  var _usernameController = TextEditingController();
  var _pathAndFilenameController = TextEditingController();
  var _passwordController = TextEditingController();
  var _encryptionPasswordController = TextEditingController();

  get _backupTargetPathWithoutFilename =>
      '${_serverUrlController.text}${path.dirname(_pathAndFilenameController.text)}';

  get _backupTargetPathWithFilename =>
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
    String basicAuth = 'Basic ' +
        base64Encode(utf8
            .encode('${_usernameController.text}:${_passwordController.text}'));

    Dio dio = Dio();
    dio.options.headers['authorization'] = basicAuth;

    return dio;
  }

  /// Returns a 256bit AES key based on a given keyphrase
  enc.Key _generateAesKey(String keyphrase) {
    var bytes = utf8.encode(keyphrase);
    var digest = sha256.convert(bytes);
    Uint8List digestAsUint8List = Uint8List.fromList(digest.bytes);
    final key = enc.Key(digestAsUint8List);
    return key;
  }

  /// Input: Plaintext, random IV and SHA256 derived from password input field
  /// Returns: Base64(IV)Base64(ciphertext)
  String _encryptData(String plaintext) {
    final key = _generateAesKey(_encryptionPasswordController.text);

    // Generate iv
    final iv = enc.IV.fromSecureRandom(16);

    // Make encrypter ready and encrypt
    final encrypter = enc.Encrypter(enc.AES(key));
    final ciphertext = encrypter.encrypt(plaintext, iv: iv);
    final encrypted = '${iv.base64}${ciphertext.base64}';

    return encrypted;
  }

  /// Input: Base64(IV)Base64(ciphertext)
  /// Returns: Plaintext
  String _decryptData(String data) {
    final key = _generateAesKey(_encryptionPasswordController.text);

    // Get IV
    final ivBase64String = data.substring(0, 24);
    final iv = enc.IV.fromBase64(ivBase64String);

    // Get ciphertext (Base64)
    final ciphertextBase64String = data.substring(24);
    final encrypted = enc.Encrypted.fromBase64(ciphertextBase64String);

    // Make encrypter ready and decrypt
    final encrypter = enc.Encrypter(enc.AES(key));
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    return decrypted;
  }

  _backup() async {
    if (_isBackupServerDataPresent() == false) {
      return;
    }

    final hasUserConfirmedPasswords = await _showPasswordDialog();

    if (hasUserConfirmedPasswords == true) {
      Dio dio = _initializeDio();

      final backupData = BackupData(
        customFood: await CustomFoodDatabaseService.customFoods,
        trackedFood: await TrackedFoodDatabaseService.trackedFoods,
      );

      final encodedBackupData = json.encode(backupData.toJson());
      final encryptedData = _encryptData(encodedBackupData);

      // Create folder of path if not existing
      try {
        await dio.request(_backupTargetPathWithoutFilename,
            options: Options(method: "MKCOL"));
      } on DioError {
        // Folder possibly already created
      }

      try {
        await dio.put(_backupTargetPathWithFilename, data: encryptedData).then(
              (response) => {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        'Successfully created backup.\nExported ${backupData.customFood?.length ?? 0} custom foods and ${backupData.trackedFood?.length ?? 0} tracked foods'),
                  ),
                ),
              },
            );
      } on DioError catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: e.message == 'Http status error [401]'
                ? Text('Username or password incorrect')
                : Text(e.message),
          ),
        );
      }
    }
  }

  _restore() async {
    if (_isBackupServerDataPresent() == false) {
      return;
    }

    final hasUserConfirmedPasswords = await _showPasswordDialog();

    if (hasUserConfirmedPasswords == true) {
      Dio dio = _initializeDio();

      try {
        String decryptedString;
        BackupData backupData;

        final customFoodProvider =
            Provider.of<CustomFoodProvider>(context, listen: false);
        final trackedFoodProvider =
            Provider.of<TrackedFoodProvider>(context, listen: false);

        await dio.get(_backupTargetPathWithFilename).then((value) => {
              decryptedString = _decryptData(value.toString()),
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
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      'Successfully restored backup.\nImported ${backupData.customFood?.length ?? 0} custom foods and ${backupData.trackedFood?.length ?? 0} tracked foods'),
                ),
              ),
            });
      } on DioError catch (e) {
        // In case something went wrong with the WebDAV part

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
                'Error ${e.response?.statusCode}: ${e.response?.statusMessage}'),
          ),
        );
      } on Error catch (e) {
        // In case something went wrong with decryption, etc.

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
                          icon: Icon(Icons.cloud),
                          labelText: 'Server URL',
                          hintText: "https://",
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
                        autofillHints: [AutofillHints.username],
                        decoration: InputDecoration(
                          icon: Icon(Icons.person),
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
                          icon: Icon(Icons.folder),
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
                        autofillHints: [AutofillHints.password],
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
                        style: Theme.of(context).textTheme.caption,
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
                if (_passwordsFormKey.currentState!.validate())
                  {
                    Navigator.of(context).pop(true),
                  },
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  bool _isBackupServerDataPresent() {
    final appSettings = Provider.of<AppSettings>(context, listen: false);

    if (appSettings.backupServerUrl.isEmpty ||
        appSettings.backupUsername.isEmpty ||
        appSettings.backupPathAndFilename.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
              'Please click on the settings icon first and setup a WebDAV server.'),
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
        title: Text('Backup & Restore'),
        actions: [
          IconButton(
            onPressed: () => _showSettingsDialog(),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InfoCard(
                message:
                    'Warning: Currently in alpha. You can only backup and restore tracked and custom food at the moment.',
                icon: const Icon(Icons.warning),
                color: Colors.red,
              ),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                children: [
                  SelectActionCard(
                    icon: Icons.cloud_upload,
                    title: 'Create encrypted backup',
                    onTap: () {
                      _backup();
                    },
                  ),
                  SelectActionCard(
                    icon: Icons.cloud_download,
                    title: 'Restore encrypted backup',
                    onTap: () {
                      _restore();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
