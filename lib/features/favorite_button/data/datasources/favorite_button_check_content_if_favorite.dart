import '../../../../core/database/i_database_manager.dart';
import '../../../../core/database/tables/hadith_favorite_table.dart';
import '../../../features.dart';
abstract class IFavoriteButtonCheckContentIfFavoriteDataSource {
  Future<bool> checkItemIfFavorite(HadithEntity itemModel);
}

class FavoriteButtonCheckContentIfFavoriteDataSource implements IFavoriteButtonCheckContentIfFavoriteDataSource {
  final IDatabaseManager _databaseManager;

  const FavoriteButtonCheckContentIfFavoriteDataSource( this._databaseManager);

  @override
  Future<bool> checkItemIfFavorite(HadithEntity itemModel) async {
    final result = await _databaseManager.getRowById(
      tableName: HadithFavoriteTable.tableName,
      id: itemModel.id,
      bookId:itemModel.bookId,
    );
    bool isFavorite = result != null && result.isNotEmpty;
    return isFavorite;
  }
}
