import 'package:flutter/material.dart';

import '../responsive/responsive_manager.dart';

abstract class AppStyles {
  AppStyles._();
  static const double _xSmallFontSize = 11;
  static const double _smallFontSize = 13;
  static const double _defaultFontSize = 16;
  static const double _titleFontSize = 18;
  static const double _titleMiduemFontSize = 20;
  static const double _titleBigFontSize = 23;
  static const double _titleXBigFontSize = 26;
  // static TextStyle get _defaultFontStyle => GoogleFonts.amiri();
  // static TextStyle get hadithContentFontStyle => GoogleFonts.montserrat();
  static TextStyle get hadithContentFontStyle => TextStyle(
        fontFamily: 'Montserrat',
      );
  static TextStyle get _defaultFontStyle => TextStyle(
        fontFamily: 'Amiri',
      );

  static TextStyle get xSmall => _defaultFontStyle.copyWith(
        fontSize: ResponsiveManager.responsiveFontSize(_xSmallFontSize),
      );

  static TextStyle get small => _defaultFontStyle.copyWith(
        fontSize: ResponsiveManager.responsiveFontSize(_smallFontSize),
        height: 2,
        // wordSpacing: 2,
      );

  static TextStyle get normal => _defaultFontStyle.copyWith(
        fontSize: ResponsiveManager.responsiveFontSize(_defaultFontSize),
        height: 2,
        // wordSpacing: 2,
      );
  static TextStyle get normalHadithContent => hadithContentFontStyle.copyWith(
        fontSize: ResponsiveManager.responsiveFontSize(_defaultFontSize),
        height: 1.75,
      );

  static TextStyle get titleSmall => _defaultFontStyle.copyWith(
        fontSize: ResponsiveManager.responsiveFontSize(_titleFontSize),
        fontWeight: FontWeight.w400,
      );

  static TextStyle get titleMeduim => _defaultFontStyle.copyWith(
        fontSize: ResponsiveManager.responsiveFontSize(_titleMiduemFontSize),
      );

  static TextStyle get titleBig => _defaultFontStyle.copyWith(
        fontSize: ResponsiveManager.responsiveFontSize(_titleBigFontSize),
      );

  static TextStyle get titleXBig => _defaultFontStyle.copyWith(
        fontSize: ResponsiveManager.responsiveFontSize(_titleXBigFontSize),
      );
}
