import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart' as enc;

/// Offers methods for encryption and decryption of strings with 256 bit AES
class EncryptionService {
  /// Returns a 256 bit AES key based on a given keyphrase
  static enc.Key _generateAesKey(String keyphrase) {
    final bytes = utf8.encode(keyphrase);
    final digest = sha256.convert(bytes);
    final Uint8List digestAsUint8List = Uint8List.fromList(digest.bytes);
    final key = enc.Key(digestAsUint8List);
    return key;
  }

  /// Returns Encrypter with AES CTR algorithm
  static enc.Encrypter _getEncrypter(enc.Key key) {
    return enc.Encrypter(
      enc.AES(
        key,
        mode: enc.AESMode.ctr,
      ),
    );
  }

  /// Encrypts a given string with a given keyphrase nd random IV
  ///
  /// Returns string in the format: <Base64(IV)><Base64(ciphertext)>
  static String encrypt(
    String plaintext,
    String keyphrase,
  ) {
    final key = _generateAesKey(keyphrase);

    // Generate iv
    final iv = enc.IV.fromSecureRandom(16);

    // Make encrypter ready and encrypt
    final encrypter = _getEncrypter(key);
    final ciphertext = encrypter.encrypt(plaintext, iv: iv);
    final encrypted = '${iv.base64}${ciphertext.base64}';

    return encrypted;
  }

  /// Decrypts a string encrypted with EncryptionService.encrypt()
  ///
  /// Returns plaintext string
  static String decrypt(String data, String keyphrase) {
    final key = _generateAesKey(keyphrase);

    // Get IV
    final ivBase64String = data.substring(0, 24);
    final iv = enc.IV.fromBase64(ivBase64String);

    // Get ciphertext (Base64)
    final ciphertextBase64String = data.substring(24);
    final encrypted = enc.Encrypted.fromBase64(ciphertextBase64String);

    // Make encrypter ready and decrypt
    final encrypter = _getEncrypter(key);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    return decrypted;
  }
}
