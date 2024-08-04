import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';

class AppIcons {
  AppIcons._();

  static double size = 20;
  static Icon get darkMode => const Icon(CupertinoIcons.moon_stars);
  static Icon get lightMode => const Icon(CupertinoIcons.light_max);
  static Icon get language => const Icon(CupertinoIcons.globe);
  static Icon get backBtn => const Icon(CupertinoIcons.forward);
  static Icon get forwordBtn => const Icon(CupertinoIcons.back);
  static Icon get settings => const Icon(Icons.settings_outlined);
  static Icon get moreVert => const Icon(Icons.more_vert);
  static Icon get favoriteFilled => Icon(Icons.favorite, size: size);
  static Icon get favorite => Icon(Icons.favorite_border, size: size);
  static Icon get copy => Icon(Icons.copy, size: size);
  static Icon get copyFilled => Icon(Icons.file_copy, size: size);
  static Icon get share => Icon(Icons.share, size: size);
  static Icon get search => const Icon(Icons.search);
  static Icon get menu => const Icon(Icons.menu);
  static Icon optinosVertical = const Icon(Icons.more_vert);

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
}
