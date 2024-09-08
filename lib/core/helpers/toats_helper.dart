import 'package:flutter/material.dart';
import 'package:hadith_books/core/core.dart';

import '../utils/resources/resources.dart';

class ToatsHelper {
  ToatsHelper._();
  static void showSnackBar( String msg) {
    ScaffoldMessenger.of(AppConstants.context).removeCurrentSnackBar();
    ScaffoldMessenger.of(AppConstants.context).showSnackBar(
      SnackBar(
        content: Text(msg, style: AppStyles.normal),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static void showSnackBarError(String msg) {
    ScaffoldMessenger.of(AppConstants.context).removeCurrentSnackBar();
    ScaffoldMessenger.of(AppConstants.context).showSnackBar(
      SnackBar(
        content: Text(msg, style: AppStyles.normal),
        backgroundColor: AppConstants.context.theme.colorScheme.error,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
