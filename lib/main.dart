import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hadith_books/src/injection_manager.dart';
import 'package:workmanager/workmanager.dart';

import 'src/background_task.dart';
import 'src/hadith_books_app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InjectionManager.instance.init();
  await GetStorage.init();
  Workmanager().initialize(backgroundTask, isInDebugMode: kDebugMode);



  runApp(const HadithBooksApp());
  // runApp(DevicePreview(enabled: true, builder: (context) => const HadithBooksApp()));
}

//TODO tarcama for imams
//TODO background service to sent hadith notification