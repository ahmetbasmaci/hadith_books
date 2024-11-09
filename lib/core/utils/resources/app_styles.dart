import 'package:flutter/material.dart';

import '../responsive/responsive_manager.dart';

abstract class AppStyles {
  AppStyles._();
  // static TextStyle get _defaultFontStyle => GoogleFonts.amiri();
  // static TextStyle get hadithContentFontStyle => GoogleFonts.montserrat();
  static TextStyle get hadithContentFontStyle => TextStyle(
        fontFamily: 'Montserrat',
      );
  static TextStyle get _defaultFontStyle => TextStyle(
        fontFamily: 'Amiri',
      );
  static TextStyle get normal => _defaultFontStyle.copyWith(
        fontSize: ResponsiveManager.responsiveFontSize(16),
        height: 2,
        // wordSpacing: 2,
      );
  static TextStyle get normalHadithContent => hadithContentFontStyle.copyWith(
        // fontSize: normal.fontSize,
        height: 1.75,
      );

  static TextStyle get normalBold => normal.copyWith(
        fontWeight: FontWeight.w800,
      );

  static TextStyle get titleSmall => _defaultFontStyle.copyWith(
        fontSize: ResponsiveManager.responsiveFontSize(18),
        fontWeight: FontWeight.w400,
      );
  static TextStyle get titleSmallBold => titleSmall.copyWith(
        fontWeight: FontWeight.w800,
      );
  static TextStyle get titleMeduim => _defaultFontStyle.copyWith(
        fontSize: ResponsiveManager.responsiveFontSize(20),
        fontWeight: FontWeight.w400,
      );
  static TextStyle get titleMeduimBold => titleMeduim.copyWith(
        fontWeight: FontWeight.w800,
      );
  static TextStyle get titleBig => _defaultFontStyle.copyWith(
        fontSize: ResponsiveManager.responsiveFontSize(23),
        fontWeight: FontWeight.w400,
      );
  static TextStyle get titleBigBold => titleBig.copyWith(
        fontWeight: FontWeight.w800,
      );
  static TextStyle get titleXBig => _defaultFontStyle.copyWith(
        fontSize: ResponsiveManager.responsiveFontSize(30),
        fontWeight: FontWeight.w400,
      );
  static TextStyle get titleXBigBold => titleXBig.copyWith(
        fontWeight: FontWeight.w800,
      );
}
