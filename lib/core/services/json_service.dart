import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hadith_books/core/errors/exeptions.dart';

abstract class IJsonService {
  Future<dynamic> readJson(String path);
}

class JsonService extends IJsonService {
  @override
  Future<dynamic> readJson(String path) async {
    if (path.isEmpty) {
      throw const JsonExeption('Path is empty');
    }

    String jsonString = await rootBundle.loadString(path);
    dynamic data = json.decode(jsonString);
    return data;
  }
}
