import 'package:flutter/material.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';

class AppShadows {
  AppShadows._();

  static BoxShadow get hadithCard {
    return BoxShadow(
      color: AppConstants.context.theme.colorScheme.onSurface.withOpacity(0.2),
      blurRadius: 5,
      offset: const Offset(-5, 10),
    );
  }
}
