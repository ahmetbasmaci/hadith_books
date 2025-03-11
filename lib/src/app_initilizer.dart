import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hadith_books/src/background_task.dart';
import 'package:workmanager/workmanager.dart';

import 'injection_manager.dart';

class AppInitilizer {
  AppInitilizer._();

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await InjectionManager.instance.init();
    await GetStorage.init();
    await Workmanager().initialize(backgroundTask, isInDebugMode: kDebugMode);
  }
}
