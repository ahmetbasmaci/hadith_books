import 'package:hadith_books/core/core.dart';

abstract class IFavoriteSelectedBooksDataSource {
  Future<List<HadithBooksEnum>> getSavedSelectedBooks();
  Future<void> saveSelectedBooks(List<HadithBooksEnum> selectedHadithsInFavorite);
}

class FavoriteSelectedBooksDataSource implements IFavoriteSelectedBooksDataSource {
  final ILocalStorage _localStorage;

  FavoriteSelectedBooksDataSource(this._localStorage);

  @override
  Future<List<HadithBooksEnum>> getSavedSelectedBooks() async {
    var data = _localStorage.read<String>(AppStorageKeys.selectedHadithsInFavorite) ??
        HadithBooksEnum.values.toList().toString();

    List<HadithBooksEnum> savedItems = HadithBookEnumConverterHelper.fromStringToList(data);

    return savedItems;
  }

  @override
  Future<void> saveSelectedBooks(List<HadithBooksEnum> selectedHadithsInFavorite) async {
    await _localStorage.write(AppStorageKeys.selectedHadithsInFavorite, selectedHadithsInFavorite.toString());
  }
}
