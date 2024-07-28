import 'package:hadith_books/config/local/l10n.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';

import '../utils/resources/app_images_path.dart';

enum HadithBooksEnum {
  bukhari(1),
  muslim(2),
  nasai(3),
  abudawud(4),
  tirmidhi(5),
  ibnmajah(6),
  malik(7),
  ahmed(8),
  darimi(9),
  nawawi40(10),
  qudsi40(11),
  shahwaliullah40(12),
  riyadAssalihin(13),
  mishkatAlmasabih(14),
  aladabAlmufrad(15),
  shamailMuhammadiyah(16),
  bulughAlmaram(17),
  // (18),
  // (19),
  // (20),

  ;

  final int bookId;

  const HadithBooksEnum(this.bookId);
}

enum FavoriteHadithTypeEnum {
  all(0),
  bukhari(1),
  muslim(2),
  nasai(3),
  abudawud(4),
  tirmidhi(5),
  ibnmajah(6),
  malik(7),
  ahmed(8),
  darimi(9),
  nawawi40(10),
  qudsi40(11),
  shahwaliullah40(12),
  riyadAssalihin(13),
  mishkatAlmasabih(14),
  aladabAlmufrad(15),
  shamailMuhammadiyah(16),
  bulughAlmaram(17),
  // (18),
  // (19),
  // (20),

  ;

  final int bookId;

  const FavoriteHadithTypeEnum(this.bookId);
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
    switch (this) {
      case HadithBooksEnum.bukhari:
        return AppStrings.of(AppConstants.context).bukhari;
      case HadithBooksEnum.muslim:
        return AppStrings.of(AppConstants.context).muslim;
      case HadithBooksEnum.nasai:
        return AppStrings.of(AppConstants.context).nasai;
      case HadithBooksEnum.abudawud:
        return AppStrings.of(AppConstants.context).abudawud;
      case HadithBooksEnum.tirmidhi:
        return AppStrings.of(AppConstants.context).tirmidhi;
      case HadithBooksEnum.ibnmajah:
        return AppStrings.of(AppConstants.context).ibnmajah;
      case HadithBooksEnum.malik:
        return AppStrings.of(AppConstants.context).malik;
      case HadithBooksEnum.ahmed:
        return AppStrings.of(AppConstants.context).ahmed;
      case HadithBooksEnum.darimi:
        return AppStrings.of(AppConstants.context).darimi;
      case HadithBooksEnum.nawawi40:
        return AppStrings.of(AppConstants.context).nawawi40;
      case HadithBooksEnum.qudsi40:
        return AppStrings.of(AppConstants.context).qudsi40;
      case HadithBooksEnum.shahwaliullah40:
        return AppStrings.of(AppConstants.context).shahwaliullah40;
      case HadithBooksEnum.riyadAssalihin:
        return AppStrings.of(AppConstants.context).riyadAssalihin;
      case HadithBooksEnum.mishkatAlmasabih:
        return AppStrings.of(AppConstants.context).mishkatAlmasabih;
      case HadithBooksEnum.aladabAlmufrad:
        return AppStrings.of(AppConstants.context).aladabAlmufrad;
      case HadithBooksEnum.shamailMuhammadiyah:
        return AppStrings.of(AppConstants.context).shamailMuhammadiyah;
      case HadithBooksEnum.bulughAlmaram:
        return AppStrings.of(AppConstants.context).bulughAlmaram;
    }
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

extension FavoriteHadithTypeEnumExtension on FavoriteHadithTypeEnum {
  String get bookName {
    switch (this) {
      case FavoriteHadithTypeEnum.all:
        return AppStrings.of(AppConstants.context).all;
      case FavoriteHadithTypeEnum.bukhari:
        return AppStrings.of(AppConstants.context).bukhari;
      case FavoriteHadithTypeEnum.muslim:
        return AppStrings.of(AppConstants.context).muslim;
      case FavoriteHadithTypeEnum.nasai:
        return AppStrings.of(AppConstants.context).nasai;
      case FavoriteHadithTypeEnum.abudawud:
        return AppStrings.of(AppConstants.context).abudawud;
      case FavoriteHadithTypeEnum.tirmidhi:
        return AppStrings.of(AppConstants.context).tirmidhi;
      case FavoriteHadithTypeEnum.ibnmajah:
        return AppStrings.of(AppConstants.context).ibnmajah;
      case FavoriteHadithTypeEnum.malik:
        return AppStrings.of(AppConstants.context).malik;
      case FavoriteHadithTypeEnum.ahmed:
        return AppStrings.of(AppConstants.context).ahmed;
      case FavoriteHadithTypeEnum.darimi:
        return AppStrings.of(AppConstants.context).darimi;
      case FavoriteHadithTypeEnum.nawawi40:
        return AppStrings.of(AppConstants.context).nawawi40;
      case FavoriteHadithTypeEnum.qudsi40:
        return AppStrings.of(AppConstants.context).qudsi40;
      case FavoriteHadithTypeEnum.shahwaliullah40:
        return AppStrings.of(AppConstants.context).shahwaliullah40;
      case FavoriteHadithTypeEnum.riyadAssalihin:
        return AppStrings.of(AppConstants.context).riyadAssalihin;
      case FavoriteHadithTypeEnum.mishkatAlmasabih:
        return AppStrings.of(AppConstants.context).mishkatAlmasabih;
      case FavoriteHadithTypeEnum.aladabAlmufrad:
        return AppStrings.of(AppConstants.context).aladabAlmufrad;
      case FavoriteHadithTypeEnum.shamailMuhammadiyah:
        return AppStrings.of(AppConstants.context).shamailMuhammadiyah;
      case FavoriteHadithTypeEnum.bulughAlmaram:
        return AppStrings.of(AppConstants.context).bulughAlmaram;
    }
  }
}
