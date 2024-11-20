import 'package:flutter/material.dart';
import 'package:hadith_books/core/core.dart';

import '../../../config/local/l10n.dart';
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
        .replaceAll('أ', 'ا')
        .replaceAll('إ', 'ا')
        .replaceAll('آ', 'ا')
        .replaceAll('ؤ', 'و')
        .replaceAll('ئ', 'ى');
  }

  String get removeTashkilAndSpace {
    return removeTashkil.replaceAll(' ', '');
  }

  String get removeSurahString {
    return replaceAll('سُورَةُ', '');
  }

  bool get isArabicLetter {
    return AppConstants.arabicLetters.contains(this);
  }

  bool get isEnglishLetter {
    return AppConstants.englishLetters.contains(this);
  }

  String get asFileName {
    // convert value to make it able to set as file_name insted of fileName
    //convert capital letters to underscore and small letters
    return replaceAllMapped(RegExp(r'[A-Z]'), (match) {
      return '_${match.group(0)!.toLowerCase()}';
    });
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

extension AppStringsExtensions on AppStrings {
  String autherName(String key) {
    switch (key) {
      case "bukhariName":
        return bukhariName;
      case "muslimName":
        return muslimName;
      case "abudawudName":
        return abudawudName;
      case "tirmidhiName":
        return tirmidhiName;
      case "nasaiName":
        return nasaiName;
      case "ibnmajahName":
        return ibnmajahName;
      case "malikName":
        return malikName;
      case "ahmedName":
        return ahmedName;
      case "darimiName":
        return darimiName;
      case "alnawawiName":
        return alnawawiName;
      case "shahwaliullah40Name":
        return shahwaliullah40Name;
      case "tabriziName":
        return tabriziName;
      case "ibnhijrName":
        return ibnhijrName;
      case "aliBinNayifName":
        return aliBinNayifName;
      default:
        return key;
    }
  }

  String autherDescription(String key) {
    switch (key) {
      case "bukhariDescription":
        return bukhariDescription;
      case "muslimDescription":
        return muslimDescription;
      case "abudawudDescription":
        return abudawudDescription;
      case "tirmidhiDescription":
        return tirmidhiDescription;
      case "nasaiDescription":
        return nasaiDescription;
      case "ibnmajahDescription":
        return ibnmajahDescription;
      case "malikDescription":
        return malikDescription;
      case "ahmedDescription":
        return ahmedDescription;
      case "darimiDescription":
        return darimiDescription;
      case "alnawawiDescription":
        return alnawawiDescription;
      case "shahwaliullah40Description":
        return shahwaliullah40Description;
      case "tabriziDescription":
        return tabriziDescription;
      case "ibnhijrDescription":
        return ibnhijrDescription;
      case "aliBinNayifDescription":
        return aliBinNayifDescription;
      default:
        return key;
    }
  }

  String bookName(String key) {
    switch (key) {
      case "bukhariBookName":
      case "bukhari":
        return bukhariBookName;
      case "muslimBookName":
      case "muslim":
        return muslimBookName;
      case "abudawudBookName":
      case "abudawud":
        return abudawudBookName;
      case "tirmidhiBookName":
      case "tirmidhi":
        return tirmidhiBookName;
      case "nasaiBookName":
      case "nasai":
        return nasaiBookName;
      case "ibnmajahBookName":
      case "ibnmajah":
        return ibnmajahBookName;
      case "malikBookName":
      case "malik":
        return malikBookName;
      case "ahmedBookName":
      case "ahmed":
        return ahmedBookName;
      case "riyadAssalihinBookName":
      case "riyadAssalihin":
        return riyadAssalihinBookName;
      case "nawawiBookName":
      case "nawawi40":
        return nawawi40BookName;
      case "shamailMuhammadiyahBookName":
      case "shamailMuhammadiyah":
        return shamailMuhammadiyahBookName;
      case "bulughAlmaramBookName":
      case "bulughAlmaram":
        return bulughAlmaramBookName;
      case "aladabAlmufradBookName":
      case "aladabAlmufrad":
        return aladabAlmufradBookName;
      case "darimiBookName":
      case "darimi":
        return darimiBookName;
      case "qudsi40BookName":
      case "qudsi40":
        return qudsi40BookName;
      case "shahwaliullah40BookName":
      case "shahwaliullah40":
        return shahwaliullah40BookName;
      case "mishkatAlmasabihBookName":
      case "mishkatAlmasabih":
        return mishkatAlmasabihBookName;
      default:
        return key;
    }
  }

  String bookDescription(String key) {
    switch (key) {
      case "bukhariBookDescription":
        return bukhariBookDescription;
      case "muslimBookDescription":
        return muslimBookDescription;
      case "abudawudBookDescription":
        return abudawudBookDescription;
      case "tirmidhiBookDescription":
        return tirmidhiBookDescription;
      case "nasaiBookDescription":
        return nasaiBookDescription;
      case "ibnmajahBookDescription":
        return ibnmajahBookDescription;
      case "malikBookDescription":
        return malikBookDescription;
      case "ahmedBookDescription":
        return ahmedBookDescription;
      case "riyadAssalihinBookDescription":
        return riyadAssalihinBookDescription;
      case "nawawi40BookDescription":
        return nawawi40BookDescription;
      case "shamailMuhammadiyahBookDescription":
        return shamailMuhammadiyahBookDescription;
      case "bulughAlmaramBookDescription":
        return bulughAlmaramBookDescription;
      case "aladabAlmufradBookDescription":
        return aladabAlmufradBookDescription;
      case "darimiBookDescription":
        return darimiBookDescription;
      case "qudsi40BookDescription":
        return qudsi40BookDescription;
      case "shahwaliullah40BookDescription":
        return shahwaliullah40BookDescription;
      case "mishkatAlmasabihBookDescription":
        return mishkatAlmasabihBookDescription;
      default:
        return key;
    }
  }
}
