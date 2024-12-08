import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:hadith_books/core/core.dart';

abstract class IJsonService {
  Future<dynamic> readJson(String path);
  Future<dynamic> readCompressedJson(String path);
}

class JsonService extends IJsonService {
  @override
  Future<dynamic> readJson(String path) async {
    if (path.isEmpty) {
      throw const JsonExeption('Path is empty');
    }

    try {
      String jsonString = await rootBundle.loadString(path);
      var jsonResponse = json.decode(jsonString);
      return jsonResponse;
    } on FileSystemException catch (e) {
      throw JsonExeption('File not found: $e');
    } on FormatException catch (e) {
      throw JsonExeption('Invalid JSON format: $e');
    }
  }

  // Load, decompress, and parse the compressed JSON file
  @override
  Future<dynamic> readCompressedJson(String path) async {
    try {
      // Load the compressed JSON file as bytes
      ByteData compressedData = await rootBundle.load(path);

      // Decompress the gzip data
      List<int> decompressedData = gzip.decode(compressedData.buffer.asUint8List());

      // Decode JSON from decompressed data asynchronously
      // return await compute(_decodeJson, utf8.decode(decompressedData));

      return jsonDecode(utf8.decode(decompressedData));
    } catch (e, stackTrace) {
      // Log the error (or use a proper logger in production)
      PrinterHelper.printError('Error reading compressed JSON: $e');
      PrinterHelper.printError(stackTrace.toString());
      rethrow; // Rethrow the error for the caller to handle
    }
  }

  // Helper function to decode JSON in a separate isolate
  static dynamic _decodeJson(String jsonString) {
    return jsonDecode(jsonString);
  }
}
