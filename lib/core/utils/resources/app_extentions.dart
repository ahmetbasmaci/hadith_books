import 'package:flutter/material.dart';

import '../../../config/theme/app_themes.dart';
import '../../../config/theme/theme_colors.dart';

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
