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
    List<HadithBookEntity> hadithBooks = [];
    for (var element in HadithBooksEnum.values) {
      final data = await _jsonService.readJson(element.bookJsonPath);
      hadithBooks.add(HadithBookEntity.fromJson(data));
    }
    return hadithBooks;
  }
}
