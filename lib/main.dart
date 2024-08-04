import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hadith_books/src/injection_manager.dart';

import 'src/hadith_books_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InjectionManager.instance.init();
  await GetStorage.init();
  runApp(const HadithBooksApp());
  // runApp(DevicePreview(enabled: true, builder: (context) => const HadithBooksApp()));
}
