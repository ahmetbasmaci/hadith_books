import 'package:hadith_books/core/core.dart';

class AppJsonPaths {
  AppJsonPaths._();

  static const String _basePath = 'assets/database/';
  static const String _compressedJsonExtention = '$_jsonExtention.gz';
  static const String _jsonExtention = '.json';
  static const String _baseBookPath = '${_basePath}books/';
  static String get _locale => AppConstants.context.isArabicLang ? 'ar' : 'en';
  static String get _baseSearchTriaPath => '${_basePath}search_tria/$_locale/';

  static String bookPath(HadithBooksEnum book) => '$_baseBookPath${book.name.asFileName}$_compressedJsonExtention';
  static const String abudawudPath = '${_baseBookPath}abudawud$_compressedJsonExtention';
  static const String ahmedPath = '${_baseBookPath}ahmed$_compressedJsonExtention';
  static const String bukhariPath = '${_baseBookPath}bukhari$_compressedJsonExtention';
  static const String darimiPath = '${_baseBookPath}darimi$_compressedJsonExtention';
  static const String ibnmajahPath = '${_baseBookPath}ibnmajah$_compressedJsonExtention';
  static const String malikPath = '${_baseBookPath}malik$_compressedJsonExtention';
  static const String muslimPath = '${_baseBookPath}muslim$_compressedJsonExtention';
  static const String nasaiPath = '${_baseBookPath}nasai$_compressedJsonExtention';
  static const String tirmidhiPath = '${_baseBookPath}tirmidhi$_compressedJsonExtention';
  static const String nawawi40Path = '${_baseBookPath}nawawi40$_compressedJsonExtention';
  static const String qudsi40Path = '${_baseBookPath}qudsi40$_compressedJsonExtention';
  static const String shahwaliullah40Path = '${_baseBookPath}shahwaliullah40$_compressedJsonExtention';
  static const String riyadAssalihinPath = '${_baseBookPath}riyad_assalihin$_compressedJsonExtention';
  static const String mishkatAlmasabihPath = '${_baseBookPath}mishkat_almasabih$_compressedJsonExtention';
  static const String aladabAlmufradPath = '${_baseBookPath}aladab_almufrad$_compressedJsonExtention';
  static const String shamailMuhammadiyahPath = '${_baseBookPath}shamail_muhammadiyah$_compressedJsonExtention';
  static const String bulughAlmaramPath = '${_baseBookPath}bulugh_almaram$_compressedJsonExtention';
  static String searchTrie(HadithBooksEnum book) =>
      '${_baseSearchTriaPath}serach_trie_${_locale}_${book.name.asFileName}$_compressedJsonExtention';

  //static const String imamsTarjamaPath = '${_basePath}imams_tarjama$_jsonExtention';
  static const String authers = '${_basePath}authers$_jsonExtention';
}
