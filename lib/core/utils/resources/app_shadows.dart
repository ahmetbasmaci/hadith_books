import 'package:flutter/material.dart';

class AppShadows {
  AppShadows._();

  static BoxShadow get hadithCard {
    return BoxShadow(
      // color: AppConstants.context.theme.colorScheme.onSurface.withOpacity(0.2),
      color: Colors.black.withOpacity(.2),
      blurRadius: 10,
      spreadRadius: 4,
      offset: const Offset(0, 5),
    );
  }
}
