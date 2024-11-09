import '../../../../core/database/i_database_manager.dart';
import '../../../../core/database/tables/hadith_favorite_table.dart';
import '../../../features.dart';

abstract class IFavoriteButtonReadWriteDataSource {
  Future<void> removeItem(HadithEntity item);
  Future<void> addItem(HadithEntity item);
}

class FavoriteButtonReadWriteDataSource implements IFavoriteButtonReadWriteDataSource {
  final IDatabaseManager _databaseManager;

  FavoriteButtonReadWriteDataSource(this._databaseManager);
  @override
  Future<void> addItem(HadithEntity item) async {
    var map = item.toJson();

    await _databaseManager.insert(tableName: HadithFavoriteTable.tableName, values: map);
  }

  @override
  Future<void> removeItem(HadithEntity item) async {
    await _databaseManager.deleteRowsWhere(
      tableName: HadithFavoriteTable.tableName,
      column: HadithFavoriteTable.id,
      value: item.id,
    );
  }
}
