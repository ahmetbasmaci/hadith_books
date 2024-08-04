import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadith_books/core/utils/resources/app_constants.dart';
import 'package:hadith_books/core/utils/resources/app_extentions.dart';

import '../responsive/responsive_manager.dart';

abstract class AppStyles {
  AppStyles._();
  static TextStyle get _fontStyle => GoogleFonts.amiri(color: AppConstants.context.themeColors.onBackground);
  static TextStyle get normal => _fontStyle.copyWith(
        fontSize: ResponsiveManager.responsiveFontSize(16),
        fontWeight: FontWeight.w400,
        height: 2,
        wordSpacing: 2,
      );

  static TextStyle get normalBold => normal.copyWith(
        fontWeight: FontWeight.w800,
      );
  static TextStyle get titleSmall => _fontStyle.copyWith(
        fontSize: ResponsiveManager.responsiveFontSize(18),
        fontWeight: FontWeight.w400,
      );
  static TextStyle get titleSmallBold => titleSmall.copyWith(
        fontWeight: FontWeight.w800,
      );
  static TextStyle get titleMeduim => _fontStyle.copyWith(
        fontSize: ResponsiveManager.responsiveFontSize(20),
        fontWeight: FontWeight.w400,
      );
  static TextStyle get titleMeduimBold => titleMeduim.copyWith(
        fontWeight: FontWeight.w800,
      );
  static TextStyle get titleBig => _fontStyle.copyWith(
        fontSize: ResponsiveManager.responsiveFontSize(23),
        fontWeight: FontWeight.w400,
      );
  static TextStyle get titleBigBold => titleBig.copyWith(
        fontWeight: FontWeight.w800,
      );
}
