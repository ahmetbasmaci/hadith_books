import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';

class AppIcons {
  AppIcons._();

  static const double _size = 20;
  static Icon get darkMode => const Icon(CupertinoIcons.moon_stars);
  static Icon get lightMode => const Icon(CupertinoIcons.light_max);
  static Icon get language => const Icon(CupertinoIcons.globe);
  static Icon get backBtn => const Icon(CupertinoIcons.forward);
  static Icon get forwordBtn => const Icon(CupertinoIcons.back);
  static Icon get settings => const Icon(Icons.settings_outlined);
  static Icon get moreVert => const Icon(Icons.more_vert);
  static Icon get favoriteFilled => const Icon(Icons.favorite, size: _size);
  static Icon get favorite => const Icon(Icons.favorite_border, size: _size);
  static Icon get copy => const Icon(Icons.copy, size: _size);
  static Icon get copyFilled => const Icon(Icons.file_copy, size: _size);
  static Icon get share => const Icon(Icons.share, size: _size);
  static Icon get search => const Icon(Icons.search);
  static Icon get menu => const Icon(Icons.menu);
  static Icon optinosVertical = const Icon(Icons.more_vert);
  static Icon get filter => const Icon(Icons.filter_list);
  static Icon get checked => const Icon(Icons.check_circle_sharp);
  static Icon get unCheck => const Icon(Icons.radio_button_unchecked);
  static Icon get checkSomeItems => const Icon(Icons.circle);
  static Icon get fontSize => const Icon(Icons.format_size);

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

  static Widget animatedCheck(bool isChecked) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 200),
      firstChild: checked,
      secondChild: unCheck,
      crossFadeState: isChecked ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }

  static Widget animatedCheck3State(bool isChecked, bool isHaveItemsSelectedAndNotAll) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 200),
      firstChild: checkSomeItems,
      secondChild: animatedCheck(isChecked),
      crossFadeState: isHaveItemsSelectedAndNotAll ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}
