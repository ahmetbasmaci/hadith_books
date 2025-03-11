import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hadith_books/src/app_initilizer.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'src/src.dart';

void main() async {
  await AppInitilizer.init();

  if (kReleaseMode) {
    await SentryFlutter.init(
      (options) {
        options.dsn = 'https://fd9973578b106880acd7c5a87152b3be@o4507997647011840.ingest.de.sentry.io/4507997661364304';
        // Set tracesSampleRate to 1.0 to capture 100% of transactions for tracing.
        // We recommend adjusting this value in production.
        options.tracesSampleRate = .01;
      },
      appRunner: () => _runApp(),
    );
  } else {
    _runApp();
  }
}

void _runApp() {
  runApp(const HadithBooksApp());
  //runApp(const UiTestApp());
  //runApp(DevicePreview(enabled: true, builder: (context) => const HadithBooksApp()));
}
