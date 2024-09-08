import '../../core.dart';

class HadithBookEnumConverterHelper {
  HadithBookEnumConverterHelper._();

  static List<HadithBooksEnum> fromStringToList(String data) {
    var splitedData =
        data.replaceAll('[', '').replaceAll(']', '').replaceAll(' ', '').replaceAll('HadithBooksEnum.', '').split(',');

    List<HadithBooksEnum> savedItems = [];
    for (var item in splitedData) {
      var data = HadithBooksEnum.values.firstWhere((element) => element.name == item);
      savedItems.add(data);
    }
    return savedItems;
  }
}
