import 'dart:developer';

class PrinterHelper {
  PrinterHelper._();
  static void print(String message, {Object? value}) {
    log(
      'INFO:   $message: $value',
      time: DateTime.now(),
      name: 'Zad Almumin',
    );
  }

  static void printError(String message, {Object? value}) {
    log(
      'ERROR:   $message: $value',
      time: DateTime.now(),
      name: 'Zad Almumin',
    );
  }
  
  static DateTime printStartTimer(String message) {
    var time=DateTime.now();
    log(
      'Start:   $message:  $time',
      time: DateTime.now(),
      name: 'Zad Almumin',
    );
    return time;
  }

  static void printEndTimer(String message, DateTime start) {
    log(
      'End:   $message: ${DateTime.now().difference(start)}',
      time: DateTime.now(),
      name: 'Zad Almumin',
    );
  }
}
