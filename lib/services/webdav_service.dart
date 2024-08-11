import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart' as p;

/// Offers methods for reading from and writing to remote WebDAV storage
class WebDAVService {
  /// Initializes the Dio connection
  static Dio _initializeConnection(String username, String password) {
    // Prepare credential formatting
    final credentials = utf8.encode('$username:$password');
    final basicAuth = 'Basic ${base64Encode(credentials)}';

    // Initialize Dio connection with given credentials
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 5),
        headers: {'authorization': basicAuth},
        responseType: ResponseType.plain,
      ),
    );

    return dio;
  }

  /// Writes an arbitrary file to a WebDAV share
  static Future<void> writeFile({
    required String username,
    required String password,
    required String url,
    required String pathAndFilename,
    required Object data,
  }) async {
    // Create Dio connection with given credentials
    final dioConnection = _initializeConnection(username, password);

    // Check if server URL is reachable (without path and filename)
    try {
      await dioConnection.request(
        url,
        options: Options(method: 'PROPFIND'),
      );
    } on DioException catch (dioException) {
      throw Exception(_dioExceptionHandling(dioException));
    } catch (generalException) {
      throw Exception('Error while connecting to remote server');
    }

    // Server URL seems fine
    // We know the server exists and we have valid credentials
    // Now look up the target folder

    // Assemble https://<url>/<path>
    final String urlAndPath = '$url${p.dirname(pathAndFilename)}';

    try {
      final Response res = await dioConnection.request(
        urlAndPath,
        options: Options(
          method: 'PROPFIND',
          // Throw an exception if status code is not 207 or 404
          validateStatus: (status) => status == 207 || status == 404,
        ),
      );

      if (res.statusCode == 207) {
        // Target backup folder already exists: All is fine!
      } else if (res.statusCode == 404) {
        // Target backup folder does not exist: Create it!
        try {
          await dioConnection.request(
            urlAndPath,
            options: Options(method: 'MKCOL'),
          );
        } catch (generalException) {
          throw Exception('Error while creating target folder for backup');
        }
      }
    } catch (generalException) {
      throw ('Error while checking whether target folder exists');
    }

    // Backup folder exists and is accessible: Upload backup to WebDAV share!

    // Assemble https://<url>/<path>/<filename>.<extension>
    final String urlAndPathAndFilename = '$url$pathAndFilename';

    // Write to WebDAV share
    try {
      await dioConnection.put(urlAndPathAndFilename, data: data);
    } catch (generalException) {
      throw Exception('Error while writing backup to WebDAV share');
    }
  }

  /// Reads an arbitrary file from a WebDAV share
  ///
  /// Returns the data which was read
  static Future<Object> readFile({
    required String username,
    required String password,
    required String url,
    required String pathAndFilename,
  }) async {
    // Create Dio connection with given credentials
    final dioConnection = _initializeConnection(username, password);

    // Assemble https://<url>/<path>/<filename>.<extension>
    final String urlAndPathAndFilename = '$url$pathAndFilename';

    try {
      // Return data received from the given url

      return await dioConnection.get(urlAndPathAndFilename);
    } on DioException catch (dioException) {
      throw Exception(_dioExceptionHandling(dioException));
    } catch (generalException) {
      throw Exception();
    }
  }

  /// Returns different error messages based on a given dioException
  static String? _dioExceptionHandling(DioException dioException) {
    String errorMessage = 'An unknown error has occured';

    if (dioException.error is SocketException) {
      errorMessage = 'The server address is unknown';
    } else if (dioException.type == DioExceptionType.connectionTimeout) {
      errorMessage = 'Timeout while trying to reach the address';
    } else if (dioException.response?.statusCode == 401) {
      errorMessage = 'WebDAV username or password incorrect';
    } else if (dioException.response?.statusCode == 405) {
      errorMessage = 'Method not allowed. Is the server correct?';
    } else if (dioException.response?.statusCode == 500) {
      errorMessage = 'Server error';
    } else if (dioException.error
        .toString()
        .contains('No host specified in URI')) {
      errorMessage = 'The server address seems incorrect';
    }

    return errorMessage;
  }
}
