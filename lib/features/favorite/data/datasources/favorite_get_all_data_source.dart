import 'package:hadith_books/features/hadith_home/domain/entities/hadith_book_entity.dart';

import '../../../../core/database/i_database_manager.dart';
import '../../../../core/database/tables/hadith_favorite_table.dart';

abstract class IFavoriteGetAllDataSource {
  Future<List<HadithEntity>> getAllFavoriteItems();
}

class FavoriteGetAllDataSource implements IFavoriteGetAllDataSource {
  final IDatabaseManager databaseManager;

  const FavoriteGetAllDataSource({required this.databaseManager});

  @override
  Future<List<HadithEntity>> getAllFavoriteItems() async {
    final hadithResult = await databaseManager.getAllRows(tableName: HadithFavoriteTable.tableName);

    List<HadithEntity> totalResult = [];

    if (hadithResult.isNotEmpty) {
      totalResult.addAll(hadithResult.map((e) => HadithEntity.fromJson(e)).toList());
    }

    totalResult.sort((a, b) => a.id.compareTo(b.id));
    return totalResult;
  }
}
