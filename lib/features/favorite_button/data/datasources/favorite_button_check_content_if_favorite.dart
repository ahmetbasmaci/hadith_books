import '../../../../core/database/i_database_manager.dart';
import '../../../../core/database/tables/hadith_favorite_table.dart';
import '../../../hadith_home/hadith_home.dart';

abstract class IFavoriteButtonCheckContentIfFavoriteDataSource {
  Future<bool> checkItemIfFavorite(HadithEntity itemModel);
}

class FavoriteButtonCheckContentIfFavoriteDataSource implements IFavoriteButtonCheckContentIfFavoriteDataSource {
  final IDatabaseManager databaseManager;

  const FavoriteButtonCheckContentIfFavoriteDataSource({required this.databaseManager});

  @override
  Future<bool> checkItemIfFavorite(HadithEntity itemModel) async {
    final result = await databaseManager.getRowById(
      tableName: HadithFavoriteTable.tableName,
      id: itemModel.id,
    );
    bool isFavorite = result != null && result.isNotEmpty;
    return isFavorite;
  }
}
