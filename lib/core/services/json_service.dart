import 'dart:convert';
import 'dart:io';

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

    try {
      String jsonString = await rootBundle.loadString(path);
      return json.decode(jsonString);
    } on FileSystemException catch (e) {
      throw JsonExeption('File not found: $e');
    } on FormatException catch (e) {
      throw JsonExeption('Invalid JSON format: $e');
    }
  }
}
