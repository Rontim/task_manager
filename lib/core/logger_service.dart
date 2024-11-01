import 'package:logger/logger.dart';

class LoggerService {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.dateAndTime,
    ),
  );

  void logInfo(String message) {
    _logger.i(message);
  }

  void logDebug(String message) {
    _logger.d(message);
  }

  void logWarning(String message) {
    _logger.w(message);
  }

  void logError(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  // void logVerbose(String message) {
  //   _logger.(message);
  // }
}
