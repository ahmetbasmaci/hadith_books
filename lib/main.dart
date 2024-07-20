import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hadith_books/src/injection_manager.dart';

import 'src/hadith_books_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InjectionManager.instance.init();
  await GetStorage.init();
  runApp(const HadithBooksApp());
}

//TODo add search in the home screen
//TODO add hadith books images
//TODo add action buttons(favorite,share,copy)
//todo add favorite database