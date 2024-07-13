import 'package:flutter/cupertino.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';

class AppIcons {
  AppIcons._();

  static Icon get darkMode => const Icon(CupertinoIcons.moon_stars);
  static Icon get lightMode => const Icon(CupertinoIcons.light_max);
  static Icon get language => const Icon(CupertinoIcons.globe);
  static Icon get backBtn => const Icon(CupertinoIcons.forward);

  static Widget get animatedLightDark {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 200),
      firstChild: lightMode,
      secondChild: darkMode,
      crossFadeState: AppConstants.context.theme.brightness == Brightness.light
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
    );
  }
}
