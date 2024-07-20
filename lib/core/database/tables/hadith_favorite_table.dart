import '../database_query_helper.dart';

class HadithFavoriteTable {
  static const String tableName = 'HadithFavorite';

  //Columns
  static const String id = 'id';
  static const String chapterId = 'chapterId';
  static const String bookId = 'bookId';
  static const String arabic = 'arabic';
  static const String english = 'english';

  static String get onCreateString => DatabaseQueryHelper.createTableQuery(
        tableName,
        {
          id: DatabaseQueryHelper.intPrimaryKey,
          chapterId: DatabaseQueryHelper.intNotNull,
          bookId: DatabaseQueryHelper.intNotNull,
          arabic: DatabaseQueryHelper.textNotNull,
          english: DatabaseQueryHelper.textNotNull,
        },
      );
}
