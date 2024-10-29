class HadithBookEntity {
  final int id;
  final MetadataEntity metadata;
  final List<ChapterEntity> chapters;
  final List<HadithEntity> hadiths;

  HadithBookEntity({
    required this.id,
    required this.metadata,
    required this.chapters,
    required this.hadiths,
  });

  HadithBookEntity.tempData()
      : id = 0,
        metadata = MetadataEntity.tempData(),
        chapters = [],
        hadiths = [];

  factory HadithBookEntity.fromJson(Map<String, dynamic> json) {
    return HadithBookEntity(
      id: json['id'],
      metadata: MetadataEntity.fromJson(json['metadata']),
      chapters: (json['chapters'] as List).map((chapter) => ChapterEntity.fromJson(chapter)).toList(),
      hadiths: (json['hadiths'] as List).map((hadith) => HadithEntity.fromJson(hadith)).toList(),
    );
  }
}

class MetadataEntity {
  final int autherId;
  final int length;
  final String name;
  final String description;

  MetadataEntity({
    required this.autherId,
    required this.length,
    required this.name,
    required this.description,
  });

  MetadataEntity.tempData()
      : autherId = 0,
        length = 0,
        name = '',
        description = '';
  factory MetadataEntity.fromJson(Map<String, dynamic> json) {
    return MetadataEntity(
      autherId: json['autherId'],
      name: json['name'],
      description: json['description'],
      length: json['length'],
    );
  }
}

class ChapterEntity {
  final int id;
  final int bookId;
  final String arabic;
  final String english;

  ChapterEntity({
    required this.id,
    required this.bookId,
    required this.arabic,
    required this.english,
  });

  ChapterEntity.tempData()
      : id = 0,
        bookId = 0,
        arabic = 'this is lorem some',
        english = 'this is lorem some';

  ChapterEntity.empty()
      : id = 0,
        bookId = 0,
        arabic = '',
        english = '';

  factory ChapterEntity.fromJson(Map<String, dynamic> json) {
    return ChapterEntity(
      id: json['id'],
      bookId: json['bookId'],
      arabic: json['arabic'],
      english: json['english'],
    );
  }
}

class HadithEntity {
  final int id;
  final int chapterId;
  final int bookId;
  final String arabic;
  final HadithEnglishInfo english;
  HadithEntity({
    required this.id,
    required this.chapterId,
    required this.bookId,
    required this.arabic,
    required this.english,
  });

  HadithEntity.tempData({required bool longText})
      : id = 0,
        chapterId = 0,
        bookId = 0,
        arabic = longText
            ? '............................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................'
            : '..................................................................................................',
        english = HadithEnglishInfo.tempData();

  factory HadithEntity.fromJson(Map<String, dynamic> json) {
    return HadithEntity(
      id: json['idInBook'] ?? json['id'],
      chapterId: json['chapterId'],
      bookId: json['bookId'],
      arabic: json['arabic'],
      english: HadithEnglishInfo.fromJson(json['english']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'chapterId': chapterId,
      'bookId': bookId,
      'arabic': arabic,
      'english': english.toJson(),
    };
  }
}

class HadithEnglishInfo {
  final String narrator;
  final String text;

  HadithEnglishInfo({required this.narrator, required this.text});
  HadithEnglishInfo.tempData()
      : narrator = 'narrator',
        text = 'this is lorem some english text,this is lorem some english text';
  //from json
  factory HadithEnglishInfo.fromJson(Object json) {
    Map<String, dynamic> map = {};
    if (json is String) {
      map = parseEnglishString(json);
    } else if (json is Map<String, dynamic>) {
      map = json;
    }
    return HadithEnglishInfo(
      narrator: map['narrator'],
      text: map['text'],
    );
  }
// Helper function to parse the English string into a Map
  static Map<String, dynamic> parseEnglishString(String englishString) {
    // Remove the leading and trailing curly braces
    String trimmed = englishString.trim().substring(1, englishString.length - 1);

    // Find the indices of 'narrator=' and 'text='
    int narratorIndex = trimmed.indexOf('narrator=');
    int textIndex = trimmed.indexOf('text=');

    if (narratorIndex == -1 || textIndex == -1) {
      throw const FormatException('Invalid format for English string');
    }

    // Extract narrator (from 'narrator=' to the next comma before 'text=')
    String narrator = trimmed.substring(narratorIndex + 9, textIndex).trim();
    if (narrator.endsWith(',')) {
      narrator = narrator.substring(0, narrator.length - 1);
    }

    // Extract text (everything after 'text=')
    String text = trimmed.substring(textIndex + 5).trim();

    return {
      'narrator': narrator,
      'text': text,
    };
  }

  //tojson
  Map<String, dynamic> toJson() {
    return {
      'narrator': narrator,
      'text': text,
    };
  }
}
