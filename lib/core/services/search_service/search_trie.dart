import 'package:hadith_books/core/core.dart';
import 'package:hadith_books/core/services/search_service/search_tire_node.dart';

class SearchTrie {
  SearchTrieNode root = SearchTrieNode();

  void insert(SearchHadithInfoModel searchHadithParameterInfoModel, String word) {
    word = word.trim();
    SearchTrieNode current = root;
    for (var i = 0; i < word.length; i++) {
      var ch = word[i];
      if (!ch.isArabicLetter && !ch.isEnglishLetter) continue;

      if (!current.children.containsKey(ch)) {
        current.children[ch] = SearchTrieNode();
      }
      current = current.children[ch]!;
    }
    current.isEndOfWord = true;
    if (!current.searchHadithResultInfoModel.contains(searchHadithParameterInfoModel)) {
      current.searchHadithResultInfoModel.add(searchHadithParameterInfoModel);
    }
  }

  List<SearchHadithInfoModel> search(String input) {
    List<String> words = input.split(' ');

    Map<String, List<SearchHadithInfoModel>> tempResults = {};

    for (String word in words) {
      SearchTrieNode current = root;
      for (var i = 0; i < word.length; i++) {
        var ch = word[i];
        if (!current.children.containsKey(ch)) {
          return [];
        }
        current = current.children[ch]!;
      }

      if (current.isEndOfWord) {
        tempResults[word] = current.searchHadithResultInfoModel;
      } else {
        return [];
      }
    }

    // Combine the results if needed
    var foundedResults = combineResults(tempResults);
    return foundedResults;
  }

  List<SearchHadithInfoModel> combineResults(Map<String, List<SearchHadithInfoModel>> tempResults) {
    if (tempResults.isEmpty) return [];
    if (tempResults.length == 1) {
      return tempResults.values.first;
    }

    //get only ids that are repeated in each result(to get results as sentences)
    Set<SearchHadithInfoModel> intersection = tempResults.values.first.toSet();
    for (var element in tempResults.values.skip(1)) {
      intersection = intersection.intersection(element.toSet());
    }

    var foundedResults = intersection.toList();
    return foundedResults;
  }

  void insertAll(SearchHadithInfoModel searchHadithParameterInfoModel, String sentence) {
    var words = sentence.split(' ');
    for (var word in words) {
      insert(searchHadithParameterInfoModel, word);
    }
  }

  // Serialize the entire Trie to JSON
  Map<String, dynamic> toJson() {
    return root.toJson();
  }

  // Deserialize the Trie from JSON
  static SearchTrie fromJson(Map<String, dynamic> json) {
    SearchTrie service = SearchTrie();
    service.root = SearchTrieNode.fromJson(json);
    return service;
  }
}
