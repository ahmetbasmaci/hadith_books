import 'package:flutter/material.dart';

import '../../../config/theme/app_themes.dart';
import '../../../config/theme/theme_colors.dart';
import 'resources.dart';

extension ContextExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  ThemeData get theme => Theme.of(this);
  ThemeColors get themeColors => ThemeColors(
        brightness: Theme.of(this).brightness,
        background: Theme.of(this).colorScheme.surface,
        primary: Theme.of(this).colorScheme.primary,
        secondary: Theme.of(this).colorScheme.secondary,
        third: isDark ? AppThemes.darkColor.third : AppThemes.lightColor.third,
        natural: isDark ? AppThemes.darkColor.natural : AppThemes.lightColor.natural,
        success: isDark ? AppThemes.darkColor.success : AppThemes.lightColor.success,
        error: Theme.of(this).colorScheme.error,
        warning: isDark ? AppThemes.darkColor.warning : AppThemes.lightColor.warning,
        onBackground: Theme.of(this).colorScheme.onSurface,
        onError: Theme.of(this).colorScheme.onError,
        onSuccess: isDark ? AppThemes.darkColor.onSuccess : AppThemes.lightColor.onSuccess,
        surface: Theme.of(this).colorScheme.surface,
      );
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
  String? get currentRoute => ModalRoute.of(this)?.settings.name;
  String get localeCode => Localizations.localeOf(this).languageCode;
  bool get isArabicLang => localeCode == 'ar';
}

extension StringExtentions on String {
  String get removeTashkil {
    return replaceAll(RegExp(AppConstants.arabicTashkil.join('|')), '')
        // .replaceAll('\u064A\u0653', 'يا') //ARABIC MADDAH ABOVE
        // .replaceAll('\u0624', '\u0648') //Replace Waw Hamza Above by Waw
        // .replaceAll('\u0626', '\u064A') //Replace Ya
        // // Replace Alifs with Hamza Above/Below
        // // and with Madda Above by Alif
        // .replaceAll('\u0622', '\u0627')
        // .replaceAll('\u0623', '\u0627')
        // .replaceAll('\u0625', '\u0627')

        ;
  }

  String get removeTashkilAndSpace {
    return removeTashkil.replaceAll(' ', '');
  }

  String get removeSurahString {
    return replaceAll('سُورَةُ', '');
  }
}

extension IntExtensions on int {
  String get toArabicNumber {
    return toString()
        .replaceAll('0', '٠')
        .replaceAll('1', '١')
        .replaceAll('2', '٢')
        .replaceAll('3', '٣')
        .replaceAll('4', '٤')
        .replaceAll('5', '٥')
        .replaceAll('6', '٦')
        .replaceAll('7', '٧')
        .replaceAll('8', '٨')
        .replaceAll('9', '٩');
  }
}

extension TextStyleExtensions on TextStyle {
  TextStyle get bold {
    return copyWith(fontWeight: FontWeight.w800);
  }

  TextStyle get natural {
    return copyWith(
      color: AppConstants.context.themeColors.natural,
    );
  }
}
