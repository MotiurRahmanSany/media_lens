import 'package:flutter/foundation.dart';

class Logger {
  static void log(String message, {String tag = 'MediaLens'}) {
    if (kDebugMode) {
      print('[$tag] $message');
    }
  }

  static void error(
    String message, {
    String tag = 'MediaLens',
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (kDebugMode) {
      print('❌ [$tag] ERROR: $message');
      if (error != null) {
        print('Error: $error');
      }
      if (stackTrace != null) {
        print('StackTrace: $stackTrace');
      }
    }
  }

  static void info(String message, {String tag = 'MediaLens'}) {
    if (kDebugMode) {
      print('ℹ️ [$tag] INFO: $message');
    }
  }

  static void warning(String message, {String tag = 'MediaLens'}) {
    if (kDebugMode) {
      print('⚠️ [$tag] WARNING: $message');
    }
  }

  static void success(String message, {String tag = 'MediaLens'}) {
    if (kDebugMode) {
      print('✅ [$tag] SUCCESS: $message');
    }
  }
}
