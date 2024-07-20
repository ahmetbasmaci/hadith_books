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

  //from json
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
  final int id;
  final int length;
  final MetadataDiscEntity metadataDiscEntityAr;
  final MetadataDiscEntity metadataDiscEntityEn;

  MetadataEntity({
    required this.id,
    required this.length,
    required this.metadataDiscEntityAr,
    required this.metadataDiscEntityEn,
  });

  //from json
  factory MetadataEntity.fromJson(Map<String, dynamic> json) {
    return MetadataEntity(
      id: json['id'],
      length: json['length'],
      metadataDiscEntityAr: MetadataDiscEntity.fromJson(json['arabic']),
      metadataDiscEntityEn: MetadataDiscEntity.fromJson(json['english']),
    );
  }
}

class MetadataDiscEntity {
  final String title;
  final String author;

  MetadataDiscEntity({required this.title, required this.author});

  //from json
  factory MetadataDiscEntity.fromJson(Map<String, dynamic> json) {
    return MetadataDiscEntity(
      title: json['title'],
      author: json['author'],
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

  //from json
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
  final int idInBook;
  final int chapterId;
  final int bookId;
  final String arabic;
  final HadithEnglishInfo english;

  HadithEntity({
    required this.idInBook,
    required this.chapterId,
    required this.bookId,
    required this.arabic,
    required this.english,
  });

  //from json
  factory HadithEntity.fromJson(Map<String, dynamic> json) {
    return HadithEntity(
      idInBook: json['idInBook'],
      chapterId: json['chapterId'],
      bookId: json['bookId'],
      arabic: json['arabic'],
      english: HadithEnglishInfo.fromJson(json['english']),
    );
  }

  //tojson
  Map<String, dynamic> toJson() {
    return {
      'idInBook': idInBook,
      'chapterId': chapterId,
      'bookId': bookId,
      'arabic': arabic,
      'english': english,
    };
  }
}

class HadithEnglishInfo {
  final String narrator;
  final String text;

  HadithEnglishInfo({required this.narrator, required this.text});

  //from json
  factory HadithEnglishInfo.fromJson(Map<String, dynamic> json) {
    return HadithEnglishInfo(
      narrator: json['narrator'],
      text: json['text'],
    );
  }
}
