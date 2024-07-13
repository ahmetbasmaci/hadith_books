import 'package:flutter/widgets.dart';

import '../responsive/responsive_manager.dart';

abstract class AppStyles {
  AppStyles._();
  static TextStyle styleReguler12 = TextStyle(
    color: const Color(0xffAAAAAA),
    fontSize: ResponsiveManager.responsiveFontSize(12),
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w400,
  );

  static TextStyle styleReguler14 = TextStyle(
    color: const Color(0xffAAAAAA),
    fontSize: ResponsiveManager.responsiveFontSize(14),
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w400,
  );

  static TextStyle styleReguler16 = TextStyle(
    color: const Color(0xff064061),
    fontSize: ResponsiveManager.responsiveFontSize(16),
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w400,
  );
  static TextStyle styleMedium16 = TextStyle(
    color: const Color(0xFFFFFFFF),
    fontSize: ResponsiveManager.responsiveFontSize(16),
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w500,
  );
  static TextStyle styleSemiBold16 = TextStyle(
    color: const Color(0xff064061),
    fontSize: ResponsiveManager.responsiveFontSize(16),
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600,
  );
  static TextStyle styleBold16 = TextStyle(
    color: const Color(0xff4EB7F2),
    fontSize: ResponsiveManager.responsiveFontSize(16),
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w700,
  );

  static TextStyle styleSemiBold18 = TextStyle(
    color: const Color(0xff4EB7F2),
    fontSize: ResponsiveManager.responsiveFontSize(18),
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600,
  );

  static TextStyle styleMedium20 = TextStyle(
    color: const Color(0xff064061),
    fontSize: ResponsiveManager.responsiveFontSize(20),
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w500,
  );
  static TextStyle styleSemiBold20 = TextStyle(
    color: const Color(0xff064061),
    fontSize: ResponsiveManager.responsiveFontSize(20),
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600,
  );

  static TextStyle styleSemiBold24 = TextStyle(
    color: const Color(0xff4EB7F2),
    fontSize: ResponsiveManager.responsiveFontSize(24),
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600,
  );
}
