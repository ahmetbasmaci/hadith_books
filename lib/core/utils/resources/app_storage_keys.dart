import '../../enums/hadith_books_enum.dart';

class AppStorageKeys {
  AppStorageKeys._();

  static const String theme = 'theme';
  static const String locale = 'locale';
  static String lastReadedHadithBook(HadithBooksEnum hadithBooksEnum) => 'lastReadedHadithBook_${hadithBooksEnum.name}';
  static String lastReadedHadithChapterIndex(HadithBooksEnum hadithBooksEnum) =>
      'lastReadedHadithChapterIndex_${hadithBooksEnum.name}';
  static String lastReadedHadithScrollPixell(HadithBooksEnum hadithBooksEnum) =>
      'lastReadedHadithScrollPixell_${hadithBooksEnum.name}';
}
