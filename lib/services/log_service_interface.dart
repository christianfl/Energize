/// Defines application logging without coupling services to the UI layer.
abstract interface class LogServiceInterface {
  /// Logs an error with optional exception details.
  void error(String message, [Object? err, StackTrace? st]);

  /// Logs a warning with optional exception details.
  void warning(String message, [Object? err, StackTrace? st]);

  /// Logs an informational message.
  void info(String message);

  /// Logs a debug message.
  void debug(String message);
}
