import 'package:flutter/foundation.dart';
import 'package:talker_flutter/talker_flutter.dart';

/// Provider for everything related to logging.
class LogProvider {
  final Talker? _talker;

  LogProvider({Talker? talker}) : _talker = talker;

  Talker? get talker => _talker;

  /// Use provided talker logging function to log a message.
  ///
  /// Prints [debugModeMessage] in debug mode.
  void _safeLog(
    void Function() logFunc,
    String debugModeFlag,
    String debugModeMessage,
  ) {
    try {
      logFunc();

      if (_talker == null && kDebugMode) {
        debugPrint('[$debugModeFlag] $debugModeMessage');
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint('Error while logging: $e');
      }
    }
  }

  /// Log with level: error.
  void error(String message, [Object? err, StackTrace? st]) =>
      _safeLog(() => _talker?.error(message, err, st), 'ERROR', message);

  /// Log with level: warning.
  void warning(String message, [Object? err, StackTrace? st]) =>
      _safeLog(() => _talker?.warning(message, err, st), 'WARNING', message);

  /// Log with level: info.
  void info(String message) =>
      _safeLog(() => _talker?.info(message), 'INFO', message);

  /// Log with level: debug
  void debug(String message) =>
      _safeLog(() => _talker?.debug(message), 'DEBUG', message);
}
