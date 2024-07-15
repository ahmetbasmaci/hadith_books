import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';

class AppIcons {
  AppIcons._();

  static Icon get darkMode => const Icon(CupertinoIcons.moon_stars);
  static Icon get lightMode => const Icon(CupertinoIcons.light_max);
  static Icon get language => const Icon(CupertinoIcons.globe);
  static Icon get backBtn => const Icon(CupertinoIcons.forward);
  static Icon get forwordBtn => const Icon(CupertinoIcons.back);
  static Icon get settings => const Icon(Icons.settings);

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
