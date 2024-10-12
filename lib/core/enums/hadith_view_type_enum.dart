import '../../config/local/l10n.dart';
import '../core.dart';

enum HadithViewTypeEnum { scrolllable, listView }

extension HadithViewTypeEnumExtension on HadithViewTypeEnum {
  String get translate {
    switch (this) {
      case HadithViewTypeEnum.scrolllable:
        return AppStrings.of(AppConstants.context).scrolllable;
      case HadithViewTypeEnum.listView:
        return AppStrings.of(AppConstants.context).listView;
      default:
        return '';
    }
  }
}
