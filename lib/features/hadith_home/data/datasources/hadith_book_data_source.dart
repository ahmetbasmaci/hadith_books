import 'package:hadith_books/features/hadith_home/domain/entities/hadith_book_entity.dart';

import '../../../../core/enums/hadith_books_enum.dart';
import '../../../../core/services/json_service.dart';

abstract class IHadithBookDataSource {
  Future<HadithBookEntity> getHadithBook(HadithBooksEnum hadithBookEnum);
  Future<List<HadithBookEntity>> getAllHadithBook();
}

class HadithBookDataSource extends IHadithBookDataSource {
  final IJsonService _jsonService;

  HadithBookDataSource(this._jsonService);

  @override
  Future<HadithBookEntity> getHadithBook(HadithBooksEnum hadithBookEnum) async {
    final data = await _jsonService.readJson(hadithBookEnum.bookJsonPath);
    return HadithBookEntity.fromJson(data);
  }

  // @override
  // Future<List<HadithBookEntity>> getAllHadithBook() async {
  //   List<HadithBookEntity> hadithBooks = [];
  //   //print time to see how long it takes to get all hadith books
  //   var start = DateTime.now();
  //   print('---------------------------------------------------------------start${DateTime.now()}');
  //   for (var element in HadithBooksEnum.values) {
  //     final data = await _jsonService.readJson(element.bookJsonPath);
  //     hadithBooks.add(HadithBookEntity.fromJson(data));
  //   }

  //   //print time to see how long it takes to get all hadith books
  //   var end = DateTime.now();
  //   print('---------------------------------------------------------------end${end.difference(start)} }');

  //   return hadithBooks;
  // }

  @override
  Future<List<HadithBookEntity>> getAllHadithBook() async {
    var start = DateTime.now();
    print('---------------------------------------------------------------start$start');

    // Create a list of Futures, each representing the loading of one JSON file
    List<Future<HadithBookEntity>> futures = HadithBooksEnum.values.map((element) async {
      final data = await _jsonService.readJson(element.bookJsonPath);
      return HadithBookEntity.fromJson(data);
    }).toList();

    // Wait for all Futures to complete concurrently
    List<HadithBookEntity> hadithBooks = await Future.wait(futures);

    print('---------------------------------------------------------------end${DateTime.now().difference(start)}');
    return hadithBooks;
  }

  // @override
  // Future<List<HadithBookEntity>> getAllHadithBook() async {
  //   var start = DateTime.now();
  //   print('---------------------------------------------------------------start${DateTime.now()}');
  //   // Create a list of Future objects for each JSON read operation
  //   List<Future<dynamic>> futures = HadithBooksEnum.values.map((element) {
  //     return compute(_jsonService.readJson, element.bookJsonPath);
  //   }).toList();

  //   // Wait for all the Future objects to complete
  //   List<dynamic> results = await Future.wait(futures);

  //   // Convert the results to HadithBookEntity objects
  //   List<HadithBookEntity> hadithBooks = results.map((data) {
  //     return HadithBookEntity.fromJson(data);
  //   }).toList();
  //   var end = DateTime.now();
  //   print('---------------------------------------------------------------end${end.difference(start)} }');
  //   return hadithBooks;
  // }

  // Future<Map<String, dynamic>> readJsonInIsolate(String path) async {
  //   final file = File(path);
  //   final contents = await file.readAsString();
  //   return jsonDecode(contents);
  // }
}
