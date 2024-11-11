import 'package:hadith_books/core/core.dart';
import '../../../features.dart';

class SearchTrie {
  SearchTrieNode root = SearchTrieNode();
  final HadithBooksEnum hadithBooksEnum;
  final String langCode;
  SearchTrie(this.hadithBooksEnum, this.langCode);

  /// Insert all words from a sentence into the Trie
  void insertAll(SearchHadithInfoModel searchHadithParameterInfoModel, String sentence) {
    var words = sentence.split(' ');
    for (var word in words) {
      _insert(searchHadithParameterInfoModel, word);
    }
  }

  /// Insert a word into the Trie
  void _insert(SearchHadithInfoModel searchHadithParameterInfoModel, String word) {
    word = word.trim();
    SearchTrieNode current = root;
    for (var i = 0; i < word.length; i++) {
      var ch = word[i].toLowerCase();
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

  List<SearchHadithInfoModel> search(String sentence) {
    // Split the sentence into words
    List<String> words = sentence.split(' ');

    List<SearchHadithInfoModel> result = [];

    // Search for each word and combine the results
    if (words.length == 1) {
      var newData = _searchPartialMatch(words[0]);
      result.addAll(newData.values.expand((element) => element).toList());
    } else {
      Map<String, List<SearchHadithInfoModel>> mapResult = {};
      for (var i = 0; i < words.length; i++) {
        String word = words[i];

        SearchTrieNode current = root;
        for (var i = 0; i < word.length; i++) {
          var ch = word[i];
          if (!current.children.containsKey(ch)) {
            return [];
          }
          current = current.children[ch]!;
        }

        if (current.isEndOfWord) {
          mapResult[word] = current.searchHadithResultInfoModel;
        } else {
          return [];
        }
      }

      // Combine the results if needed
      result = _combineResults(mapResult);
    }

    // Combine the results
    return result;
  }

  /// Combine the results of multiple partial searches
  List<SearchHadithInfoModel> _combineResults(Map<String, List<SearchHadithInfoModel>> tempResults) {
    if (tempResults.isEmpty) return [];

    // Start with the smallest set to minimize the initial intersection size
    List<SearchHadithInfoModel> smallestList = tempResults.values.reduce(
      (a, b) => a.length < b.length ? a : b,
    );

    //List<SearchHadithInfoModel> intersection = smallestList;
    Set<SearchHadithInfoModel> intersection = smallestList.toSet();

    // Intersect with the rest, skipping the smallest one
    for (var element in tempResults.values) {
      if (element == smallestList) continue; // Skip the smallest list

      intersection = intersection.intersection(element.toSet());

      // Exit early if the intersection is empty
      if (intersection.isEmpty) return [];
    }

    return intersection.toList();
  }

  // List<SearchHadithInfoModel> search(String input) {
  //   List<String> words = input.split(' ');

  //   Map<String, List<SearchHadithInfoModel>> tempResults = {};

  //   for (String word in words) {
  //     SearchTrieNode current = root;
  //     for (var i = 0; i < word.length; i++) {
  //       var ch = word[i];
  //       if (!current.children.containsKey(ch)) {
  //         return [];
  //       }
  //       current = current.children[ch]!;
  //     }

  //     if (current.isEndOfWord) {
  //       tempResults[word] = current.searchHadithResultInfoModel;
  //     } else {
  //       return [];
  //     }
  //   }

  //   // Combine the results if needed
  //   var foundedResults = _combineResults(tempResults);
  //   return foundedResults;
  // }

  /// Partial match search - searches for words containing the search term as a substring
  Map<String, List<SearchHadithInfoModel>> _searchPartialMatch(String term) {
    Map<String, List<SearchHadithInfoModel>> results = {};
    _dfsPartial(root, "", term, results);

    return results;
  }

  /// DFS helper to find all words containing the given term as a substring
  void _dfsPartial(
      SearchTrieNode node, String currentPrefix, String term, Map<String, List<SearchHadithInfoModel>> results) {
    // If the currentPrefix contains the search term, add it to results if it's a complete word
    if (currentPrefix.contains(term) && node.isEndOfWord) {
      results[currentPrefix] = node.searchHadithResultInfoModel;
    }

    // Recursively search children nodes
    node.children.forEach((char, childNode) {
      _dfsPartial(childNode, currentPrefix + char, term, results);
    });
  }

  // List<SearchHadithInfoModel> _combineResults(Map<String, List<SearchHadithInfoModel>> tempResults) {
  //   if (tempResults.isEmpty) return [];
  //   if (tempResults.length == 1) {
  //     return tempResults.values.first;
  //   }

  //   //get only ids that are repeated in each result(to get results as sentences)
  //   Set<SearchHadithInfoModel> intersection = tempResults.values.first.toSet();
  //   for (var element in tempResults.values.skip(1)) {
  //     intersection = intersection.intersection(element.toSet());
  //   }

  //   var foundedResults = intersection.toList();
  //   return foundedResults;
  // }

  /// Serialize the entire Trie to JSON
  Map<String, dynamic> toJson() {
    return root.toJson();
  }

  /// Deserialize the Trie from JSON
  static SearchTrie fromJson(HadithBooksEnum hadithBooksEnum, String langCode, Map<String, dynamic> json) {
    SearchTrie tria = SearchTrie(hadithBooksEnum, langCode);
    tria.root = SearchTrieNode.fromJson(json);
    return tria;
  }
}
