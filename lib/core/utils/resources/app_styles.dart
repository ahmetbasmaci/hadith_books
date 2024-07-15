import 'package:flutter/widgets.dart';

import '../responsive/responsive_manager.dart';

abstract class AppStyles {
  AppStyles._();
  static TextStyle normal = TextStyle(
    fontSize: ResponsiveManager.responsiveFontSize(16),
    fontWeight: FontWeight.w400,
  );
  static TextStyle normalBold = TextStyle(
    fontSize: ResponsiveManager.responsiveFontSize(16),
    fontWeight: FontWeight.w800,
  );
  static TextStyle titleSmall = TextStyle(
    fontSize: ResponsiveManager.responsiveFontSize(18),
    fontWeight: FontWeight.w400,
  );
  static TextStyle titleSmallBold = TextStyle(
    fontSize: ResponsiveManager.responsiveFontSize(18),
    fontWeight: FontWeight.w800,
  );
  static TextStyle titleMeduim = TextStyle(
    fontSize: ResponsiveManager.responsiveFontSize(20),
    fontWeight: FontWeight.w400,
  );
  static TextStyle titleMeduimBold = TextStyle(
    fontSize: ResponsiveManager.responsiveFontSize(20),
    fontWeight: FontWeight.w800,
  );
  static TextStyle titleBig = TextStyle(
    fontSize: ResponsiveManager.responsiveFontSize(23),
    fontWeight: FontWeight.w400,
  );
  static TextStyle titleBigBold = TextStyle(
    fontSize: ResponsiveManager.responsiveFontSize(23),
    fontWeight: FontWeight.w800,
  );
}
