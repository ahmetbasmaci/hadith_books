import '../../../../core/core.dart';
import '../../../features.dart';

abstract class IHadithBookDataSource {
  Future<HadithBookEntity> getHadithBook(HadithBooksEnum hadithBookEnum);
  Future<List<HadithBookEntity>> getAllHadithBook();
  Future<List<Auther>> getAllAuthers();
}

class HadithBookDataSource extends IHadithBookDataSource {
  final IJsonService _jsonService;

  HadithBookDataSource(this._jsonService);

  final List<HadithBookEntity> _allHadithBookEntitys = [];
  final List<Auther> _authers = [];

  @override
  Future<HadithBookEntity> getHadithBook(HadithBooksEnum hadithBookEnum) async {
    if (_allHadithBookEntitys.any((element) => element.id == hadithBookEnum.bookId)) {
      return _allHadithBookEntitys.firstWhere((element) => element.id == hadithBookEnum.bookId);
    }
    final data = await _jsonService.readJson(hadithBookEnum.bookJsonPath);
    var hadithBook = HadithBookEntity.fromJson(data);
    _allHadithBookEntitys.add(hadithBook);
    return hadithBook;
  }

  @override
  Future<List<HadithBookEntity>> getAllHadithBook() async {
    if (_allHadithBookEntitys.isNotEmpty) return _allHadithBookEntitys;
    _allHadithBookEntitys.clear();
    var start = DateTime.now();
    PrinterHelper.print('---------------------------------------------------------------start$start');

    // Create a list of Futures, each representing the loading of one JSON file
    var futures = HadithBooksEnum.values.map((element) async => getHadithBook(element)).toList();

    // Wait for all Futures to complete concurrently
    var hadithBooks = await Future.wait(futures);
    _allHadithBookEntitys.addAll(hadithBooks);

    PrinterHelper.print(
        '---------------------------------------------------------------end${DateTime.now().difference(start)}');
    return _allHadithBookEntitys;
  }

  @override
  Future<List<Auther>> getAllAuthers() async {
    if (_authers.isNotEmpty) return _authers;

    var data = (await _jsonService.readJson(AppJsonPaths.authers)) as List<dynamic>;

    for (var element in data) {
      _authers.add(Auther.fromJson(element));
    }
    return _authers;
  }
}
