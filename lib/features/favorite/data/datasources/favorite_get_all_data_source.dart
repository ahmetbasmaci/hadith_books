import 'package:hadith_books/features/hadith_home/domain/entities/hadith_book_entity.dart';

import '../../../../core/database/i_database_manager.dart';
import '../../../../core/database/tables/hadith_favorite_table.dart';

abstract class IFavoriteGetAllDataSource {
  Future<List<HadithEntity>> getAllFavoriteItems();
}

class FavoriteGetAllDataSource implements IFavoriteGetAllDataSource {
  final IDatabaseManager databaseManager;

  const FavoriteGetAllDataSource(this.databaseManager);

  @override
  Future<List<HadithEntity>> getAllFavoriteItems() async {
    final hadithResult = await databaseManager.getAllRows(tableName: HadithFavoriteTable.tableName);

    List<HadithEntity> totalResult = [];

    if (hadithResult.isNotEmpty) {
      totalResult.addAll(hadithResult.map((e) => HadithEntity.fromJson(e)).toList());
    }
//order by book id then by id
    totalResult.sort((a, b) {
      if (a.bookId == b.bookId) {
        return a.id.compareTo(b.id);
      }
      return a.bookId.compareTo(b.bookId);
    });
    return totalResult;
  }
}
