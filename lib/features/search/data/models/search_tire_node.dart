class SearchTrieNode {
  Map<String, SearchTrieNode> children = {};
  bool isEndOfWord = false;
  List<SearchHadithInfoModel> searchHadithResultInfoModel = [];

  SearchTrieNode(
      {Map<String, SearchTrieNode>? children,
      this.isEndOfWord = false,
      List<SearchHadithInfoModel>? searchHadithResultInfoModel})
      : children = children ?? <String, SearchTrieNode>{},
        searchHadithResultInfoModel = searchHadithResultInfoModel ?? [];

  // Convert SearchTrieNode (and children) to JSON
  Map<String, dynamic> toJson() {
    return {
      'children': children,
      // 'children': children.map((key, node) => MapEntry(key, node.toJson())),
      'isEndOfWord': isEndOfWord,
      'searchHadithResultInfoModel': searchHadithResultInfoModel.map((item) => item.toJson()).toList(),
    };
  }

  // Create SearchTrieNode from JSON
  factory SearchTrieNode.fromJson(Map<String, dynamic> json) {
    SearchTrieNode node = SearchTrieNode();
    node.isEndOfWord = json['isEndOfWord'] ?? false;

    node.searchHadithResultInfoModel =
        (json['searchHadithResultInfoModel'] as List).map((item) => SearchHadithInfoModel.fromJson(item)).toList();

    node.children =
        (json['children'] as Map<String, dynamic>).map((key, value) => MapEntry(key, SearchTrieNode.fromJson(value)));

    return node;
  }
}

class SearchHadithInfoModel {
  int bookId;
  int chapterId;
  int hadithId;

  SearchHadithInfoModel({
    this.bookId = 0,
    this.chapterId = 0,
    this.hadithId = 0,
  });

  // Convert SearchHadithInfoModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'bookId': bookId,
      'chapterId': chapterId,
      'hadithId': hadithId,
    };
  }

  // Create SearchHadithInfoModel from JSON
  factory SearchHadithInfoModel.fromJson(Map<String, dynamic> json) {
    return SearchHadithInfoModel(
      bookId: json['bookId'] ?? 0,
      chapterId: json['chapterId'] ?? 0,
      hadithId: json['hadithId'] ?? 0,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchHadithInfoModel &&
          runtimeType == other.runtimeType &&
          bookId == other.bookId &&
          chapterId == other.chapterId &&
          hadithId == other.hadithId;

  @override
  int get hashCode => bookId.hashCode ^ chapterId.hashCode ^ hadithId.hashCode;
}
