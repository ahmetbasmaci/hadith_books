import 'package:flutter/material.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';
import 'theme_colors.dart';

class AppThemes {
  static List<ThemeData> themes = [_light, _dark].toList();

  static ThemeColors get lightColor => ThemeColors(
        brightness: Brightness.light,
        background: const Color(0xFFf5f5f5),
        primary: const Color(0xFF019592),
        secondary: const Color(0xFF258DCE),
        third: const Color(0xFFa3ee02),
        natural: const Color(0xFF475467),
        success: const Color(0xff009D48),
        error: const Color(0xFFD2392D),
        warning: const Color(0xFFE78C26),
        onError: Colors.white,
        onSuccess: Colors.white,
        surface: const Color(0xFFf5f5f5),
      );

  static ThemeColors get darkColor => ThemeColors(
        brightness: Brightness.dark,
        background: const Color(0xff121212),
        primary: const Color(0xff03dac5),
        secondary: const Color(0xffA2CAF4),
        third: const Color(0xFFa3ee02),
        natural: const Color(0xFFD0D5DD),
        success: const Color(0xFF8BD7A0),
        error: const Color(0xFFFFAC9A),
        warning: const Color(0xFFFFB876),
        onError: Colors.white,
        onSuccess: Colors.white,
        surface: const Color(0xFF121212),
      );

  static final ThemeData _light = _setTheme(lightColor);

  static final ThemeData _dark = _setTheme(darkColor);

  static ThemeData _setTheme(ThemeColors themeColors) {
    return ThemeData(
      colorScheme: themeColors.brightness == Brightness.dark
          ? ColorScheme.dark(
              primary: themeColors.primary,
              error: themeColors.error,
              secondary: themeColors.secondary,
            )
          : ColorScheme.light(
              primary: themeColors.primary,
              error: themeColors.error,
              secondary: themeColors.secondary,
            ),
      appBarTheme: _appBarTheme(themeColors),
      scaffoldBackgroundColor: themeColors.background,
      iconTheme: _appIconThemeData(themeColors),
      iconButtonTheme: _appIconButtonThemeData(themeColors),
      // textTheme: _appTextTheme(themeColors),
      dialogTheme: _appDialogTheme(themeColors),
      listTileTheme: _appListTileThemeData(themeColors),
      cardTheme: _cardTheme(themeColors),
      elevatedButtonTheme: _elevatedButtonTheme(themeColors),
    );
  }

  static AppBarTheme _appBarTheme(ThemeColors themeColors) {
    return AppBarTheme(
      elevation: 10,
      // backgroundColor: themeColors.background,
      // titleTextStyle: TextStyle(color: themeColors.primary),
      iconTheme: _appIconThemeData(themeColors),
    );
  }

  static IconThemeData _appIconThemeData(ThemeColors themeColors) {
    return IconThemeData(
      color: themeColors.primary,
      size: AppSizes.smallIcon,
    );
  }

  static IconButtonThemeData _appIconButtonThemeData(ThemeColors themeColors) {
    return IconButtonThemeData(
      style: ButtonStyle(
        iconSize: WidgetStateProperty.all<double>(AppSizes.icon),
        foregroundColor: WidgetStateProperty.all<Color>(themeColors.primary),
      ),
    );
  }

  // static TextTheme _appTextTheme(ThemeColors themeColors) {
  //   String fontFamily = AppFonts.naskh.name;
  //   return TextTheme(
  //     titleLarge: TextStyle(fontFamily: fontFamily, fontSize: 23),
  //     titleMedium: TextStyle(fontFamily: fontFamily, fontSize: 21),
  //     bodyMedium: TextStyle(fontFamily: fontFamily, fontSize: 17),
  //   );
  // }

  static ListTileThemeData _appListTileThemeData(ThemeColors themeColors) {
    return ListTileThemeData(
      tileColor: Colors.transparent,
      selectedColor: themeColors.primary,
      titleTextStyle: AppStyles.titleMeduim,
      subtitleTextStyle: AppStyles.normal,
    );
  }

  static DialogTheme _appDialogTheme(ThemeColors themeColors) {
    return DialogTheme(
      backgroundColor: themeColors.background,
      elevation: 0,
    );
  }

  static CardTheme _cardTheme(ThemeColors themeColors) {
    return CardTheme(
      elevation: 5,
      shadowColor: themeColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.borderRadius),
      ),
    );
  }

  static ElevatedButtonThemeData _elevatedButtonTheme(ThemeColors themeColors) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(themeColors.primary),
        foregroundColor: WidgetStateProperty.all<Color>(themeColors.background),
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.smallBorderRadius),
          ),
        ),
      ),
    );
  }
}
