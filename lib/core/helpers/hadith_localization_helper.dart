import 'package:hadith_books/core/utils/resources/resources.dart';

import '../../features/features.dart';

class HadithLocalizationHelper {
  HadithLocalizationHelper._();

  static String getChapterTitle(ChapterEntity chapterEntity) {
    if (AppConstants.context.isArabicLang) {
      return chapterEntity.arabic;
    }
    return chapterEntity.english;
  }

  static String getHadithText(HadithEntity hadithEntity) {
    if (AppConstants.context.isArabicLang) {
      return hadithEntity.arabic;
    }
    return hadithEntity.english.text;
  }

  static String getBookTitle(HadithBookEntity hadithBookEntity) {
    if (AppConstants.context.isArabicLang) {
      return hadithBookEntity.metadata.metadataDiscEntityAr.title;
    }

    return hadithBookEntity.metadata.metadataDiscEntityEn.title;
  }

  static String getBookAuther(HadithBookEntity hadithBookEntity) {
    if (AppConstants.context.isArabicLang) {
      return hadithBookEntity.metadata.metadataDiscEntityAr.author;
    }

    return hadithBookEntity.metadata.metadataDiscEntityEn.author;
  }
}
