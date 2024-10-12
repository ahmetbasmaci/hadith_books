// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppStrings {
  AppStrings();

  static AppStrings? _current;

  static AppStrings get current {
    assert(_current != null,
        'No instance of AppStrings was loaded. Try to initialize the AppStrings delegate before accessing AppStrings.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppStrings> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppStrings();
      AppStrings._current = instance;

      return instance;
    });
  }

  static AppStrings of(BuildContext context) {
    final instance = AppStrings.maybeOf(context);
    assert(instance != null,
        'No instance of AppStrings present in the widget tree. Did you add AppStrings.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppStrings? maybeOf(BuildContext context) {
    return Localizations.of<AppStrings>(context, AppStrings);
  }

  /// `Copied to clipboard`
  String get copiedToClipboard {
    return Intl.message(
      'Copied to clipboard',
      name: 'copiedToClipboard',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Change Theme`
  String get changeTheme {
    return Intl.message(
      'Change Theme',
      name: 'changeTheme',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `Sahih Al-Bukhari`
  String get bukhari {
    return Intl.message(
      'Sahih Al-Bukhari',
      name: 'bukhari',
      desc: '',
      args: [],
    );
  }

  /// `Sahih Muslim`
  String get muslim {
    return Intl.message(
      'Sahih Muslim',
      name: 'muslim',
      desc: '',
      args: [],
    );
  }

  /// `Sunan An-Nasai`
  String get nasai {
    return Intl.message(
      'Sunan An-Nasai',
      name: 'nasai',
      desc: '',
      args: [],
    );
  }

  /// `Sunan Abi Dawud`
  String get abudawud {
    return Intl.message(
      'Sunan Abi Dawud',
      name: 'abudawud',
      desc: '',
      args: [],
    );
  }

  /// `Sunan At-Tirmidhi`
  String get tirmidhi {
    return Intl.message(
      'Sunan At-Tirmidhi',
      name: 'tirmidhi',
      desc: '',
      args: [],
    );
  }

  /// `Sunan Ibn Majah`
  String get ibnmajah {
    return Intl.message(
      'Sunan Ibn Majah',
      name: 'ibnmajah',
      desc: '',
      args: [],
    );
  }

  /// `Muwatta Malik`
  String get malik {
    return Intl.message(
      'Muwatta Malik',
      name: 'malik',
      desc: '',
      args: [],
    );
  }

  /// `Musnad Ahmed`
  String get ahmed {
    return Intl.message(
      'Musnad Ahmed',
      name: 'ahmed',
      desc: '',
      args: [],
    );
  }

  /// `Sunan Ad-Darimi`
  String get darimi {
    return Intl.message(
      'Sunan Ad-Darimi',
      name: 'darimi',
      desc: '',
      args: [],
    );
  }

  /// `40 Hadith Nawawi`
  String get nawawi40 {
    return Intl.message(
      '40 Hadith Nawawi',
      name: 'nawawi40',
      desc: '',
      args: [],
    );
  }

  /// `40 Hadith Qudsi`
  String get qudsi40 {
    return Intl.message(
      '40 Hadith Qudsi',
      name: 'qudsi40',
      desc: '',
      args: [],
    );
  }

  /// `40 Hadith Shah Waliullah`
  String get shahwaliullah40 {
    return Intl.message(
      '40 Hadith Shah Waliullah',
      name: 'shahwaliullah40',
      desc: '',
      args: [],
    );
  }

  /// `Riyad As-Salihin`
  String get riyadAssalihin {
    return Intl.message(
      'Riyad As-Salihin',
      name: 'riyadAssalihin',
      desc: '',
      args: [],
    );
  }

  /// `Mishkat Al-Masabih`
  String get mishkatAlmasabih {
    return Intl.message(
      'Mishkat Al-Masabih',
      name: 'mishkatAlmasabih',
      desc: '',
      args: [],
    );
  }

  /// `Al-Adab Al-Mufrad`
  String get aladabAlmufrad {
    return Intl.message(
      'Al-Adab Al-Mufrad',
      name: 'aladabAlmufrad',
      desc: '',
      args: [],
    );
  }

  /// `Shamail Muhammadiyah`
  String get shamailMuhammadiyah {
    return Intl.message(
      'Shamail Muhammadiyah',
      name: 'shamailMuhammadiyah',
      desc: '',
      args: [],
    );
  }

  /// `Bulugh Al-Maram`
  String get bulughAlmaram {
    return Intl.message(
      'Bulugh Al-Maram',
      name: 'bulughAlmaram',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Hadith Encyclopedia`
  String get appName {
    return Intl.message(
      'Hadith Encyclopedia',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favorite {
    return Intl.message(
      'Favorite',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Added to favorite`
  String get AddedToFavorite {
    return Intl.message(
      'Added to favorite',
      name: 'AddedToFavorite',
      desc: '',
      args: [],
    );
  }

  /// `Removed from favorite`
  String get RemovedFromFavorite {
    return Intl.message(
      'Removed from favorite',
      name: 'RemovedFromFavorite',
      desc: '',
      args: [],
    );
  }

  /// `Error!!, Try Again`
  String get errorTryAgain {
    return Intl.message(
      'Error!!, Try Again',
      name: 'errorTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Font Size`
  String get fontSize {
    return Intl.message(
      'Font Size',
      name: 'fontSize',
      desc: '',
      args: [],
    );
  }

  /// `Change font size`
  String get fontSizeSubtitle {
    return Intl.message(
      'Change font size',
      name: 'fontSizeSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Result Ended`
  String get resultEnded {
    return Intl.message(
      'Result Ended',
      name: 'resultEnded',
      desc: '',
      args: [],
    );
  }

  /// `Select Books to Search in`
  String get selectBooksToSearchIn {
    return Intl.message(
      'Select Books to Search in',
      name: 'selectBooksToSearchIn',
      desc: '',
      args: [],
    );
  }

  /// `Select All`
  String get selectAll {
    return Intl.message(
      'Select All',
      name: 'selectAll',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Please select at least one book`
  String get pleaseSelectAtLeastOneBook {
    return Intl.message(
      'Please select at least one book',
      name: 'pleaseSelectAtLeastOneBook',
      desc: '',
      args: [],
    );
  }

  /// `Font size test text`
  String get fontSizeTestText {
    return Intl.message(
      'Font size test text',
      name: 'fontSizeTestText',
      desc: '',
      args: [],
    );
  }

  /// `Read More`
  String get readMore {
    return Intl.message(
      'Read More',
      name: 'readMore',
      desc: '',
      args: [],
    );
  }

  /// `Read Less`
  String get readLess {
    return Intl.message(
      'Read Less',
      name: 'readLess',
      desc: '',
      args: [],
    );
  }

  /// `App Developer`
  String get appDeveloper {
    return Intl.message(
      'App Developer',
      name: 'appDeveloper',
      desc: '',
      args: [],
    );
  }

  /// `The Hadith Encyclopedia application is a non-profit and completely free application that allows users to access more than 15 books of the Prophet's hadiths with ease and convenience. The application is characterized by its simple design and ease of use, which makes it the ideal choice for anyone who wants to read the Prophet’s hadiths anytime, anywhere.`
  String get aboutAppDiscreption {
    return Intl.message(
      'The Hadith Encyclopedia application is a non-profit and completely free application that allows users to access more than 15 books of the Prophet\'s hadiths with ease and convenience. The application is characterized by its simple design and ease of use, which makes it the ideal choice for anyone who wants to read the Prophet’s hadiths anytime, anywhere.',
      name: 'aboutAppDiscreption',
      desc: '',
      args: [],
    );
  }

  /// `Contact us on email`
  String get contactMeOnEmail {
    return Intl.message(
      'Contact us on email',
      name: 'contactMeOnEmail',
      desc: '',
      args: [],
    );
  }

  /// `or by WhatsApp`
  String get orByWhatsapp {
    return Intl.message(
      'or by WhatsApp',
      name: 'orByWhatsapp',
      desc: '',
      args: [],
    );
  }

  /// `Please if you have any questions or suggestions, do not hesitate to contact me.`
  String get appDeveloperDiscreption {
    return Intl.message(
      'Please if you have any questions or suggestions, do not hesitate to contact me.',
      name: 'appDeveloperDiscreption',
      desc: '',
      args: [],
    );
  }

  /// `Hello Ahmed,\n`
  String get emailMessage {
    return Intl.message(
      'Hello Ahmed,\n',
      name: 'emailMessage',
      desc: '',
      args: [],
    );
  }

  /// `Note About Hadith App`
  String get emailTitle {
    return Intl.message(
      'Note About Hadith App',
      name: 'emailTitle',
      desc: '',
      args: [],
    );
  }

  /// `No Results Founded`
  String get noResultsFounded {
    return Intl.message(
      'No Results Founded',
      name: 'noResultsFounded',
      desc: '',
      args: [],
    );
  }

  /// `Select Books Filter`
  String get selectBooksFilter {
    return Intl.message(
      'Select Books Filter',
      name: 'selectBooksFilter',
      desc: '',
      args: [],
    );
  }

  /// `Something Went Wrong!`
  String get somethingWentWrong {
    return Intl.message(
      'Something Went Wrong!',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Pray for the beloved`
  String get appDiscreption {
    return Intl.message(
      'Pray for the beloved',
      name: 'appDiscreption',
      desc: '',
      args: [],
    );
  }

  /// `Work without internet`
  String get workWithOutInternet {
    return Intl.message(
      'Work without internet',
      name: 'workWithOutInternet',
      desc: '',
      args: [],
    );
  }

  /// `More than 15 Hadith books`
  String get moreThen15OfHadithBookk {
    return Intl.message(
      'More than 15 Hadith books',
      name: 'moreThen15OfHadithBookk',
      desc: '',
      args: [],
    );
  }

  /// `Quick Search Feature`
  String get quikSearch {
    return Intl.message(
      'Quick Search Feature',
      name: 'quikSearch',
      desc: '',
      args: [],
    );
  }

  /// `Save Reading Progress`
  String get saveReadingForward {
    return Intl.message(
      'Save Reading Progress',
      name: 'saveReadingForward',
      desc: '',
      args: [],
    );
  }

  /// `You can access and read all books without the need for an internet connection`
  String get workWithOutInternetDiscreption {
    return Intl.message(
      'You can access and read all books without the need for an internet connection',
      name: 'workWithOutInternetDiscreption',
      desc: '',
      args: [],
    );
  }

  /// `The application provides a wide range of books of the Prophet's hadiths`
  String get moreThen15OfHadithBookkDiscreption {
    return Intl.message(
      'The application provides a wide range of books of the Prophet\'s hadiths',
      name: 'moreThen15OfHadithBookkDiscreption',
      desc: '',
      args: [],
    );
  }

  /// `You can search all books, a specific book, or even a chapter from a specific book quickly and easily`
  String get quikSearchDiscreption {
    return Intl.message(
      'You can search all books, a specific book, or even a chapter from a specific book quickly and easily',
      name: 'quikSearchDiscreption',
      desc: '',
      args: [],
    );
  }

  /// `This feature allows you to easily return to where you left off reading, making it easy for you to continue reading without losing your place. This feature is considered one of the most important features of the application`
  String get saveReadingForwardDiscreption {
    return Intl.message(
      'This feature allows you to easily return to where you left off reading, making it easy for you to continue reading without losing your place. This feature is considered one of the most important features of the application',
      name: 'saveReadingForwardDiscreption',
      desc: '',
      args: [],
    );
  }

  /// `No Ads`
  String get noAds {
    return Intl.message(
      'No Ads',
      name: 'noAds',
      desc: '',
      args: [],
    );
  }

  /// `This App allows you to read all books without any ads, which makes it easy for you to read without any distractions.`
  String get noAdsDiscreption {
    return Intl.message(
      'This App allows you to read all books without any ads, which makes it easy for you to read without any distractions.',
      name: 'noAdsDiscreption',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `How are we?`
  String get howAreWe {
    return Intl.message(
      'How are we?',
      name: 'howAreWe',
      desc: '',
      args: [],
    );
  }

  /// `About App`
  String get aboutApp {
    return Intl.message(
      'About App',
      name: 'aboutApp',
      desc: '',
      args: [],
    );
  }

  /// `About Developer`
  String get aboutDeveloper {
    return Intl.message(
      'About Developer',
      name: 'aboutDeveloper',
      desc: '',
      args: [],
    );
  }

  /// `I am a software engineer who strives to develop innovative applications that provide free services to Muslims around the world, with a focus on facilitating the learning of the Prophet’s hadiths and enhancing access to Islamic knowledge. My work aims to connect Muslims with their religion more effectively by designing easy-to-use, high-quality programs that contribute to the dissemination of knowledge.`
  String get aboutDeveloperDiscreption {
    return Intl.message(
      'I am a software engineer who strives to develop innovative applications that provide free services to Muslims around the world, with a focus on facilitating the learning of the Prophet’s hadiths and enhancing access to Islamic knowledge. My work aims to connect Muslims with their religion more effectively by designing easy-to-use, high-quality programs that contribute to the dissemination of knowledge.',
      name: 'aboutDeveloperDiscreption',
      desc: '',
      args: [],
    );
  }

  /// `Share App`
  String get shareApp {
    return Intl.message(
      'Share App',
      name: 'shareApp',
      desc: '',
      args: [],
    );
  }

  /// `"Whoever guides [another] to a good deed will have a reward equal to the one who does it." - Prophet Muhammad (PBUH)`
  String get shareAppTitle {
    return Intl.message(
      '"Whoever guides [another] to a good deed will have a reward equal to the one who does it." - Prophet Muhammad (PBUH)',
      name: 'shareAppTitle',
      desc: '',
      args: [],
    );
  }

  /// `Scrollable`
  String get scrolllable {
    return Intl.message(
      'Scrollable',
      name: 'scrolllable',
      desc: '',
      args: [],
    );
  }

  /// `List View`
  String get listView {
    return Intl.message(
      'List View',
      name: 'listView',
      desc: '',
      args: [],
    );
  }

  /// `a`
  String get a {
    return Intl.message(
      'a',
      name: 'a',
      desc: '',
      args: [],
    );
  }

  /// `z`
  String get z {
    return Intl.message(
      'z',
      name: 'z',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppStrings> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppStrings> load(Locale locale) => AppStrings.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
