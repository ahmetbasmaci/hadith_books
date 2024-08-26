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

  /// `Hadith Books`
  String get hadithBooks {
    return Intl.message(
      'Hadith Books',
      name: 'hadithBooks',
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
