import 'package:hadith_books/config/local/l10n.dart';
import 'package:hadith_books/core/core.dart';
enum AppFontsEnum {
  uthmanic,
  uthmanic2,
  kfgqpc,
  naskh,
  arquran,
  maddina,
  noorehira,
  scheherazade,
}

extension AppFontsEnumExtension on AppFontsEnum {
  String get translate {
    switch (this) {
      case AppFontsEnum.uthmanic:
        return AppStrings.of(AppConstants.context).uthmanic;
      case AppFontsEnum.uthmanic2:
        return AppStrings.of(AppConstants.context).uthmanic2;
      case AppFontsEnum.kfgqpc:
        return AppStrings.of(AppConstants.context).kfgqpc;
      case AppFontsEnum.naskh:
        return AppStrings.of(AppConstants.context).naskh;
      case AppFontsEnum.arquran:
        return AppStrings.of(AppConstants.context).arquran;
      case AppFontsEnum.maddina:
        return AppStrings.of(AppConstants.context).maddina;
      case AppFontsEnum.noorehira:
        return AppStrings.of(AppConstants.context).noorehira;
      case AppFontsEnum.scheherazade:
        return AppStrings.of(AppConstants.context).scheherazade;
      default:
        return '';
    }
  }
}
