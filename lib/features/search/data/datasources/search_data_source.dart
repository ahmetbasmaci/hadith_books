import '../../../../core/core.dart';
import '../../../features.dart';

abstract class ISearchDataSource {
  Future<void> insertAll(SearchHadithInfoModel searchHadithParameterInfoModel, String sentence);
  Future<List<SearchHadithInfoModel>> search(List<HadithBooksEnum> hadithBookEnums, String sentence);
  Future<List<SearchHadithInfoModel>> searchHadith(HadithEntity hadith, String sentence);
  Future<void> initSearchTria(HadithBooksEnum hadithBooksEnum, String langCode);
  Future<void> initAllSearchTria(String langCode);
}

class SearchDataSource implements ISearchDataSource {
  final IJsonService _jsonService;
  SearchDataSource(this._jsonService);

  final List<SearchTrie> _allSearchTries = [];

  @override
  Future<void> initSearchTria(HadithBooksEnum hadithBooksEnum, String langCode) async {
    //check if the trie is already laoded
    if (_allSearchTries
        .any((element) => element.langCode == langCode && element.hadithBooksEnum.bookId == hadithBooksEnum.bookId)) {
      return;
    }
    var start = PrinterHelper.printStartTimer('readSearchTria');

    //get the path of the trie
    String path = AppJsonPaths.searchTrie(hadithBooksEnum);

    //read the trie from the json file
    final Map<String, dynamic> data = await _jsonService.readCompressedJson(path);

    //add the trie to the list of tries
    var trie = SearchTrie.fromJson(hadithBooksEnum, langCode, data);
    // Offload heavy computation to isolate
    // final SearchTrie trie = await compute(_parseTrie, {
    //   'data': data,
    //   'book': hadithBooksEnum,
    //   'langCode': langCode,
    // });

    // Add the Trie to the list
    _allSearchTries.add(trie);

    PrinterHelper.printEndTimer('readSearchTria', start);
  }

  @override
  Future<void> initAllSearchTria(String langCode) async {
    if (_allSearchTries.where((x) => x.langCode == langCode).length == HadithBooksEnum.values.length) return;

    var start = PrinterHelper.printStartTimer('readAllSearchTria');

    // Create a list of Futures, each representing the loading of one JSON file
    List<Future<void>> futures = [];
    for (var element in HadithBooksEnum.values) {
      if (_allSearchTries.any((e) => e.hadithBooksEnum == element)) continue;
      
      futures.add(initSearchTria(element, langCode));
    }

    // Wait for all Futures to complete concurrently
    await Future.wait(futures);

    PrinterHelper.printEndTimer('readAllSearchTria', start);
  }

  @override
  Future<void> insertAll(SearchHadithInfoModel searchHadithParameterInfoModel, String sentence) async {
    if (sentence.isEmpty) {
      return;
    }

    //insert the sentence into the trie
    for (var tria in _allSearchTries) {
      //check if the trie is the trie of the book
      if (tria.hadithBooksEnum.bookId != searchHadithParameterInfoModel.bookId) {
        continue;
      }
      tria.insertAll(searchHadithParameterInfoModel, sentence);
    }
  }

  @override
  Future<List<SearchHadithInfoModel>> search(List<HadithBooksEnum> hadithBookEnums, String sentence) async {
    if (sentence.isEmpty || hadithBookEnums.isEmpty) {
      return [];
    }

    List<SearchHadithInfoModel> searchHadithResultInfoModel = [];
    for (var tria in _allSearchTries) {
      //check if the trie is the trie of the book
      if (!hadithBookEnums.contains(tria.hadithBooksEnum)) continue;

      searchHadithResultInfoModel.addAll(tria.search(sentence.trim()));
    }

    return searchHadithResultInfoModel;
  }

  @override
  Future<List<SearchHadithInfoModel>> searchHadith(HadithEntity hadith, String sentence) async {
    if (sentence.isEmpty) {
      return [];
    }
    List<SearchHadithInfoModel> searchHadithResultInfoModel = [];
    for (var tria in _allSearchTries) {
      //check if the trie is the trie of the book
      if (hadith.bookId == tria.hadithBooksEnum.bookId) {
        searchHadithResultInfoModel.addAll(tria.search(sentence.trim()));
        break;
      }
    }

    return searchHadithResultInfoModel;
  }
}
