import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../helpers/printer_helper.dart';
import 'database_query_helper.dart';
import 'i_database_manager.dart';
import 'tables/hadith_favorite_table.dart';

class DatabaseManager implements IDatabaseManager {
  static const int _databaseVersion = 2;
  static const String _databaseName = "hadith_book.db";
  static Database? _database;
  static const String _databaseNotOpenErrorMessage = 'Error: Database is not open !!!';
  Future<Database> get _getDatabase async {
    _database ??= await _initDB();

    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _databaseName);

    return await openDatabase(
      path,
      onCreate: (Database db, int version) async {
        //? Add new table creation here
        await onCreate(db, version, HadithFavoriteTable.onCreateString);
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        //? Add new table upgrade here
        await onUpgrade(db, oldVersion, newVersion, HadithFavoriteTable.tableName, HadithFavoriteTable.onCreateString);
      },
      version: _databaseVersion,
    );
  }

  @override
  Future<void> onCreate(Database db, int version, String creatString) async {
    try {
      await db.execute(creatString);
    } catch (e) {
      PrinterHelper.printError(e.toString());
      throw Exception('Error: Can\'nt create table !!! $e');
    }
  }

  @override
  Future<void> onUpgrade(Database db, int oldVersion, int newVersion, String tableName, String creatString) async {
    await db.execute('${DatabaseQueryHelper.dropTableIfExist} $tableName');
    await onCreate(db, newVersion, creatString);
  }

  @override
  Future<int> insert({
    required String tableName,
    required Map<String, Object?> values,
  }) async {
    try {
      final db = await _getDatabase;
      if (!db.isOpen) throw Exception(_databaseNotOpenErrorMessage);
      return await db.insert(
        tableName,
        values,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      PrinterHelper.printError(e.toString());

      throw Exception('Error: Can\'nt insert data into table !!! $e');
    }
  }

  @override
  Future<int> updateById({
    required String tableName,
    required Map<String, Object?> values,
    required int id,
  }) async {
    final db = await _getDatabase;
    if (!db.isOpen) throw Exception(_databaseNotOpenErrorMessage);
    return await db.update(
      tableName,
      values,
      where: 'id= ?',
      whereArgs: [id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<int> deleteById({
    required String tableName,
    required int id,
  }) async {
    final db = await _getDatabase;
    if (!db.isOpen) throw Exception(_databaseNotOpenErrorMessage);
    return await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<Map<String, dynamic>?> getRowById({
    required String tableName,
    required int hadithId,
    required int bookId,
  }) async {
    final db = await _getDatabase;
    if (!db.isOpen) throw Exception(_databaseNotOpenErrorMessage);

    // Query to get the row with the specific id and bookId
    final query = await db.query(
      tableName,
      where: 'hadithId = ? AND bookId = ?',
      whereArgs: [hadithId, bookId],

      limit: 1, // Limit the result to 1
    );

    if (query.isEmpty) return null;
    return query.first;
  }

  @override
  Future<List<Map<String, dynamic>>> getAllRows({required String tableName}) async {
    final db = await _getDatabase;
    if (!db.isOpen) throw Exception(_databaseNotOpenErrorMessage);
    var result= await db.query(tableName, orderBy: 'id');
    return result;
  }

  @override
  Future<List<Map<String, dynamic>>> getRowsWhere({
    required String tableName,
    required String column,
    required dynamic value,
  }) async {
    final db = await _getDatabase;
    if (!db.isOpen) throw Exception(_databaseNotOpenErrorMessage);
    return await db.query(
      tableName,
      where: '$column = ?',
      whereArgs: [value],
    );
  }

  @override
  Future<Map<String, dynamic>> getFirstRowWhere({
    required String tableName,
    required String column,
    required dynamic value,
  }) async {
    var data = await getRowsWhere(tableName: tableName, column: column, value: value);
    if (data.isEmpty) return <String, dynamic>{};
    return data.first;
  }

  @override
  Future<List<Map<String, dynamic>>> rawQuery(String query) async {
    final db = await _getDatabase;
    if (!db.isOpen) throw Exception(_databaseNotOpenErrorMessage);
    return await db.rawQuery(query);
  }

  @override
  Future<int> getRowCount({required String tableName}) async {
    final db = await _getDatabase;
    if (!db.isOpen) throw Exception(_databaseNotOpenErrorMessage);
    int? count = Sqflite.firstIntValue(await db.rawQuery('${DatabaseQueryHelper.selectCountFrom} $tableName'));
    return count ?? -1;
  }

  @override
  Future<void> deleteDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _databaseName);
    await deleteDatabase(path);
    _database = null;
  }

  @override
  Future<int> deleteRowsWhere({
    required String tableName,
    required String column,
    required dynamic value,
  }) async {
    final db = await _getDatabase;
    if (!db.isOpen) throw Exception(_databaseNotOpenErrorMessage);
    return await db.delete(
      tableName,
      where: '$column = ?',
      whereArgs: [value],
    );
  }

  @override
  Future<void> closeDatabase() async {
    PrinterHelper.print('Database is closed');
    if (_database != null) {
      await _database!.close();
      _database = null; // Ensure the reference is cleared to prevent leaks
    }
  }
}
