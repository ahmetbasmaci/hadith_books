import 'dart:developer';

import 'package:hadith_books/core/core.dart';

import '../../../features/features.dart';

abstract class ISearchTrieService {
  Future<SearchTrie> insertAll(SearchHadithInfoModel searchHadithParameterInfoModel, String sentence);
  List<SearchHadithInfoModel> search(String word);
  List<SearchHadithInfoModel> searchHadith(HadithEntity hadith, String word);
  void addHadithBookToTrie(int bookId);
  bool isHadithBookAddedToTrie(int bookId);
}

class SearchTrieService implements ISearchTrieService {
  final IJsonService _jsonService;
  SearchTrieService(this._jsonService);
  SearchTrie searchTrie = SearchTrie();
  final List<int> _hadithBooksAddedToTria = [];

  Future<void> readSearchTria() async {
    log('start readSearchTria ${DateTime.now()}');
    final data = await _jsonService.readJson(AppJsonPaths.searchTrie);
    searchTrie = SearchTrie.fromJson(data);
    log('end readSearchTria ${DateTime.now()}');
  }

  @override
  void addHadithBookToTrie(int bookId) {
    if (!_hadithBooksAddedToTria.contains(bookId)) {
      _hadithBooksAddedToTria.add(bookId);
    }
  }

  @override
  bool isHadithBookAddedToTrie(int bookId) {
    return _hadithBooksAddedToTria.contains(bookId);
  }

  @override
  Future<SearchTrie> insertAll(SearchHadithInfoModel searchHadithParameterInfoModel, String sentence) async {
    searchTrie.insertAll(searchHadithParameterInfoModel, sentence);

    return searchTrie;
  }

  @override
  List<SearchHadithInfoModel> search(String word) {
    var searchHadithResultInfoModel = searchTrie.search(word.trim());

    return searchHadithResultInfoModel;
  }

  @override
  List<SearchHadithInfoModel> searchHadith(HadithEntity hadith, String word) {
    var searchHadithResultInfoModel = searchTrie.search(word.trim());

    return searchHadithResultInfoModel;
  }
}
