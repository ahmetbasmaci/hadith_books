import 'package:hadith_books/core/helpers/printer_helper.dart';
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


  @override
  Future<List<HadithBookEntity>> getAllHadithBook() async {
    var start = DateTime.now();
    PrinterHelper.print('---------------------------------------------------------------start$start');

    // Create a list of Futures, each representing the loading of one JSON file
    List<Future<HadithBookEntity>> futures = HadithBooksEnum.values.map((element) async {
      final data = await _jsonService.readJson(element.bookJsonPath);
      return HadithBookEntity.fromJson(data);
    }).toList();

    // Wait for all Futures to complete concurrently
    List<HadithBookEntity> hadithBooks = await Future.wait(futures);

    PrinterHelper.print('---------------------------------------------------------------end${DateTime.now().difference(start)}');
    return hadithBooks;
  }

}
