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
      //TODO add boooks metadata to one json and read it in the init of app
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
      case HadithBooksEnum.nawawi40:
        return '40 Hadith Nawawi';
      case HadithBooksEnum.qudsi40:
        return '40 Hadith Qudsi';
      case HadithBooksEnum.shahwaliullah40:
        return '40 Hadith Shah Waliullah';
      case HadithBooksEnum.riyadAssalihin:
        return 'Riyad As-Salihin';
      case HadithBooksEnum.mishkatAlmasabih:
        return 'Mishkat Al-Masabih';
      case HadithBooksEnum.aladabAlmufrad:
        return 'Al-Adab Al-Mufrad';
      case HadithBooksEnum.shamailMuhammadiyah:
        return 'Shamail Muhammadiyah';
      case HadithBooksEnum.bulughAlmaram:
        return 'Bulugh Al-Maram';
    }
  }

  String get bookImage {
    switch (this) {
      //TODo add images to assets
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
      case HadithBooksEnum.nawawi40:
        return AppImagesPath.muslimBook;
      case HadithBooksEnum.qudsi40:
        return AppImagesPath.muslimBook;
      case HadithBooksEnum.shahwaliullah40:
        return AppImagesPath.muslimBook;
      case HadithBooksEnum.riyadAssalihin:
        return AppImagesPath.muslimBook;
      case HadithBooksEnum.mishkatAlmasabih:
        return AppImagesPath.muslimBook;
      case HadithBooksEnum.aladabAlmufrad:
        return AppImagesPath.muslimBook;
      case HadithBooksEnum.shamailMuhammadiyah:
        return AppImagesPath.muslimBook;
      case HadithBooksEnum.bulughAlmaram:
        return AppImagesPath.muslimBook;
    }
  }
}
