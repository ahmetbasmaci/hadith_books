import 'package:hadith_books/config/local/l10n.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';
import '../../../features/features.dart';

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

  static String getHadithCopyText(HadithBookEntity hadithBookEntity, HadithEntity hadithEntity) {
    String bookName = getBookName(hadithBookEntity);
    String chapterName = getHadithChapterNameByHadithEntity(hadithEntity, [hadithBookEntity]);
    String hadithNumber = '${AppStrings.of(AppConstants.context).hadithNumber}: ${hadithEntity.id}';
    String result = '''
    - ${AppStrings.of(AppConstants.context).bookNameStr}: $bookName
    - ${AppStrings.of(AppConstants.context).chapterName}: $chapterName
    - ${AppStrings.of(AppConstants.context).hadithNumber}: $hadithNumber

    ${getHadithText(hadithEntity)}
''';

    return result;
  }

  static String getBookName(HadithBookEntity hadithBookEntity) {
    return AppStrings.of(AppConstants.context).bookName(hadithBookEntity.metadata.name);
  }

  static String getBookAuther(Auther auther) {
    return AppStrings.of(AppConstants.context).autherName(auther.name);
  }

  static String getHadithChapterNameByHadithEntity(
      HadithEntity hadithEntity, List<HadithBookEntity> allHadithBookEntitys) {
    if (AppConstants.context.isArabicLang) {
      return allHadithBookEntitys
          .firstWhere((element) => element.id == hadithEntity.bookId)
          .chapters
          .firstWhere((element) => element.id == hadithEntity.chapterId, orElse: () => ChapterEntity.empty())
          .arabic;
    }

    return allHadithBookEntitys
        .firstWhere((element) => element.id == hadithEntity.bookId)
        .chapters
        .firstWhere((element) => element.id == hadithEntity.chapterId, orElse: () => ChapterEntity.empty())
        .english;
  }

  static String getChapterHadithsCount(HadithBookEntity hadithBookEntity, int chapterId) {
    var hadiths = hadithBookEntity.hadiths.where((x) => x.chapterId == chapterId);
    if (hadiths.isEmpty) return '0';
    String count = '${hadiths.first.id} - ${hadiths.last.id}  (${hadiths.length})';
    return count;
  }
}
