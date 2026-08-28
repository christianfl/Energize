import 'package:talker_flutter/talker_flutter.dart';

import '../services/log_service_interface.dart';

/// Provider for everything related to logging.
class LogProvider implements LogServiceInterface {
  final Talker? _talker;

  LogProvider({this._talker});

  Talker? get talker => _talker;

  /// Log with level: error.
  @override
  void error(String message, [Object? err, StackTrace? st]) =>
      _talker?.error(message, err, st);

  /// Log with level: warning.
  @override
  void warning(String message, [Object? err, StackTrace? st]) =>
      _talker?.warning(message, err, st);

  /// Log with level: info.
  @override
  void info(String message) => _talker?.info(message);

  /// Log with level: debug.
  @override
  void debug(String message) => _talker?.debug(message);
}
