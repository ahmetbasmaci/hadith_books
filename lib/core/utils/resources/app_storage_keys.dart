import '../../enums/hadith_books_enum.dart';

class AppStorageKeys {
  AppStorageKeys._();

  static const String theme = 'theme';
  static const String locale = 'locale';
  static const String fontSize = 'fontSize';
  static const String selectedHadithsInSearch = 'selectedHadithsInSearch';
  static const String selectedHadithsInFavorite = 'selectedHadithsInFavorite';

  static String lastReadedHadithBook(HadithBooksEnum hadithBooksEnum) => 'lastReadedHadithBook_${hadithBooksEnum.name}';
  static String lastReadedHadithChapterIndex(HadithBooksEnum hadithBooksEnum) =>
      'lastReadedHadithChapterIndex_${hadithBooksEnum.name}';
  static String lastReadedHadithItemIndex(HadithBooksEnum hadithBooksEnum) =>
      'lastReadedHadithItemIndex_${hadithBooksEnum.name}';
}
