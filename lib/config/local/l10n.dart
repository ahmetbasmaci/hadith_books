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

  /// `This App Complatly free and allows you to read all books without any ads, which makes it easy for you to read without any distractions.`
  String get noAdsDiscreption {
    return Intl.message(
      'This App Complatly free and allows you to read all books without any ads, which makes it easy for you to read without any distractions.',
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

  /// `Hadith Number`
  String get hadithNumber {
    return Intl.message(
      'Hadith Number',
      name: 'hadithNumber',
      desc: '',
      args: [],
    );
  }

  /// `Toggle Expanded All Texts`
  String get toggleExpandedAllTexts {
    return Intl.message(
      'Toggle Expanded All Texts',
      name: 'toggleExpandedAllTexts',
      desc: '',
      args: [],
    );
  }

  /// `Expand or collapse all texts`
  String get toggleExpandedAllTextsSubtitle {
    return Intl.message(
      'Expand or collapse all texts',
      name: 'toggleExpandedAllTextsSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Book Info`
  String get bookInfo {
    return Intl.message(
      'Book Info',
      name: 'bookInfo',
      desc: '',
      args: [],
    );
  }

  /// `Imam Info`
  String get imamInfo {
    return Intl.message(
      'Imam Info',
      name: 'imamInfo',
      desc: '',
      args: [],
    );
  }

  /// `Found {count} results`
  String searchResultCount(Object count) {
    return Intl.message(
      'Found $count results',
      name: 'searchResultCount',
      desc: '',
      args: [count],
    );
  }

  /// `Please ensure that you type the full matched sentence for accurate results`
  String get searchResultCountZeroHint {
    return Intl.message(
      'Please ensure that you type the full matched sentence for accurate results',
      name: 'searchResultCountZeroHint',
      desc: '',
      args: [],
    );
  }

  /// `Imam Muhammad ibn Ismail al-Bukhari`
  String get bukhariName {
    return Intl.message(
      'Imam Muhammad ibn Ismail al-Bukhari',
      name: 'bukhariName',
      desc: '',
      args: [],
    );
  }

  /// `Imam Muhammad ibn Ismail al-Bukhari is one of the greatest hadith scholars in Islam. He was born in Bukhara (in present-day Uzbekistan) in 194 AH. He began collecting hadiths at a young age and traveled to many countries to gather authentic hadiths. His most famous work is 'Sahih al-Bukhari', which is considered one of the most authentic books after the Quran. He passed away in 256 AH. Imam al-Bukhari grew up in a scholarly environment as his father was a well-known scholar in Bukhara. After his father's death, his mother took care of his upbringing and ensured his education. Al-Bukhari memorized the Quran at a young age and then moved on to study hadith. At the age of sixteen, he embarked on his scholarly journey to Mecca to perform Hajj, where he began collecting hadiths. He then traveled to many countries such as Iraq, Egypt, and the Levant to gather hadiths from scholars. Al-Bukhari had a strong memory and an exceptional ability to memorize, which helped him in collecting and classifying hadiths. He was keen on verifying the authenticity of hadiths by studying the chain of narrators and ensuring their reliability and accuracy. 'Sahih al-Bukhari' is his most famous work, containing over 7000 hadiths, with around 2600 hadiths without repetition. This book is considered a fundamental reference in the science of hadith and is studied worldwide. In addition to 'Sahih al-Bukhari', Imam al-Bukhari wrote many other books such as 'Al-Adab Al-Mufrad' and 'Al-Tarikh Al-Kabir'. Al-Bukhari was known for his high morals and great humility, and he was keen on spreading knowledge and teaching people. He passed away in 256 AH in Samarkand (in present-day Uzbekistan) and was buried there. Imam al-Bukhari is considered a symbol of knowledge and piety and is celebrated in the Islamic world as one of the greatest hadith scholars.`
  String get bukhariDescription {
    return Intl.message(
      'Imam Muhammad ibn Ismail al-Bukhari is one of the greatest hadith scholars in Islam. He was born in Bukhara (in present-day Uzbekistan) in 194 AH. He began collecting hadiths at a young age and traveled to many countries to gather authentic hadiths. His most famous work is \'Sahih al-Bukhari\', which is considered one of the most authentic books after the Quran. He passed away in 256 AH. Imam al-Bukhari grew up in a scholarly environment as his father was a well-known scholar in Bukhara. After his father\'s death, his mother took care of his upbringing and ensured his education. Al-Bukhari memorized the Quran at a young age and then moved on to study hadith. At the age of sixteen, he embarked on his scholarly journey to Mecca to perform Hajj, where he began collecting hadiths. He then traveled to many countries such as Iraq, Egypt, and the Levant to gather hadiths from scholars. Al-Bukhari had a strong memory and an exceptional ability to memorize, which helped him in collecting and classifying hadiths. He was keen on verifying the authenticity of hadiths by studying the chain of narrators and ensuring their reliability and accuracy. \'Sahih al-Bukhari\' is his most famous work, containing over 7000 hadiths, with around 2600 hadiths without repetition. This book is considered a fundamental reference in the science of hadith and is studied worldwide. In addition to \'Sahih al-Bukhari\', Imam al-Bukhari wrote many other books such as \'Al-Adab Al-Mufrad\' and \'Al-Tarikh Al-Kabir\'. Al-Bukhari was known for his high morals and great humility, and he was keen on spreading knowledge and teaching people. He passed away in 256 AH in Samarkand (in present-day Uzbekistan) and was buried there. Imam al-Bukhari is considered a symbol of knowledge and piety and is celebrated in the Islamic world as one of the greatest hadith scholars.',
      name: 'bukhariDescription',
      desc: '',
      args: [],
    );
  }

  /// `Imam Muslim ibn al-Hajjaj al-Naysaburi`
  String get muslimName {
    return Intl.message(
      'Imam Muslim ibn al-Hajjaj al-Naysaburi',
      name: 'muslimName',
      desc: '',
      args: [],
    );
  }

  /// `Imam Muslim ibn al-Hajjaj is one of the greatest hadith scholars in Islam. He was born in Nishapur (in present-day Iran) in 206 AH. He began collecting hadiths at a young age and traveled to many countries to gather authentic hadiths. His most famous work is 'Sahih Muslim', which is considered one of the most authentic books after the Quran and Sahih al-Bukhari. He passed away in 261 AH. Imam Muslim grew up in a scholarly environment as his father was a well-known scholar in Nishapur. After his father's death, his mother took care of his upbringing and ensured his education. Muslim memorized the Quran at a young age and then moved on to study hadith. At the age of twenty, he embarked on his scholarly journey to Mecca to perform Hajj, where he began collecting hadiths. He then traveled to many countries such as Iraq, Egypt, and the Levant to gather hadiths from scholars. Muslim had a strong memory and an exceptional ability to memorize, which helped him in collecting and classifying hadiths. He was keen on verifying the authenticity of hadiths by studying the chain of narrators and ensuring their reliability and accuracy. 'Sahih Muslim' is his most famous work, containing over 7000 hadiths, with around 2600 hadiths without repetition. This book is considered a fundamental reference in the science of hadith and is studied worldwide. In addition to 'Sahih Muslim', Imam Muslim wrote many other books such as 'Al-Kuna wa al-Asma' and 'Al-Tabaqat'. Muslim was known for his high morals and great humility, and he was keen on spreading knowledge and teaching people. He passed away in 261 AH in Nishapur and was buried there. Imam Muslim is considered a symbol of knowledge and piety and is celebrated in the Islamic world as one of the greatest hadith scholars.`
  String get muslimDescription {
    return Intl.message(
      'Imam Muslim ibn al-Hajjaj is one of the greatest hadith scholars in Islam. He was born in Nishapur (in present-day Iran) in 206 AH. He began collecting hadiths at a young age and traveled to many countries to gather authentic hadiths. His most famous work is \'Sahih Muslim\', which is considered one of the most authentic books after the Quran and Sahih al-Bukhari. He passed away in 261 AH. Imam Muslim grew up in a scholarly environment as his father was a well-known scholar in Nishapur. After his father\'s death, his mother took care of his upbringing and ensured his education. Muslim memorized the Quran at a young age and then moved on to study hadith. At the age of twenty, he embarked on his scholarly journey to Mecca to perform Hajj, where he began collecting hadiths. He then traveled to many countries such as Iraq, Egypt, and the Levant to gather hadiths from scholars. Muslim had a strong memory and an exceptional ability to memorize, which helped him in collecting and classifying hadiths. He was keen on verifying the authenticity of hadiths by studying the chain of narrators and ensuring their reliability and accuracy. \'Sahih Muslim\' is his most famous work, containing over 7000 hadiths, with around 2600 hadiths without repetition. This book is considered a fundamental reference in the science of hadith and is studied worldwide. In addition to \'Sahih Muslim\', Imam Muslim wrote many other books such as \'Al-Kuna wa al-Asma\' and \'Al-Tabaqat\'. Muslim was known for his high morals and great humility, and he was keen on spreading knowledge and teaching people. He passed away in 261 AH in Nishapur and was buried there. Imam Muslim is considered a symbol of knowledge and piety and is celebrated in the Islamic world as one of the greatest hadith scholars.',
      name: 'muslimDescription',
      desc: '',
      args: [],
    );
  }

  /// `Imam Sulayman ibn al-Ash'ath Abu Dawud al-Sijistani`
  String get abudawudName {
    return Intl.message(
      'Imam Sulayman ibn al-Ash\'ath Abu Dawud al-Sijistani',
      name: 'abudawudName',
      desc: '',
      args: [],
    );
  }

  /// `Imam Sulayman ibn al-Ash'ath Abu Dawud is one of the greatest hadith scholars in Islam. He was born in Sijistan (in present-day Iran) in 202 AH. He began collecting hadiths at a young age and traveled to many countries to gather authentic hadiths. His most famous work is 'Sunan Abu Dawud', which is considered one of the six authentic books of hadith. He passed away in 275 AH. Imam Abu Dawud grew up in a scholarly environment as his father was a well-known scholar in Sijistan. After his father's death, his mother took care of his upbringing and ensured his education. Abu Dawud memorized the Quran at a young age and then moved on to study hadith. At the age of twenty, he embarked on his scholarly journey to Mecca to perform Hajj, where he began collecting hadiths. He then traveled to many countries such as Iraq, Egypt, and the Levant to gather hadiths from scholars. Abu Dawud had a strong memory and an exceptional ability to memorize, which helped him in collecting and classifying hadiths. He was keen on verifying the authenticity of hadiths by studying the chain of narrators and ensuring their reliability and accuracy. 'Sunan Abu Dawud' is his most famous work, containing over 4800 hadiths, with around 2600 hadiths without repetition. This book is considered a fundamental reference in the science of hadith and is studied worldwide. In addition to 'Sunan Abu Dawud', Imam Abu Dawud wrote many other books such as 'Al-Marasil' and 'Al-Nasikh wa al-Mansukh'. Abu Dawud was known for his high morals and great humility, and he was keen on spreading knowledge and teaching people. He passed away in 275 AH in Basra (in present-day Iraq) and was buried there. Imam Abu Dawud is considered a symbol of knowledge and piety and is celebrated in the Islamic world as one of the greatest hadith scholars.`
  String get abudawudDescription {
    return Intl.message(
      'Imam Sulayman ibn al-Ash\'ath Abu Dawud is one of the greatest hadith scholars in Islam. He was born in Sijistan (in present-day Iran) in 202 AH. He began collecting hadiths at a young age and traveled to many countries to gather authentic hadiths. His most famous work is \'Sunan Abu Dawud\', which is considered one of the six authentic books of hadith. He passed away in 275 AH. Imam Abu Dawud grew up in a scholarly environment as his father was a well-known scholar in Sijistan. After his father\'s death, his mother took care of his upbringing and ensured his education. Abu Dawud memorized the Quran at a young age and then moved on to study hadith. At the age of twenty, he embarked on his scholarly journey to Mecca to perform Hajj, where he began collecting hadiths. He then traveled to many countries such as Iraq, Egypt, and the Levant to gather hadiths from scholars. Abu Dawud had a strong memory and an exceptional ability to memorize, which helped him in collecting and classifying hadiths. He was keen on verifying the authenticity of hadiths by studying the chain of narrators and ensuring their reliability and accuracy. \'Sunan Abu Dawud\' is his most famous work, containing over 4800 hadiths, with around 2600 hadiths without repetition. This book is considered a fundamental reference in the science of hadith and is studied worldwide. In addition to \'Sunan Abu Dawud\', Imam Abu Dawud wrote many other books such as \'Al-Marasil\' and \'Al-Nasikh wa al-Mansukh\'. Abu Dawud was known for his high morals and great humility, and he was keen on spreading knowledge and teaching people. He passed away in 275 AH in Basra (in present-day Iraq) and was buried there. Imam Abu Dawud is considered a symbol of knowledge and piety and is celebrated in the Islamic world as one of the greatest hadith scholars.',
      name: 'abudawudDescription',
      desc: '',
      args: [],
    );
  }

  /// `Imam Tirmidhi`
  String get tirmidhiName {
    return Intl.message(
      'Imam Tirmidhi',
      name: 'tirmidhiName',
      desc: '',
      args: [],
    );
  }

  /// `Imam Abu Isa Muhammad ibn Isa al-Tirmidhi. He was born in Termez (in present-day Uzbekistan) in 209 AH. He began collecting hadiths at a young age and traveled to many countries to gather authentic hadiths. His most famous work is 'Al-Shama'il al-Muhammadiyya', which is considered one of the most important books in hadith. He passed away in 279 AH. Imam al-Tirmidhi grew up in a scholarly environment as his father was a well-known scholar in Termez. After his father's death, his mother took care of his upbringing and ensured his education. Al-Tirmidhi memorized the Quran at a young age and then moved on to study hadith. At the age of twenty, he embarked on his scholarly journey to Mecca to perform Hajj, where he began collecting hadiths. He then traveled to many countries such as Iraq, Egypt, and the Levant to gather hadiths from scholars. Al-Tirmidhi had a strong memory and an exceptional ability to memorize, which helped him in collecting and classifying hadiths. He was keen on verifying the authenticity of hadiths by studying the chain of narrators and ensuring their reliability and accuracy. 'Al-Shama'il al-Muhammadiyya' is his most famous work, containing over 400 hadiths. This book is considered a fundamental reference in the science of hadith and is studied worldwide. In addition to 'Al-Shama'il al-Muhammadiyya', Imam al-Tirmidhi wrote many other books such as 'Al-Jami' al-Kabir' and 'Al-Jami' al-Saghir'. Al-Tirmidhi was known for his high morals and great humility, and he was keen on spreading knowledge and teaching people. He passed away in 279 AH in Termez and was buried there. Imam al-Tirmidhi is considered a symbol of knowledge and piety and is celebrated in the Islamic world as one of the greatest hadith scholars.`
  String get tirmidhiDescription {
    return Intl.message(
      'Imam Abu Isa Muhammad ibn Isa al-Tirmidhi. He was born in Termez (in present-day Uzbekistan) in 209 AH. He began collecting hadiths at a young age and traveled to many countries to gather authentic hadiths. His most famous work is \'Al-Shama\'il al-Muhammadiyya\', which is considered one of the most important books in hadith. He passed away in 279 AH. Imam al-Tirmidhi grew up in a scholarly environment as his father was a well-known scholar in Termez. After his father\'s death, his mother took care of his upbringing and ensured his education. Al-Tirmidhi memorized the Quran at a young age and then moved on to study hadith. At the age of twenty, he embarked on his scholarly journey to Mecca to perform Hajj, where he began collecting hadiths. He then traveled to many countries such as Iraq, Egypt, and the Levant to gather hadiths from scholars. Al-Tirmidhi had a strong memory and an exceptional ability to memorize, which helped him in collecting and classifying hadiths. He was keen on verifying the authenticity of hadiths by studying the chain of narrators and ensuring their reliability and accuracy. \'Al-Shama\'il al-Muhammadiyya\' is his most famous work, containing over 400 hadiths. This book is considered a fundamental reference in the science of hadith and is studied worldwide. In addition to \'Al-Shama\'il al-Muhammadiyya\', Imam al-Tirmidhi wrote many other books such as \'Al-Jami\' al-Kabir\' and \'Al-Jami\' al-Saghir\'. Al-Tirmidhi was known for his high morals and great humility, and he was keen on spreading knowledge and teaching people. He passed away in 279 AH in Termez and was buried there. Imam al-Tirmidhi is considered a symbol of knowledge and piety and is celebrated in the Islamic world as one of the greatest hadith scholars.',
      name: 'tirmidhiDescription',
      desc: '',
      args: [],
    );
  }

  /// `Imam Ahmad ibn Shu'ayb al-Nasa'i`
  String get nasaiName {
    return Intl.message(
      'Imam Ahmad ibn Shu\'ayb al-Nasa\'i',
      name: 'nasaiName',
      desc: '',
      args: [],
    );
  }

  /// `Imam Ahmad ibn Shu'ayb al-Nasa'i is one of the greatest hadith scholars in Islam. He was born in Nasa (in present-day Turkmenistan) in 215 AH. He began collecting hadiths at a young age and traveled to many countries to gather authentic hadiths. His most famous work is 'Sunan al-Nasa'i', which is considered one of the six authentic books of hadith. He passed away in 303 AH. Imam al-Nasa'i grew up in a scholarly environment as his father was a well-known scholar in Nasa. After his father's death, his mother took care of his upbringing and ensured his education. Al-Nasa'i memorized the Quran at a young age and then moved on to study hadith. At the age of twenty, he embarked on his scholarly journey to Mecca to perform Hajj, where he began collecting hadiths. He then traveled to many countries such as Iraq, Egypt, and the Levant to gather hadiths from scholars. Al-Nasa'i had a strong memory and an exceptional ability to memorize, which helped him in collecting and classifying hadiths. He was keen on verifying the authenticity of hadiths by studying the chain of narrators and ensuring their reliability and accuracy. 'Sunan al-Nasa'i' is his most famous work, containing over 7000 hadiths, with around 2600 hadiths without repetition. This book is considered a fundamental reference in the science of hadith and is studied worldwide. In addition to 'Sunan al-Nasa'i', Imam al-Nasa'i wrote many other books such as 'Al-Sunan al-Kubra' and 'Al-Du'afa wa al-Matrukin'. Al-Nasa'i was known for his high morals and great humility, and he was keen on spreading knowledge and teaching people. He passed away in 303 AH in Ramla (in present-day Palestine) and was buried there. Imam al-Nasa'i is considered a symbol of knowledge and piety and is celebrated in the Islamic world as one of the greatest hadith scholars.`
  String get nasaiDescription {
    return Intl.message(
      'Imam Ahmad ibn Shu\'ayb al-Nasa\'i is one of the greatest hadith scholars in Islam. He was born in Nasa (in present-day Turkmenistan) in 215 AH. He began collecting hadiths at a young age and traveled to many countries to gather authentic hadiths. His most famous work is \'Sunan al-Nasa\'i\', which is considered one of the six authentic books of hadith. He passed away in 303 AH. Imam al-Nasa\'i grew up in a scholarly environment as his father was a well-known scholar in Nasa. After his father\'s death, his mother took care of his upbringing and ensured his education. Al-Nasa\'i memorized the Quran at a young age and then moved on to study hadith. At the age of twenty, he embarked on his scholarly journey to Mecca to perform Hajj, where he began collecting hadiths. He then traveled to many countries such as Iraq, Egypt, and the Levant to gather hadiths from scholars. Al-Nasa\'i had a strong memory and an exceptional ability to memorize, which helped him in collecting and classifying hadiths. He was keen on verifying the authenticity of hadiths by studying the chain of narrators and ensuring their reliability and accuracy. \'Sunan al-Nasa\'i\' is his most famous work, containing over 7000 hadiths, with around 2600 hadiths without repetition. This book is considered a fundamental reference in the science of hadith and is studied worldwide. In addition to \'Sunan al-Nasa\'i\', Imam al-Nasa\'i wrote many other books such as \'Al-Sunan al-Kubra\' and \'Al-Du\'afa wa al-Matrukin\'. Al-Nasa\'i was known for his high morals and great humility, and he was keen on spreading knowledge and teaching people. He passed away in 303 AH in Ramla (in present-day Palestine) and was buried there. Imam al-Nasa\'i is considered a symbol of knowledge and piety and is celebrated in the Islamic world as one of the greatest hadith scholars.',
      name: 'nasaiDescription',
      desc: '',
      args: [],
    );
  }

  /// `Imam Muhammad ibn Yazid Ibn Majah al-Qazwini`
  String get ibnmajahName {
    return Intl.message(
      'Imam Muhammad ibn Yazid Ibn Majah al-Qazwini',
      name: 'ibnmajahName',
      desc: '',
      args: [],
    );
  }

  /// `Imam Muhammad ibn Yazid Ibn Majah is one of the greatest hadith scholars in Islam. He was born in Qazvin (in present-day Iran) in 209 AH. He began collecting hadiths at a young age and traveled to many countries to gather authentic hadiths. His most famous work is 'Sunan Ibn Majah', which is considered one of the six authentic books of hadith. He passed away in 273 AH. Imam Ibn Majah grew up in a scholarly environment as his father was a well-known scholar in Qazvin. After his father's death, his mother took care of his upbringing and ensured his education. Ibn Majah memorized the Quran at a young age and then moved on to study hadith. At the age of twenty, he embarked on his scholarly journey to Mecca to perform Hajj, where he began collecting hadiths. He then traveled to many countries such as Iraq, Egypt, and the Levant to gather hadiths from scholars. Ibn Majah had a strong memory and an exceptional ability to memorize, which helped him in collecting and classifying hadiths. He was keen on verifying the authenticity of hadiths by studying the chain of narrators and ensuring their reliability and accuracy. 'Sunan Ibn Majah' is his most famous work, containing over 4000 hadiths, with around 2600 hadiths without repetition. This book is considered a fundamental reference in the science of hadith and is studied worldwide. In addition to 'Sunan Ibn Majah', Imam Ibn Majah wrote many other books such as 'Tafsir' and 'Tarikh'. Ibn Majah was known for his high morals and great humility, and he was keen on spreading knowledge and teaching people. He passed away in 273 AH in Qazvin and was buried there. Imam Ibn Majah is considered a symbol of knowledge and piety and is celebrated in the Islamic world as one of the greatest hadith scholars.`
  String get ibnmajahDescription {
    return Intl.message(
      'Imam Muhammad ibn Yazid Ibn Majah is one of the greatest hadith scholars in Islam. He was born in Qazvin (in present-day Iran) in 209 AH. He began collecting hadiths at a young age and traveled to many countries to gather authentic hadiths. His most famous work is \'Sunan Ibn Majah\', which is considered one of the six authentic books of hadith. He passed away in 273 AH. Imam Ibn Majah grew up in a scholarly environment as his father was a well-known scholar in Qazvin. After his father\'s death, his mother took care of his upbringing and ensured his education. Ibn Majah memorized the Quran at a young age and then moved on to study hadith. At the age of twenty, he embarked on his scholarly journey to Mecca to perform Hajj, where he began collecting hadiths. He then traveled to many countries such as Iraq, Egypt, and the Levant to gather hadiths from scholars. Ibn Majah had a strong memory and an exceptional ability to memorize, which helped him in collecting and classifying hadiths. He was keen on verifying the authenticity of hadiths by studying the chain of narrators and ensuring their reliability and accuracy. \'Sunan Ibn Majah\' is his most famous work, containing over 4000 hadiths, with around 2600 hadiths without repetition. This book is considered a fundamental reference in the science of hadith and is studied worldwide. In addition to \'Sunan Ibn Majah\', Imam Ibn Majah wrote many other books such as \'Tafsir\' and \'Tarikh\'. Ibn Majah was known for his high morals and great humility, and he was keen on spreading knowledge and teaching people. He passed away in 273 AH in Qazvin and was buried there. Imam Ibn Majah is considered a symbol of knowledge and piety and is celebrated in the Islamic world as one of the greatest hadith scholars.',
      name: 'ibnmajahDescription',
      desc: '',
      args: [],
    );
  }

  /// `Imam Malik ibn Anas`
  String get malikName {
    return Intl.message(
      'Imam Malik ibn Anas',
      name: 'malikName',
      desc: '',
      args: [],
    );
  }

  /// `Imam Malik ibn Anas is one of the greatest scholars of jurisprudence and hadith in Islam. He was born in Medina in 93 AH. He began collecting hadiths at a young age and traveled to many countries to gather authentic hadiths. His most famous work is 'Al-Muwatta', which is considered one of the most important books in jurisprudence and hadith. He passed away in 179 AH. Imam Malik grew up in a scholarly environment as his father was a well-known scholar in Medina. After his father's death, his mother took care of his upbringing and ensured his education. Malik memorized the Quran at a young age and then moved on to study hadith and jurisprudence. At the age of twenty, he embarked on his scholarly journey to Mecca to perform Hajj, where he began collecting hadiths. He then traveled to many countries such as Iraq, Egypt, and the Levant to gather hadiths from scholars. Malik had a strong memory and an exceptional ability to memorize, which helped him in collecting and classifying hadiths. He was keen on verifying the authenticity of hadiths by studying the chain of narrators and ensuring their reliability and accuracy. 'Al-Muwatta' is his most famous work, containing over 1700 hadiths, with around 600 hadiths without repetition. This book is considered a fundamental reference in the science of hadith and jurisprudence and is studied worldwide. In addition to 'Al-Muwatta', Imam Malik wrote many other books such as 'Al-Risala' and 'Al-Mudawwana'. Malik was known for his high morals and great humility, and he was keen on spreading knowledge and teaching people. He passed away in 179 AH in Medina and was buried there. Imam Malik is considered a symbol of knowledge and piety and is celebrated in the Islamic world as one of the greatest scholars of jurisprudence and hadith.`
  String get malikDescription {
    return Intl.message(
      'Imam Malik ibn Anas is one of the greatest scholars of jurisprudence and hadith in Islam. He was born in Medina in 93 AH. He began collecting hadiths at a young age and traveled to many countries to gather authentic hadiths. His most famous work is \'Al-Muwatta\', which is considered one of the most important books in jurisprudence and hadith. He passed away in 179 AH. Imam Malik grew up in a scholarly environment as his father was a well-known scholar in Medina. After his father\'s death, his mother took care of his upbringing and ensured his education. Malik memorized the Quran at a young age and then moved on to study hadith and jurisprudence. At the age of twenty, he embarked on his scholarly journey to Mecca to perform Hajj, where he began collecting hadiths. He then traveled to many countries such as Iraq, Egypt, and the Levant to gather hadiths from scholars. Malik had a strong memory and an exceptional ability to memorize, which helped him in collecting and classifying hadiths. He was keen on verifying the authenticity of hadiths by studying the chain of narrators and ensuring their reliability and accuracy. \'Al-Muwatta\' is his most famous work, containing over 1700 hadiths, with around 600 hadiths without repetition. This book is considered a fundamental reference in the science of hadith and jurisprudence and is studied worldwide. In addition to \'Al-Muwatta\', Imam Malik wrote many other books such as \'Al-Risala\' and \'Al-Mudawwana\'. Malik was known for his high morals and great humility, and he was keen on spreading knowledge and teaching people. He passed away in 179 AH in Medina and was buried there. Imam Malik is considered a symbol of knowledge and piety and is celebrated in the Islamic world as one of the greatest scholars of jurisprudence and hadith.',
      name: 'malikDescription',
      desc: '',
      args: [],
    );
  }

  /// `Imam Ahmad ibn Hanbal`
  String get ahmedName {
    return Intl.message(
      'Imam Ahmad ibn Hanbal',
      name: 'ahmedName',
      desc: '',
      args: [],
    );
  }

  /// `Imam Ahmad ibn Hanbal is one of the greatest scholars of jurisprudence and hadith in Islam. He was born in Baghdad in 164 AH. He began collecting hadiths at a young age and traveled to many countries to gather authentic hadiths. His most famous work is 'Musnad Ahmad', which is considered one of the most important books in jurisprudence and hadith. He passed away in 241 AH. Imam Ahmad grew up in a scholarly environment as his father was a well-known scholar in Baghdad. After his father's death, his mother took care of his upbringing and ensured his education. Ahmad memorized the Quran at a young age and then moved on to study hadith and jurisprudence. At the age of twenty, he embarked on his scholarly journey to Mecca to perform Hajj, where he began collecting hadiths. He then traveled to many countries such as Iraq, Egypt, and the Levant to gather hadiths from scholars. Ahmad had a strong memory and an exceptional ability to memorize, which helped him in collecting and classifying hadiths. He was keen on verifying the authenticity of hadiths by studying the chain of narrators and ensuring their reliability and accuracy. 'Musnad Ahmad' is his most famous work, containing over 30,000 hadiths, with around 10,000 hadiths without repetition. This book is considered a fundamental reference in the science of hadith and jurisprudence and is studied worldwide. In addition to 'Musnad Ahmad', Imam Ahmad wrote many other books such as 'Al-Zuhd' and 'Al-Ilal wa Ma'rifat al-Rijal'. Ahmad was known for his high morals and great humility, and he was keen on spreading knowledge and teaching people. He passed away in 241 AH in Baghdad and was buried there. Imam Ahmad is considered a symbol of knowledge and piety and is celebrated in the Islamic world as one of the greatest scholars of jurisprudence and hadith.`
  String get ahmedDescription {
    return Intl.message(
      'Imam Ahmad ibn Hanbal is one of the greatest scholars of jurisprudence and hadith in Islam. He was born in Baghdad in 164 AH. He began collecting hadiths at a young age and traveled to many countries to gather authentic hadiths. His most famous work is \'Musnad Ahmad\', which is considered one of the most important books in jurisprudence and hadith. He passed away in 241 AH. Imam Ahmad grew up in a scholarly environment as his father was a well-known scholar in Baghdad. After his father\'s death, his mother took care of his upbringing and ensured his education. Ahmad memorized the Quran at a young age and then moved on to study hadith and jurisprudence. At the age of twenty, he embarked on his scholarly journey to Mecca to perform Hajj, where he began collecting hadiths. He then traveled to many countries such as Iraq, Egypt, and the Levant to gather hadiths from scholars. Ahmad had a strong memory and an exceptional ability to memorize, which helped him in collecting and classifying hadiths. He was keen on verifying the authenticity of hadiths by studying the chain of narrators and ensuring their reliability and accuracy. \'Musnad Ahmad\' is his most famous work, containing over 30,000 hadiths, with around 10,000 hadiths without repetition. This book is considered a fundamental reference in the science of hadith and jurisprudence and is studied worldwide. In addition to \'Musnad Ahmad\', Imam Ahmad wrote many other books such as \'Al-Zuhd\' and \'Al-Ilal wa Ma\'rifat al-Rijal\'. Ahmad was known for his high morals and great humility, and he was keen on spreading knowledge and teaching people. He passed away in 241 AH in Baghdad and was buried there. Imam Ahmad is considered a symbol of knowledge and piety and is celebrated in the Islamic world as one of the greatest scholars of jurisprudence and hadith.',
      name: 'ahmedDescription',
      desc: '',
      args: [],
    );
  }

  /// `Imam Yahya ibn Sharaf al-Nawawi`
  String get alnawawiName {
    return Intl.message(
      'Imam Yahya ibn Sharaf al-Nawawi',
      name: 'alnawawiName',
      desc: '',
      args: [],
    );
  }

  /// `The Forty Hadith of Imam al-Nawawi is a collection of hadiths compiled by Imam Yahya ibn Sharaf al-Nawawi. He was born in Nawa (in present-day Syria) in 631 AH. He began collecting hadiths at a young age and traveled to many countries to gather authentic hadiths. His most famous work is 'Al-Arba'in al-Nawawiyya', which is considered one of the most important books in hadith. He passed away in 676 AH. Imam al-Nawawi grew up in a scholarly environment as his father was a well-known scholar in Nawa. After his father's death, his mother took care of his upbringing and ensured his education. Al-Nawawi memorized the Quran at a young age and then moved on to study hadith. At the age of twenty, he embarked on his scholarly journey to Mecca to perform Hajj, where he began collecting hadiths. He then traveled to many countries such as Iraq, Egypt, and the Levant to gather hadiths from scholars. Al-Nawawi had a strong memory and an exceptional ability to memorize, which helped him in collecting and classifying hadiths. He was keen on verifying the authenticity of hadiths by studying the chain of narrators and ensuring their reliability and accuracy. 'Al-Arba'in al-Nawawiyya' is his most famous work, containing 42 hadiths. This book is considered a fundamental reference in the science of hadith and is studied worldwide. In addition to 'Al-Arba'in al-Nawawiyya', Imam al-Nawawi wrote many other books such as 'Riyad al-Salihin' and 'Sharh Sahih Muslim'. Al-Nawawi was known for his high morals and great humility, and he was keen on spreading knowledge and teaching people. He passed away in 676 AH in Nawa and was buried there. Imam al-Nawawi is considered a symbol of knowledge and piety and is celebrated in the Islamic world as one of the greatest hadith scholars.`
  String get alnawawiDescription {
    return Intl.message(
      'The Forty Hadith of Imam al-Nawawi is a collection of hadiths compiled by Imam Yahya ibn Sharaf al-Nawawi. He was born in Nawa (in present-day Syria) in 631 AH. He began collecting hadiths at a young age and traveled to many countries to gather authentic hadiths. His most famous work is \'Al-Arba\'in al-Nawawiyya\', which is considered one of the most important books in hadith. He passed away in 676 AH. Imam al-Nawawi grew up in a scholarly environment as his father was a well-known scholar in Nawa. After his father\'s death, his mother took care of his upbringing and ensured his education. Al-Nawawi memorized the Quran at a young age and then moved on to study hadith. At the age of twenty, he embarked on his scholarly journey to Mecca to perform Hajj, where he began collecting hadiths. He then traveled to many countries such as Iraq, Egypt, and the Levant to gather hadiths from scholars. Al-Nawawi had a strong memory and an exceptional ability to memorize, which helped him in collecting and classifying hadiths. He was keen on verifying the authenticity of hadiths by studying the chain of narrators and ensuring their reliability and accuracy. \'Al-Arba\'in al-Nawawiyya\' is his most famous work, containing 42 hadiths. This book is considered a fundamental reference in the science of hadith and is studied worldwide. In addition to \'Al-Arba\'in al-Nawawiyya\', Imam al-Nawawi wrote many other books such as \'Riyad al-Salihin\' and \'Sharh Sahih Muslim\'. Al-Nawawi was known for his high morals and great humility, and he was keen on spreading knowledge and teaching people. He passed away in 676 AH in Nawa and was buried there. Imam al-Nawawi is considered a symbol of knowledge and piety and is celebrated in the Islamic world as one of the greatest hadith scholars.',
      name: 'alnawawiDescription',
      desc: '',
      args: [],
    );
  }

  /// `Imam Abu Muhammad Abd al-Rahman ibn Abd Allah ibn al-Darimi`
  String get darimiName {
    return Intl.message(
      'Imam Abu Muhammad Abd al-Rahman ibn Abd Allah ibn al-Darimi',
      name: 'darimiName',
      desc: '',
      args: [],
    );
  }

  /// `Imam Abdullah ibn Abdul Rahman al-Darimi is one of the greatest hadith scholars in Islam. He was born in Samarkand (in present-day Uzbekistan) in 181 AH. He began collecting hadiths at a young age and traveled to many countries to gather authentic hadiths. His most famous work is 'Sunan al-Darimi', which is considered one of the six authentic books of hadith. He passed away in 255 AH. Imam al-Darimi grew up in a scholarly environment as his father was a well-known scholar in Samarkand. After his father's death, his mother took care of his upbringing and ensured his education. Al-Darimi memorized the Quran at a young age and then moved on to study hadith. At the age of twenty, he embarked on his scholarly journey to Mecca to perform Hajj, where he began collecting hadiths. He then traveled to many countries such as Iraq, Egypt, and the Levant to gather hadiths from scholars. Al-Darimi had a strong memory and an exceptional ability to memorize, which helped him in collecting and classifying hadiths. He was keen on verifying the authenticity of hadiths by studying the chain of narrators and ensuring their reliability and accuracy. 'Sunan al-Darimi' is his most famous work, containing over 3500 hadiths, with around 1500 hadiths without repetition. This book is considered a fundamental reference in the science of hadith and is studied worldwide. In addition to 'Sunan al-Darimi', Imam al-Darimi wrote many other books such as 'Al-Musnad' and 'Al-Tarikh'. Al-Darimi was known for his high morals and great humility, and he was keen on spreading knowledge and teaching people. He passed away in 255 AH in Samarkand and was buried there. Imam al-Darimi is considered a symbol of knowledge and piety and is celebrated in the Islamic world as one of the greatest hadith scholars.`
  String get darimiDescription {
    return Intl.message(
      'Imam Abdullah ibn Abdul Rahman al-Darimi is one of the greatest hadith scholars in Islam. He was born in Samarkand (in present-day Uzbekistan) in 181 AH. He began collecting hadiths at a young age and traveled to many countries to gather authentic hadiths. His most famous work is \'Sunan al-Darimi\', which is considered one of the six authentic books of hadith. He passed away in 255 AH. Imam al-Darimi grew up in a scholarly environment as his father was a well-known scholar in Samarkand. After his father\'s death, his mother took care of his upbringing and ensured his education. Al-Darimi memorized the Quran at a young age and then moved on to study hadith. At the age of twenty, he embarked on his scholarly journey to Mecca to perform Hajj, where he began collecting hadiths. He then traveled to many countries such as Iraq, Egypt, and the Levant to gather hadiths from scholars. Al-Darimi had a strong memory and an exceptional ability to memorize, which helped him in collecting and classifying hadiths. He was keen on verifying the authenticity of hadiths by studying the chain of narrators and ensuring their reliability and accuracy. \'Sunan al-Darimi\' is his most famous work, containing over 3500 hadiths, with around 1500 hadiths without repetition. This book is considered a fundamental reference in the science of hadith and is studied worldwide. In addition to \'Sunan al-Darimi\', Imam al-Darimi wrote many other books such as \'Al-Musnad\' and \'Al-Tarikh\'. Al-Darimi was known for his high morals and great humility, and he was keen on spreading knowledge and teaching people. He passed away in 255 AH in Samarkand and was buried there. Imam al-Darimi is considered a symbol of knowledge and piety and is celebrated in the Islamic world as one of the greatest hadith scholars.',
      name: 'darimiDescription',
      desc: '',
      args: [],
    );
  }

  /// `Shah Waliullah Dahlawi`
  String get shahwaliullah40Name {
    return Intl.message(
      'Shah Waliullah Dahlawi',
      name: 'shahwaliullah40Name',
      desc: '',
      args: [],
    );
  }

  /// `Imam Shah Waliullah al-Dihlawi is one of the greatest hadith scholars in Islam. He was born in Delhi (in present-day India) in 1114 AH. He began collecting hadiths at a young age and traveled to many countries to gather authentic hadiths. His most famous work is 'Hujjat Allah al-Baligha', which is considered one of the most important books in hadith. He passed away in 1176 AH. Imam Shah Waliullah grew up in a scholarly environment as his father was a well-known scholar in Delhi. After his father's death, his mother took care of his upbringing and ensured his education. Shah Waliullah memorized the Quran at a young age and then moved on to study hadith. At the age of twenty, he embarked on his scholarly journey to Mecca to perform Hajj, where he began collecting hadiths. He then traveled to many countries such as Iraq, Egypt, and the Levant to gather hadiths from scholars. Shah Waliullah had a strong memory and an exceptional ability to memorize, which helped him in collecting and classifying hadiths. He was keen on verifying the authenticity of hadiths by studying the chain of narrators and ensuring their reliability and accuracy. 'Hujjat Allah al-Baligha' is his most famous work, containing over 4000 hadiths, with around 2600 hadiths without repetition. This book is considered a fundamental reference in the science of hadith and is studied worldwide. In addition to 'Hujjat Allah al-Baligha', Imam Shah Waliullah wrote many other books such as 'Al-Fawz al-Kabir fi Usul al-Tafsir' and 'Al-Insaf fi Bayan Asbab al-Ikhtilaf'. Shah Waliullah was known for his high morals and great humility, and he was keen on spreading knowledge and teaching people. He passed away in 1176 AH in Delhi and was buried there. Imam Shah Waliullah is considered a symbol of knowledge and piety and is celebrated in the Islamic world as one of the greatest hadith scholars.`
  String get shahwaliullah40Description {
    return Intl.message(
      'Imam Shah Waliullah al-Dihlawi is one of the greatest hadith scholars in Islam. He was born in Delhi (in present-day India) in 1114 AH. He began collecting hadiths at a young age and traveled to many countries to gather authentic hadiths. His most famous work is \'Hujjat Allah al-Baligha\', which is considered one of the most important books in hadith. He passed away in 1176 AH. Imam Shah Waliullah grew up in a scholarly environment as his father was a well-known scholar in Delhi. After his father\'s death, his mother took care of his upbringing and ensured his education. Shah Waliullah memorized the Quran at a young age and then moved on to study hadith. At the age of twenty, he embarked on his scholarly journey to Mecca to perform Hajj, where he began collecting hadiths. He then traveled to many countries such as Iraq, Egypt, and the Levant to gather hadiths from scholars. Shah Waliullah had a strong memory and an exceptional ability to memorize, which helped him in collecting and classifying hadiths. He was keen on verifying the authenticity of hadiths by studying the chain of narrators and ensuring their reliability and accuracy. \'Hujjat Allah al-Baligha\' is his most famous work, containing over 4000 hadiths, with around 2600 hadiths without repetition. This book is considered a fundamental reference in the science of hadith and is studied worldwide. In addition to \'Hujjat Allah al-Baligha\', Imam Shah Waliullah wrote many other books such as \'Al-Fawz al-Kabir fi Usul al-Tafsir\' and \'Al-Insaf fi Bayan Asbab al-Ikhtilaf\'. Shah Waliullah was known for his high morals and great humility, and he was keen on spreading knowledge and teaching people. He passed away in 1176 AH in Delhi and was buried there. Imam Shah Waliullah is considered a symbol of knowledge and piety and is celebrated in the Islamic world as one of the greatest hadith scholars.',
      name: 'shahwaliullah40Description',
      desc: '',
      args: [],
    );
  }

  /// `Al-Khatib Al-Tabrizi`
  String get tabriziName {
    return Intl.message(
      'Al-Khatib Al-Tabrizi',
      name: 'tabriziName',
      desc: '',
      args: [],
    );
  }

  /// `Mishkat al-Masabih is a book compiled by Imam Wali al-Din Muhammad ibn Abdullah al-Khatib al-Tabrizi. He was born in Tabriz (in present-day Iran) in 710 AH. He began collecting hadiths at a young age and traveled to many countries to gather authentic hadiths. His most famous work is 'Mishkat al-Masabih', which is considered one of the most important books in hadith. He passed away in 741 AH. Imam al-Tabrizi grew up in a scholarly environment as his father was a well-known scholar in Tabriz. After his father's death, his mother took care of his upbringing and ensured his education. Al-Tabrizi memorized the Quran at a young age and then moved on to study hadith. At the age of twenty, he embarked on his scholarly journey to Mecca to perform Hajj, where he began collecting hadiths. He then traveled to many countries such as Iraq, Egypt, and the Levant to gather hadiths from scholars. Al-Tabrizi had a strong memory and an exceptional ability to memorize, which helped him in collecting and classifying hadiths. He was keen on verifying the authenticity of hadiths by studying the chain of narrators and ensuring their reliability and accuracy. 'Mishkat al-Masabih' is his most famous work, containing over 6000 hadiths. This book is considered a fundamental reference in the science of hadith and is studied worldwide. In addition to 'Mishkat al-Masabih', Imam al-Tabrizi wrote many other books such as 'Al-Jami' al-Kabir' and 'Al-Jami' al-Saghir'. Al-Tabrizi was known for his high morals and great humility, and he was keen on spreading knowledge and teaching people. He passed away in 741 AH in Tabriz and was buried there. Imam al-Tabrizi is considered a symbol of knowledge and piety and is celebrated in the Islamic world as one of the greatest hadith scholars.`
  String get tabriziDescription {
    return Intl.message(
      'Mishkat al-Masabih is a book compiled by Imam Wali al-Din Muhammad ibn Abdullah al-Khatib al-Tabrizi. He was born in Tabriz (in present-day Iran) in 710 AH. He began collecting hadiths at a young age and traveled to many countries to gather authentic hadiths. His most famous work is \'Mishkat al-Masabih\', which is considered one of the most important books in hadith. He passed away in 741 AH. Imam al-Tabrizi grew up in a scholarly environment as his father was a well-known scholar in Tabriz. After his father\'s death, his mother took care of his upbringing and ensured his education. Al-Tabrizi memorized the Quran at a young age and then moved on to study hadith. At the age of twenty, he embarked on his scholarly journey to Mecca to perform Hajj, where he began collecting hadiths. He then traveled to many countries such as Iraq, Egypt, and the Levant to gather hadiths from scholars. Al-Tabrizi had a strong memory and an exceptional ability to memorize, which helped him in collecting and classifying hadiths. He was keen on verifying the authenticity of hadiths by studying the chain of narrators and ensuring their reliability and accuracy. \'Mishkat al-Masabih\' is his most famous work, containing over 6000 hadiths. This book is considered a fundamental reference in the science of hadith and is studied worldwide. In addition to \'Mishkat al-Masabih\', Imam al-Tabrizi wrote many other books such as \'Al-Jami\' al-Kabir\' and \'Al-Jami\' al-Saghir\'. Al-Tabrizi was known for his high morals and great humility, and he was keen on spreading knowledge and teaching people. He passed away in 741 AH in Tabriz and was buried there. Imam al-Tabrizi is considered a symbol of knowledge and piety and is celebrated in the Islamic world as one of the greatest hadith scholars.',
      name: 'tabriziDescription',
      desc: '',
      args: [],
    );
  }

  /// `Ibn Hajar al-Asqalani`
  String get ibnhijrName {
    return Intl.message(
      'Ibn Hajar al-Asqalani',
      name: 'ibnhijrName',
      desc: '',
      args: [],
    );
  }

  /// `Imam Ahmad ibn Ali ibn Hajar al-Asqalani. He was born in Ascalon (in present-day Palestine) in 773 AH. He began collecting hadiths at a young age and traveled to many countries to gather authentic hadiths. His most famous work is 'Bulugh al-Maram', which is considered one of the most important books in hadith. He passed away in 852 AH. Imam Ibn Hajar grew up in a scholarly environment as his father was a well-known scholar in Ascalon. After his father's death, his mother took care of his upbringing and ensured his education. Ibn Hajar memorized the Quran at a young age and then moved on to study hadith. At the age of twenty, he embarked on his scholarly journey to Mecca to perform Hajj, where he began collecting hadiths. He then traveled to many countries such as Iraq, Egypt, and the Levant to gather hadiths from scholars. Ibn Hajar had a strong memory and an exceptional ability to memorize, which helped him in collecting and classifying hadiths. He was keen on verifying the authenticity of hadiths by studying the chain of narrators and ensuring their reliability and accuracy. 'Bulugh al-Maram' is his most famous work, containing over 1500 hadiths. This book is considered a fundamental reference in the science of hadith and is studied worldwide. In addition to 'Bulugh al-Maram', Imam Ibn Hajar wrote many other books such as 'Fath al-Bari' and 'Al-Isabah fi Tamyiz al-Sahabah'. Ibn Hajar was known for his high morals and great humility, and he was keen on spreading knowledge and teaching people. He passed away in 852 AH in Cairo and was buried there. Imam Ibn Hajar is considered a symbol of knowledge and piety and is celebrated in the Islamic world as one of the greatest hadith scholars.`
  String get ibnhijrDescription {
    return Intl.message(
      'Imam Ahmad ibn Ali ibn Hajar al-Asqalani. He was born in Ascalon (in present-day Palestine) in 773 AH. He began collecting hadiths at a young age and traveled to many countries to gather authentic hadiths. His most famous work is \'Bulugh al-Maram\', which is considered one of the most important books in hadith. He passed away in 852 AH. Imam Ibn Hajar grew up in a scholarly environment as his father was a well-known scholar in Ascalon. After his father\'s death, his mother took care of his upbringing and ensured his education. Ibn Hajar memorized the Quran at a young age and then moved on to study hadith. At the age of twenty, he embarked on his scholarly journey to Mecca to perform Hajj, where he began collecting hadiths. He then traveled to many countries such as Iraq, Egypt, and the Levant to gather hadiths from scholars. Ibn Hajar had a strong memory and an exceptional ability to memorize, which helped him in collecting and classifying hadiths. He was keen on verifying the authenticity of hadiths by studying the chain of narrators and ensuring their reliability and accuracy. \'Bulugh al-Maram\' is his most famous work, containing over 1500 hadiths. This book is considered a fundamental reference in the science of hadith and is studied worldwide. In addition to \'Bulugh al-Maram\', Imam Ibn Hajar wrote many other books such as \'Fath al-Bari\' and \'Al-Isabah fi Tamyiz al-Sahabah\'. Ibn Hajar was known for his high morals and great humility, and he was keen on spreading knowledge and teaching people. He passed away in 852 AH in Cairo and was buried there. Imam Ibn Hajar is considered a symbol of knowledge and piety and is celebrated in the Islamic world as one of the greatest hadith scholars.',
      name: 'ibnhijrDescription',
      desc: '',
      args: [],
    );
  }

  /// `Ali Bin Nayif`
  String get aliBinNayifName {
    return Intl.message(
      'Ali Bin Nayif',
      name: 'aliBinNayifName',
      desc: '',
      args: [],
    );
  }

  /// `The Forty Qudsi Hadiths is a collection of sacred hadiths compiled by Muslim scholars. Qudsi hadiths are those hadiths narrated by the Prophet Muhammad (peace be upon him) from Allah Almighty. These hadiths differ from prophetic hadiths in that they are attributed directly to Allah. The Forty Qudsi Hadiths contains 40 sacred hadiths and is considered a fundamental reference in the science of hadith and is studied worldwide. These hadiths cover various topics such as monotheism, worship, and ethics. This book is considered a fundamental reference in the science of hadith and is studied worldwide.`
  String get aliBinNayifDescription {
    return Intl.message(
      'The Forty Qudsi Hadiths is a collection of sacred hadiths compiled by Muslim scholars. Qudsi hadiths are those hadiths narrated by the Prophet Muhammad (peace be upon him) from Allah Almighty. These hadiths differ from prophetic hadiths in that they are attributed directly to Allah. The Forty Qudsi Hadiths contains 40 sacred hadiths and is considered a fundamental reference in the science of hadith and is studied worldwide. These hadiths cover various topics such as monotheism, worship, and ethics. This book is considered a fundamental reference in the science of hadith and is studied worldwide.',
      name: 'aliBinNayifDescription',
      desc: '',
      args: [],
    );
  }

  /// `Sahih al-Bukhari`
  String get bukhariBookName {
    return Intl.message(
      'Sahih al-Bukhari',
      name: 'bukhariBookName',
      desc: '',
      args: [],
    );
  }

  /// `Sahih Muslim`
  String get muslimBookName {
    return Intl.message(
      'Sahih Muslim',
      name: 'muslimBookName',
      desc: '',
      args: [],
    );
  }

  /// `Sunan Abi Dawood`
  String get abudawudBookName {
    return Intl.message(
      'Sunan Abi Dawood',
      name: 'abudawudBookName',
      desc: '',
      args: [],
    );
  }

  /// `Jami' at-Tirmidhi`
  String get tirmidhiBookName {
    return Intl.message(
      'Jami\' at-Tirmidhi',
      name: 'tirmidhiBookName',
      desc: '',
      args: [],
    );
  }

  /// `Sunan an-Nasa'i`
  String get nasaiBookName {
    return Intl.message(
      'Sunan an-Nasa\'i',
      name: 'nasaiBookName',
      desc: '',
      args: [],
    );
  }

  /// `Sunan Ibn Majah`
  String get ibnmajahBookName {
    return Intl.message(
      'Sunan Ibn Majah',
      name: 'ibnmajahBookName',
      desc: '',
      args: [],
    );
  }

  /// `Muwatta Imam Malik`
  String get malikBookName {
    return Intl.message(
      'Muwatta Imam Malik',
      name: 'malikBookName',
      desc: '',
      args: [],
    );
  }

  /// `Musnad Ahmad`
  String get ahmedBookName {
    return Intl.message(
      'Musnad Ahmad',
      name: 'ahmedBookName',
      desc: '',
      args: [],
    );
  }

  /// `Riyad as-Salihin`
  String get riyadAssalihinBookName {
    return Intl.message(
      'Riyad as-Salihin',
      name: 'riyadAssalihinBookName',
      desc: '',
      args: [],
    );
  }

  /// `Al-Nawawi's Forty Hadith`
  String get nawawi40BookName {
    return Intl.message(
      'Al-Nawawi\'s Forty Hadith',
      name: 'nawawi40BookName',
      desc: '',
      args: [],
    );
  }

  /// `Shama'il Muhammadiyyah`
  String get shamailMuhammadiyahBookName {
    return Intl.message(
      'Shama\'il Muhammadiyyah',
      name: 'shamailMuhammadiyahBookName',
      desc: '',
      args: [],
    );
  }

  /// `Bulugh al-Maram`
  String get bulughAlmaramBookName {
    return Intl.message(
      'Bulugh al-Maram',
      name: 'bulughAlmaramBookName',
      desc: '',
      args: [],
    );
  }

  /// `Al-Adab al-Mufrad`
  String get aladabAlmufradBookName {
    return Intl.message(
      'Al-Adab al-Mufrad',
      name: 'aladabAlmufradBookName',
      desc: '',
      args: [],
    );
  }

  /// `Sunan al-Darimi`
  String get darimiBookName {
    return Intl.message(
      'Sunan al-Darimi',
      name: 'darimiBookName',
      desc: '',
      args: [],
    );
  }

  /// `Al-Qudsi's Forty Hadith`
  String get qudsi40BookName {
    return Intl.message(
      'Al-Qudsi\'s Forty Hadith',
      name: 'qudsi40BookName',
      desc: '',
      args: [],
    );
  }

  /// `Shah Waliullah's Forty Hadith`
  String get shahwaliullah40BookName {
    return Intl.message(
      'Shah Waliullah\'s Forty Hadith',
      name: 'shahwaliullah40BookName',
      desc: '',
      args: [],
    );
  }

  /// `Mishkat al-Masabih`
  String get mishkatAlmasabihBookName {
    return Intl.message(
      'Mishkat al-Masabih',
      name: 'mishkatAlmasabihBookName',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get bukhariBookDescription {
    return Intl.message(
      '',
      name: 'bukhariBookDescription',
      desc: '',
      args: [],
    );
  }

  /// `will add soon..`
  String get muslimBookDescription {
    return Intl.message(
      'will add soon..',
      name: 'muslimBookDescription',
      desc: '',
      args: [],
    );
  }

  /// `will add soon..`
  String get abudawudBookDescription {
    return Intl.message(
      'will add soon..',
      name: 'abudawudBookDescription',
      desc: '',
      args: [],
    );
  }

  /// `will add soon..`
  String get tirmidhiBookDescription {
    return Intl.message(
      'will add soon..',
      name: 'tirmidhiBookDescription',
      desc: '',
      args: [],
    );
  }

  /// `will add soon..`
  String get nasaiBookDescription {
    return Intl.message(
      'will add soon..',
      name: 'nasaiBookDescription',
      desc: '',
      args: [],
    );
  }

  /// `will add soon..`
  String get ibnmajahBookDescription {
    return Intl.message(
      'will add soon..',
      name: 'ibnmajahBookDescription',
      desc: '',
      args: [],
    );
  }

  /// `will add soon..`
  String get malikBookDescription {
    return Intl.message(
      'will add soon..',
      name: 'malikBookDescription',
      desc: '',
      args: [],
    );
  }

  /// `will add soon..`
  String get ahmedBookDescription {
    return Intl.message(
      'will add soon..',
      name: 'ahmedBookDescription',
      desc: '',
      args: [],
    );
  }

  /// `will add soon..`
  String get riyadAssalihinBookDescription {
    return Intl.message(
      'will add soon..',
      name: 'riyadAssalihinBookDescription',
      desc: '',
      args: [],
    );
  }

  /// `will add soon..`
  String get nawawi40BookDescription {
    return Intl.message(
      'will add soon..',
      name: 'nawawi40BookDescription',
      desc: '',
      args: [],
    );
  }

  /// `will add soon..`
  String get shamailMuhammadiyahBookDescription {
    return Intl.message(
      'will add soon..',
      name: 'shamailMuhammadiyahBookDescription',
      desc: '',
      args: [],
    );
  }

  /// `will add soon..`
  String get bulughAlmaramBookDescription {
    return Intl.message(
      'will add soon..',
      name: 'bulughAlmaramBookDescription',
      desc: '',
      args: [],
    );
  }

  /// `will add soon..`
  String get aladabAlmufradBookDescription {
    return Intl.message(
      'will add soon..',
      name: 'aladabAlmufradBookDescription',
      desc: '',
      args: [],
    );
  }

  /// `will add soon..`
  String get darimiBookDescription {
    return Intl.message(
      'will add soon..',
      name: 'darimiBookDescription',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get qudsi40BookDescription {
    return Intl.message(
      '',
      name: 'qudsi40BookDescription',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get shahwaliullah40BookDescription {
    return Intl.message(
      '',
      name: 'shahwaliullah40BookDescription',
      desc: '',
      args: [],
    );
  }

  /// `will add soon..`
  String get mishkatAlmasabihBookDescription {
    return Intl.message(
      'will add soon..',
      name: 'mishkatAlmasabihBookDescription',
      desc: '',
      args: [],
    );
  }

  /// `Book Name`
  String get bookNameStr {
    return Intl.message(
      'Book Name',
      name: 'bookNameStr',
      desc: '',
      args: [],
    );
  }

  /// `Chapter Name`
  String get chapterName {
    return Intl.message(
      'Chapter Name',
      name: 'chapterName',
      desc: '',
      args: [],
    );
  }

  /// `Hadith View Type`
  String get hadithViewType {
    return Intl.message(
      'Hadith View Type',
      name: 'hadithViewType',
      desc: '',
      args: [],
    );
  }

  /// `Change Hadith View Type`
  String get changeHadithViewType {
    return Intl.message(
      'Change Hadith View Type',
      name: 'changeHadithViewType',
      desc: '',
      args: [],
    );
  }

  /// `Note that selecting multiple books mey take some time to load`
  String get selectignMultibleBooksNote {
    return Intl.message(
      'Note that selecting multiple books mey take some time to load',
      name: 'selectignMultibleBooksNote',
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
