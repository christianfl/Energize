import 'package:energize/services/log_service_interface.dart';

class LogServiceMock implements LogServiceInterface {
  final debugMessages = <String>[];
  final errorMessages = <String>[];
  final infoMessages = <String>[];
  final warningMessages = <String>[];

  @override
  void debug(String message) => debugMessages.add(message);

  @override
  void error(String message, [Object? err, StackTrace? st]) {
    errorMessages.add(message);
  }

  @override
  void info(String message) => infoMessages.add(message);

  @override
  void warning(String message, [Object? err, StackTrace? st]) {
    warningMessages.add(message);
  }
}
