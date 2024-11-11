import 'package:flutter/material.dart';

class AppConstants {
  AppConstants._();
  static const String developerEmail = 'engahmet10@gmail.com';
  static const String developerWhatsapp = '+9605398416843';
  static const String appLink = 'https://play.google.com/store/apps/details?id=com.ahmet.hadithBooks';

  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>(); // Create a key to can open drawer
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static BuildContext get context => navigatorKey.currentState!.context;
  static FocusScopeNode focusScopeNode = FocusScopeNode();

  static List<String> get arabicTashkil => [
        ('ٱ'), //change alef
        ('\u0610'), //ARABIC SIGN SALLALLAHOU ALAYHE WA SALLAM
        ('\u0611'), //ARABIC SIGN ALAYHE ASSALLAM
        ('\u0612'), //ARABIC SIGN RAHMATULLAH ALAYHE
        ('\u0613'), //ARABIC SIGN RADI ALLAHOU ANHU
        ('\u0614'), //ARABIC SIGN TAKHALLUS

        //Remove koranic anotation
        ('\u0615'), //ARABIC SMALL HIGH TAH
        ('\u0616'), //ARABIC SMALL HIGH LIGATURE ALEF WITH LAM WITH YEH
        ('\u0617'), //ARABIC SMALL HIGH ZAIN
        ('\u0618'), //ARABIC SMALL FATHA
        ('\u0619'), //ARABIC SMALL DAMMA
        ('\u061A'), //ARABIC SMALL KASRA
        ('\u06D6'), //ARABIC SMALL HIGH LIGATURE SAD WITH LAM WITH ALEF MAKSURA
        ('\u06D7'), //ARABIC SMALL HIGH LIGATURE QAF WITH LAM WITH ALEF MAKSURA
        ('\u06D8'), //ARABIC SMALL HIGH MEEM INITIAL FORM
        ('\u06D9'), //ARABIC SMALL HIGH LAM ALEF
        ('\u06DA'), //ARABIC SMALL HIGH JEEM
        ('\u06DB'), //ARABIC SMALL HIGH THREE DOTS
        ('\u06DC'), //ARABIC SMALL HIGH SEEN
        ('\u06DD'), //ARABIC END OF AYAH
        ('\u06DE'), //ARABIC START OF RUB EL HIZB
        ('\u06DF'), //ARABIC SMALL HIGH ROUNDED ZERO
        ('\u06E0'), //ARABIC SMALL HIGH UPRIGHT RECTANGULAR ZERO
        ('\u06E1'), //ARABIC SMALL HIGH DOTLESS HEAD OF KHAH
        ('\u06E2'), //ARABIC SMALL HIGH MEEM ISOLATED FORM
        ('\u06E3'), //ARABIC SMALL LOW SEEN
        ('\u06E4'), //ARABIC SMALL HIGH MADDA
        ('\u06E5'), //ARABIC SMALL WAW
        ('\u06E6'), //ARABIC SMALL YEH
        ('\u06E7'), //ARABIC SMALL HIGH YEH
        ('\u06E8'), //ARABIC SMALL HIGH NOON
        ('\u06E9'), //ARABIC PLACE OF SAJDAH
        ('\u06EA'), //ARABIC EMPTY CENTRE LOW STOP
        ('\u06EB'), //ARABIC EMPTY CENTRE HIGH STOP
        ('\u06EC'), //ARABIC ROUNDED HIGH STOP WITH FILLED CENTRE
        ('\u06ED'), //ARABIC SMALL LOW MEEM

        //Remove tatweel
        ('\u0640'),

        //Remove tashkeel
        ('\u064B'), //ARABIC FATHATAN
        ('\u064C'), //ARABIC DAMMATAN
        ('\u064D'), //ARABIC KASRATAN
        ('\u064E'), //ARABIC FATHA
        ('\u064F'), //ARABIC DAMMA
        ('\u0650'), //ARABIC KASRA
        ('\u0651'), //ARABIC SHADDA
        ('\u0652'), //ARABIC SUKUN

        ('\u0654'), //ARABIC HAMZA ABOVE
        ('\u0655'), //ARABIC HAMZA BELOW

        ('\u0656'), //ARABIC SUBSCRIPT ALEF
        ('\u0657'), //ARABIC INVERTED DAMMA
        ('\u0658'), //ARABIC MARK NOON GHUNNA
        ('\u0659'), //ARABIC ZWARAKAY
        ('\u065A'), //ARABIC VOWEL SIGN SMALL V ABOVE
        ('\u065B'), //ARABIC VOWEL SIGN INVERTED SMALL V ABOVE
        ('\u065C'), //ARABIC VOWEL SIGN DOT BELOW
        ('\u065D'), //ARABIC REVERSED DAMMA

        ('\u065E'), //ARABIC FATHA WITH TWO DOTS
        ('\u065F'), //ARABIC WAVY HAMZA BELOW
        ('\u0670'), //ARABIC LETTER SUPERSCRIPT ALEF

        ('\u0653'), //ARABIC MADDAH ABOVE

        ('\u060C'), //ARABIC COMMA
        ('\u061B'), //ARABIC SEMICOLON
        ('\u061F'), //ARABIC QUESTION MARK
        ('\u066A'), //ARABIC PERCENT SIGN
        ('\u066B'), //ARABIC DECIMAL SEPARATOR
        ('\u066C'), //ARABIC TH
      ];

  static List<String> get arabicLetters => [
        ('ا'),
        ('ب'),
        ('ت'),
        ('ث'),
        ('ج'),
        ('ح'),
        ('خ'),
        ('د'),
        ('ذ'),
        ('ر'),
        ('ز'),
        ('س'),
        ('ش'),
        ('ص'),
        ('ض'),
        ('ط'),
        ('ظ'),
        ('ع'),
        ('غ'),
        ('ف'),
        ('ق'),
        ('ك'),
        ('ل'),
        ('م'),
        ('ن'),
        ('ه'),
        ('و'),
        ('ي'),
        ('ء'),
        ('آ'),
        ('أ'),
        ('إ'),
        ('ؤ'),
        ('ة'),
        ('ى'),
      ];

  static List<String> get englishLetters => [
        ('a'),
        ('b'),
        ('c'),
        ('d'),
        ('e'),
        ('f'),
        ('g'),
        ('h'),
        ('i'),
        ('j'),
        ('k'),
        ('l'),
        ('m'),
        ('n'),
        ('o'),
        ('p'),
        ('q'),
        ('r'),
        ('s'),
        ('t'),
        ('u'),
        ('v'),
        ('w'),
        ('x'),
        ('y'),
        ('z'),
      ];
}
