import 'package:hadith_books/core/utils/resources/app_images_path.dart';

import '../utils/resources/app_json_paths.dart';

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
  // (13),
  // (14),
  // (15),
  // (16),
  // (17),
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
    }
  }

  String get bookName {
    switch (this) {
      case HadithBooksEnum.bukhari:
        return 'Sahih Al-Bukhari';
      case HadithBooksEnum.muslim:
        return 'Sahih Muslim';
      case HadithBooksEnum.nasai:
        return 'Sunan An-Nasai';
      case HadithBooksEnum.abudawud:
        return 'Sunan Abi Dawud';
      case HadithBooksEnum.tirmidhi:
        return 'Sunan At-Tirmidhi';
      case HadithBooksEnum.ibnmajah:
        return 'Sunan Ibn Majah';
      case HadithBooksEnum.malik:
        return 'Muwatta Malik';
      case HadithBooksEnum.ahmed:
        return 'Musnad Ahmed';
      case HadithBooksEnum.darimi:
        return 'Sunan Ad-Darimi';
    }
  }

  String get bookImage {
    switch (this) {
      case HadithBooksEnum.bukhari:
        return AppImagesPath.bukhariBook;
      case HadithBooksEnum.muslim:
        return AppImagesPath.muslimBook;
      case HadithBooksEnum.nasai:
        return AppImagesPath.muslimBook;
      case HadithBooksEnum.abudawud:
        return AppImagesPath.muslimBook;
      case HadithBooksEnum.tirmidhi:
        return AppImagesPath.muslimBook;
      case HadithBooksEnum.ibnmajah:
        return AppImagesPath.muslimBook;
      case HadithBooksEnum.malik:
        return AppImagesPath.muslimBook;
      case HadithBooksEnum.ahmed:
        return AppImagesPath.muslimBook;
      case HadithBooksEnum.darimi:
        return AppImagesPath.muslimBook;
    }
  }
}
