import 'package:flutter/material.dart';
import 'package:hadith_books/core/core.dart';

class AppShadows {
  AppShadows._();

  static BoxShadow get hadithCard {
    return BoxShadow(
      // color: AppConstants.context.theme.colorScheme.onSurface.withOpacity(0.2),
      color: AppConstants.context.themeColors.natural.withOpacity(.2),
      blurRadius: 9,
      spreadRadius: 1,
      offset: const Offset(0, 2),
    );
  }
}
