import 'package:hadith_books/core/core.dart';
import '../../../features.dart';

class SearchTrie {
  SearchTrieNode root = SearchTrieNode();
  final HadithBooksEnum hadithBooksEnum;

  SearchTrie(this.hadithBooksEnum);

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

    Map<String, List<SearchHadithInfoModel>> results = {};

    // Search for each word and combine the results
    for (var word in words) {
      var newData = _searchPartialMatch(word);
      results.addAll(newData);
    }

    // Combine the results
    return results.values.expand((element) => element).toList();
  }

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

  /// Serialize the entire Trie to JSON
  Map<String, dynamic> toJson() {
    return root.toJson();
  }

  /// Deserialize the Trie from JSON
  static SearchTrie fromJson(HadithBooksEnum hadithBooksEnum, Map<String, dynamic> json) {
    SearchTrie tria = SearchTrie(hadithBooksEnum);
    tria.root = SearchTrieNode.fromJson(json);
    return tria;
  }
}
