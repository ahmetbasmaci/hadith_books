import 'package:hadith_books/core/services/search_service/search_trie_service.dart';

import '../../../../core/core.dart';
import '../../../../core/services/search_service/search_tire_node.dart';
import '../../../features.dart';

abstract class IHadithBookDataSource {
  Future<HadithBookEntity> getHadithBook(HadithBooksEnum hadithBookEnum, bool initTrieSearch);
  Future<List<HadithBookEntity>> getAllHadithBook();
  Future<List<ImamsTarjamaEntity>> getAllImamsTarjama();
}

class HadithBookDataSource extends IHadithBookDataSource {
  final IJsonService _jsonService;
  final ISearchTrieService _searchTrieService;

  HadithBookDataSource(this._jsonService, this._searchTrieService);

  @override
  Future<HadithBookEntity> getHadithBook(HadithBooksEnum hadithBookEnum, bool initTrieSearch) async {
    try {
      final data = await _jsonService.readJson(hadithBookEnum.bookJsonPath);
      var hadithBook = HadithBookEntity.fromJson(data);
      // for (var hadith in hadithBook.hadiths) {
      //   String text = AppConstants.context.isArabicLang
      //       ? hadith.arabic.removeTashkil
      //       : '${hadith.english.narrator} ${hadith.english.narrator}';

      //   if (!_searchTrieService.isHadithBookAddedToTrie(hadithBook.id)) {
      //     _searchTrieService.insertAll(
      //       SearchHadithInfoModel(
      //         bookId: hadithBook.id,
      //         chapterId: hadith.chapterId,
      //         hadithId: hadith.id,
      //       ),
      //       text,
      //     );
      //   }
      // }
      // _searchTrieService.addHadithBookToTrie(hadithBook.id);
      return hadithBook;
    } catch (e) {
      PrinterHelper.print(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<HadithBookEntity>> getAllHadithBook() async {
    var start = DateTime.now();
    PrinterHelper.print('---------------------------------------------------------------start$start');

    // Create a list of Futures, each representing the loading of one JSON file
    List<Future<HadithBookEntity>> futures =
        HadithBooksEnum.values.map((element) async => getHadithBook(element, true)).toList();

    // Wait for all Futures to complete concurrently
    List<HadithBookEntity> hadithBooks = await Future.wait(futures);
    // List<HadithBookEntity> hadithBooks = [];
    // for (var element in HadithBooksEnum.values) {
    //   var result = await getHadithBook(element, true);
    //   hadithBooks.add(result);
    // }
    PrinterHelper.print(
        '---------------------------------------------------------------end${DateTime.now().difference(start)}');
    return hadithBooks;
  }

  @override
  Future<List<ImamsTarjamaEntity>> getAllImamsTarjama() async {
    List<ImamsTarjamaEntity> result = [];
    var data = (await _jsonService.readJson(AppJsonPaths.imamsTarjamaPath)) as List<dynamic>;

    for (var element in data) {
      result.add(ImamsTarjamaEntity.fromJson(element));
    }
    return result;
  }
}
