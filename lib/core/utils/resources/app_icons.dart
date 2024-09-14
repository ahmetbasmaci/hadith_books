import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hadith_books/core/core.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';

class AppIcons {
  AppIcons._();

  static Icon get darkMode => const Icon(CupertinoIcons.moon_stars);
  static Icon get lightMode => const Icon(CupertinoIcons.light_max);
  static Icon get language => const Icon(CupertinoIcons.globe);
  static Icon get backBtn => const Icon(CupertinoIcons.forward);
  static Icon get forwordBtn => const Icon(CupertinoIcons.back);
  static Icon get settings => const Icon(Icons.settings_outlined);
  static Icon get moreVert => const Icon(Icons.more_vert);
  static Icon get favoriteFilled => Icon(Icons.favorite, size: AppSizes.smallIcon);
  static Icon get favorite => Icon(Icons.favorite_border, size: AppSizes.smallIcon);
  static Icon get copy => Icon(Icons.copy, size: AppSizes.smallIcon);
  static Icon get copyFilled => Icon(Icons.file_copy, size: AppSizes.smallIcon);
  static Icon get share => Icon(Icons.share, size: AppSizes.smallIcon);
  static Icon get search => const Icon(Icons.search);
  static Icon get menu => const Icon(Icons.menu);
  static Icon optinosVertical = const Icon(Icons.more_vert);
  static Icon get filter => const Icon(Icons.filter_list);
  static Icon get checked => const Icon(Icons.check_circle_sharp);
  static Icon get unCheck => const Icon(Icons.radio_button_unchecked);
  static Icon get checkSomeItems => const Icon(Icons.circle);
  static Icon get fontSize => const Icon(Icons.format_size);
  static Icon get code => const Icon(Icons.code);
  static Icon get close => const Icon(Icons.close);

  static Icon copyIcon({Key? key}) => Icon(Icons.copy, size: AppSizes.smallIcon, key: key);
  static Icon copyFillIcon({Key? key}) => Icon(Icons.file_copy, size: AppSizes.smallIcon, key: key);

  static Icon favoriteIcon({Key? key}) => Icon(Icons.favorite_border, size: AppSizes.smallIcon, key: key);
  static Icon favoriteFilledIcon({Key? key}) => Icon(Icons.favorite, size: AppSizes.smallIcon, key: key);

  static Widget get animatedLightDark {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 200),
      firstChild: lightMode,
      secondChild: darkMode,
      crossFadeState: AppConstants.context.theme.brightness == Brightness.dark
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
    );
  }

  static Widget animatedCheck3State(bool isAllItemsChecked, bool isHaveItemsSelected) {
    bool isHaveItemsSelectedAndNotAll = isHaveItemsSelected && !isAllItemsChecked;
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 200),
      firstChild: checkSomeItems,
      secondChild: animatedCheck(isAllItemsChecked),
      crossFadeState: isHaveItemsSelectedAndNotAll ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }

  static Widget animatedCheck(bool isChecked) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 200),
      firstChild: checked,
      secondChild: unCheck,
      crossFadeState: isChecked ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}
