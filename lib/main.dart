import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hadith_books/src/injection_manager.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:workmanager/workmanager.dart';

import 'core/widgets/ui_test_page.dart';
import 'src/background_task.dart';
import 'src/hadith_books_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InjectionManager.instance.init();
  await GetStorage.init();
  Workmanager().initialize(backgroundTask, isInDebugMode: kDebugMode);

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
  //runApp(const HadithBooksApp());
  //runApp(const UiTestApp());
   runApp(DevicePreview(enabled: true, builder: (context) => const HadithBooksApp()));
}
