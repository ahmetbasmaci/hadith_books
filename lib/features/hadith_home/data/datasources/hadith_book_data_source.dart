import '../../../../core/core.dart';
import '../../../features.dart';

abstract class IHadithBookDataSource {
  Future<HadithBookEntity> getHadithBook(HadithBooksEnum hadithBookEnum);
  Future<List<HadithBookEntity>> getAllHadithBook();
  Future<List<Auther>> getAllAuthers();
  Future<Auther> getAutherById(int autherId);
  int getLastReadedHadithId(HadithBooksEnum hadithBookEnum);
}

class HadithBookDataSource extends IHadithBookDataSource {
  final IJsonService _jsonService;
  final ILocalStorage _localStorage;

  HadithBookDataSource(this._jsonService, this._localStorage);

  final List<HadithBookEntity> _allHadithBookEntitys = [];
  final List<Auther> _authers = [];

  @override
  Future<HadithBookEntity> getHadithBook(HadithBooksEnum hadithBookEnum) async {
    //check if the book is already loaded
    if (_allHadithBookEntitys.any((element) => element.id == hadithBookEnum.bookId)) {
      var hadithBook = _allHadithBookEntitys.firstWhere((element) => element.id == hadithBookEnum.bookId);
      return hadithBook.clone();
    }

    //read the book from the json file
    final data = await _jsonService.readCompressedJson(hadithBookEnum.bookJsonPath);
    var hadithBook = HadithBookEntity.fromJson(data);

    _allHadithBookEntitys.add(hadithBook);

    return hadithBook.clone();
  }

  @override
  Future<List<HadithBookEntity>> getAllHadithBook() async {
    if (_allHadithBookEntitys.length == HadithBooksEnum.values.length) {
      return <HadithBookEntity>[..._allHadithBookEntitys];
    }

    await _initHadithBooks();

    return <HadithBookEntity>[..._allHadithBookEntitys];
  }

  Future<void> _initHadithBooks() async {
    var start = PrinterHelper.printStartTimer('getAllHadithBook');

    // Create a list of Futures, each representing the loading of one JSON file
    List<Future<HadithBookEntity>> futures = [];
    for (var element in HadithBooksEnum.values) {
      if (_allHadithBookEntitys.any((e) => e.id == element.bookId)) continue;
      futures.add(getHadithBook(element));
    }

    // Wait for all Futures to complete concurrently
    await Future.wait(futures);

    PrinterHelper.printEndTimer('getAllHadithBook', start);
  }

  @override
  Future<List<Auther>> getAllAuthers() async {
    if (_authers.isNotEmpty) return _authers;

    var start = PrinterHelper.printStartTimer('getAllAuthers');

    var data = (await _jsonService.readJson(AppJsonPaths.authers)) as List<dynamic>;

    for (var element in data) {
      _authers.add(Auther.fromJson(element));
    }

    PrinterHelper.printEndTimer('getAllAuthers', start);
    return _authers;
  }

  @override
  Future<Auther> getAutherById(int autherId) async {
    if (_authers.isEmpty) {
      await getAllAuthers();
    }
    return _authers.firstWhere((element) => element.id == autherId);
  }

  @override
  int getLastReadedHadithId(HadithBooksEnum hadithBookEnum) {
    return _localStorage.read<int>(AppStorageKeys.lastReadedHadithItemId(hadithBookEnum)) ?? 1;
  }
}
