import 'package:hadith_books/config/local/l10n.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';

enum HadithBooksEnum {
  bukhari(1),
  muslim(2),
  abudawud(3),
  tirmidhi(4),
  nasai(5),
  ibnmajah(6),
  malik(7),
  ahmed(8),
  riyadAssalihin(9),
  nawawi40(10),
  shamailMuhammadiyah(11),
  bulughAlmaram(12),
  aladabAlmufrad(13),
  darimi(14),
  qudsi40(15),
  shahwaliullah40(16),
  mishkatAlmasabih(17),
  // (18),
  // (19),
  // (20),

  ;

  final int bookId;

  const HadithBooksEnum(this.bookId);
}

extension HadithBooksEnumExtension on HadithBooksEnum {
  String get bookJsonPath {
    switch (this) {
      case HadithBooksEnum.bukhari:
        return AppJsonPaths.bukhariPath;
      case HadithBooksEnum.muslim:
        return AppJsonPaths.muslimPath;
      case HadithBooksEnum.nasai:
        return AppJsonPaths.nasaiPath;
      case HadithBooksEnum.abudawud:
        return AppJsonPaths.abudawudPath;
      case HadithBooksEnum.tirmidhi:
        return AppJsonPaths.tirmidhiPath;
      case HadithBooksEnum.ibnmajah:
        return AppJsonPaths.ibnmajahPath;
      case HadithBooksEnum.malik:
        return AppJsonPaths.malikPath;
      case HadithBooksEnum.ahmed:
        return AppJsonPaths.ahmedPath;
      case HadithBooksEnum.darimi:
        return AppJsonPaths.darimiPath;
      case HadithBooksEnum.nawawi40:
        return AppJsonPaths.nawawi40Path;
      case HadithBooksEnum.qudsi40:
        return AppJsonPaths.qudsi40Path;
      case HadithBooksEnum.shahwaliullah40:
        return AppJsonPaths.shahwaliullah40Path;
      case HadithBooksEnum.riyadAssalihin:
        return AppJsonPaths.riyadAssalihinPath;
      case HadithBooksEnum.mishkatAlmasabih:
        return AppJsonPaths.mishkatAlmasabihPath;
      case HadithBooksEnum.aladabAlmufrad:
        return AppJsonPaths.aladabAlmufradPath;
      case HadithBooksEnum.shamailMuhammadiyah:
        return AppJsonPaths.shamailMuhammadiyahPath;
      case HadithBooksEnum.bulughAlmaram:
        return AppJsonPaths.bulughAlmaramPath;
    }
  }

  String get bookName {
    return AppStrings.of(AppConstants.context).bookName(name);
  }

  String get bookImage {
    switch (this) {
      //TODo add images to assets
      case HadithBooksEnum.bukhari:
        return AppImagesPath.hadithBookBg;
      case HadithBooksEnum.muslim:
        return AppImagesPath.hadithBookBg;
      case HadithBooksEnum.nasai:
        return AppImagesPath.hadithBookBg;
      case HadithBooksEnum.abudawud:
        return AppImagesPath.hadithBookBg;
      case HadithBooksEnum.tirmidhi:
        return AppImagesPath.hadithBookBg;
      case HadithBooksEnum.ibnmajah:
        return AppImagesPath.hadithBookBg;
      case HadithBooksEnum.malik:
        return AppImagesPath.hadithBookBg;
      case HadithBooksEnum.ahmed:
        return AppImagesPath.hadithBookBg;
      case HadithBooksEnum.darimi:
        return AppImagesPath.hadithBookBg;
      case HadithBooksEnum.nawawi40:
        return AppImagesPath.hadithBookBg;
      case HadithBooksEnum.qudsi40:
        return AppImagesPath.hadithBookBg;
      case HadithBooksEnum.shahwaliullah40:
        return AppImagesPath.hadithBookBg;
      case HadithBooksEnum.riyadAssalihin:
        return AppImagesPath.hadithBookBg;
      case HadithBooksEnum.mishkatAlmasabih:
        return AppImagesPath.hadithBookBg;
      case HadithBooksEnum.aladabAlmufrad:
        return AppImagesPath.hadithBookBg;
      case HadithBooksEnum.shamailMuhammadiyah:
        return AppImagesPath.hadithBookBg;
      case HadithBooksEnum.bulughAlmaram:
        return AppImagesPath.hadithBookBg;
    }
  }
}
