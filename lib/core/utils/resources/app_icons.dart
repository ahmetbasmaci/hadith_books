import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hadith_books/core/core.dart';

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
  static Icon get favorite => Icon(CupertinoIcons.heart, size: AppSizes.smallIcon);
  // static Icon get share => Icon(CupertinoIcons.share, size: AppSizes.smallIcon, color: Colors.purple);
  static Icon get search => const Icon(CupertinoIcons.search);
  static Icon get menu => const Icon(CupertinoIcons.bars);
  static Icon optinosVertical = const Icon(Icons.more_vert);
  static Icon get filter => const Icon(Icons.filter_list);
  static Icon checked({Color? color}) => Icon(Icons.check_circle_sharp, color: color);
  static Icon unCheck({Color? color}) => Icon(Icons.radio_button_unchecked, color: color);
  static Icon checkSomeItems({Color? color}) => Icon(Icons.circle, color: color);
  static Icon get fontSize => const Icon(Icons.format_size);
  static Icon get code => const Icon(Icons.code);
  static Icon get info => const Icon(Icons.info_outline);
  static Icon get close => const Icon(Icons.close);
  static Icon get hadithViewType => const Icon(Icons.view_week_rounded);
  static Icon get expandAllTexts => const Icon(Icons.expand);
  static Icon get bookInfo => const Icon(Icons.menu_book_rounded);
  static Icon get imamInfo => const Icon(Icons.person_pin_rounded);
  static Icon get home => const Icon(CupertinoIcons.house);
  static Icon get refresh => const Icon(Icons.refresh);
  static Icon arrowDown(Color? color) => Icon(Icons.keyboard_arrow_down_outlined, color: color);
  static Icon arrowUp(Color? color) => Icon(Icons.keyboard_arrow_up_outlined, color: color);

  static Icon shareIcon({Key? key, Color? color}) =>
      Icon(CupertinoIcons.share, size: AppSizes.smallIcon, color: color, key: key);

  static Icon copyIcon({Key? key, Color? color}) => Icon(Icons.copy, size: AppSizes.smallIcon, color: color, key: key);
  static Icon copyFillIcon({Key? key, Color? color}) =>
      Icon(Icons.file_copy, size: AppSizes.smallIcon, color: color, key: key);

  static Icon favoriteIcon({Key? key, Color? color}) =>
      Icon(Icons.favorite_border, size: AppSizes.smallIcon, color: color, key: key);
  static Icon favoriteFilledIcon({Key? key, Color? color}) =>
      Icon(Icons.favorite, size: AppSizes.smallIcon, color: color, key: key);

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

  static Widget animatedCheck3State(bool isAllItemsChecked, bool isHaveItemsSelected, {Color? color}) {
    bool isHaveItemsSelectedAndNotAll = isHaveItemsSelected && !isAllItemsChecked;
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 200),
      firstChild: checkSomeItems(color: color),
      secondChild: animatedCheck(isAllItemsChecked, color: color),
      crossFadeState: isHaveItemsSelectedAndNotAll ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }

  static Widget animatedCheck(bool isChecked, {Color? color}) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 200),
      firstChild: checked(color: color),
      secondChild: unCheck(color: color),
      crossFadeState: isChecked ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}
