import 'package:hadith_books/config/local/l10n.dart';
import 'package:hadith_books/core/core.dart';

enum HadithBooksEnum {
  // bukhari(1, AppJsonPaths.bukhariPath, AppImages.bukhari, 97, 7277),
  // muslim(2, AppJsonPaths.muslimPath, AppImages.muslim, 57, 7459),
  // abudawud(3, AppJsonPaths.abudawudPath, AppImages.abudawud, 43, 5276),
  // tirmidhi(4, AppJsonPaths.tirmidhiPath, AppImages.tirmidhi, 47, 4053),
  // nasai(5, AppJsonPaths.nasaiPath, AppImages.nasai, 52, 5768),
  // ibnmajah(6, AppJsonPaths.ibnmajahPath, AppImages.ibnmajah, 38, 4345),
  // malik(7, AppJsonPaths.malikPath, AppImages.malik, 61, 1985),
  ahmed(8, AppJsonPaths.ahmedPath, AppImages.ahmed, 13, 1374),
  // riyadAssalihin(9, AppJsonPaths.riyadAssalihinPath, AppImages.riyadAssalihin, 20, 1896),
  // nawawi40(10, AppJsonPaths.nawawi40Path, AppImages.nawawi40, 1, 40),
  // shamailMuhammadiyah(11, AppJsonPaths.shamailMuhammadiyahPath, AppImages.shamailMuhammadiyah, 57, 402),
  // bulughAlmaram(12, AppJsonPaths.bulughAlmaramPath, AppImages.bulughAlmaram, 16, 1767),
  // aladabAlmufrad(13, AppJsonPaths.aladabAlmufradPath, AppImages.aladabAlmufrad, 57, 1326),
  // darimi(14, AppJsonPaths.darimiPath, AppImages.darimi, 24, 3406),
  // qudsi40(15, AppJsonPaths.qudsi40Path, AppImages.qudsi40, 1, 40),
  // shahwaliullah40(16),
  // mishkatAlmasabih(17),
  // (18),
  // (19),
  // (20),

  ;

  final int bookId;
  final String bookJsonPath;
  final String bookImage;
  final int booksCount;
  final int hadithsCount;

  const HadithBooksEnum(this.bookId, this.bookJsonPath, this.bookImage, this.booksCount, this.hadithsCount);
}

extension HadithBooksEnumExtension on HadithBooksEnum {
  String get bookName {
    return AppStrings.of(AppConstants.context).bookName(name);
  }
}
