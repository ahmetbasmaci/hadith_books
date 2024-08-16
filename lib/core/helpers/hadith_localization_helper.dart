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

  static String getHadithBookNameByHadithEntity(
      HadithEntity hadithEntity, List<HadithBookEntity> allHadithBookEntitys) {
    if (AppConstants.context.isArabicLang) {
      return allHadithBookEntitys
          .firstWhere((element) => element.id == hadithEntity.bookId)
          .metadata
          .metadataDiscEntityAr
          .title;
    }

    return allHadithBookEntitys
        .firstWhere((element) => element.id == hadithEntity.bookId)
        .metadata
        .metadataDiscEntityEn
        .title;
  }

  static String getHadithChapterNameByHadithEntity(
      HadithEntity hadithEntity, List<HadithBookEntity> allHadithBookEntitys) {
    if (AppConstants.context.isArabicLang) {
      return allHadithBookEntitys
          .firstWhere((element) => element.id == hadithEntity.bookId)
          .chapters
          .firstWhere((element) => element.id == hadithEntity.chapterId)
          .arabic;
    }

    return allHadithBookEntitys
        .firstWhere((element) => element.id == hadithEntity.bookId)
        .chapters
        .firstWhere((element) => element.id == hadithEntity.chapterId)
        .english;
  }

  static String getChapterHadithsCount(HadithBookEntity hadithBookEntity, int chapterId) {
    var hadiths = hadithBookEntity.hadiths.where((x) => x.chapterId == chapterId);
    String count = '${hadiths.first.id.toString()} - ${hadiths.last.id.toString()}  (${hadiths.length.toString()})';
    return count;
  }
}
