import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hadith_books/core/core.dart';


class ToatsHelper {
  ToatsHelper._();
  static void showSnackBar(String msg) {
    ScaffoldMessenger.of(AppConstants.context).removeCurrentSnackBar();

    ScaffoldMessenger.of(AppConstants.context).showSnackBar(
      SnackBar(
        content: Text(msg, style: AppStyles.normal),
        // backgroundColor: AppConstants.context.themeColors.background,
        // content: ListTile(
        //   title: Text(msg, style: AppStyles.normal),
        //   leading: const Icon(Icons.info),
        // ),
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        duration: const Duration(seconds: 3),
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
        showCloseIcon: true,
      ),
    );
  }
}

class TopSnackBar {
  static void show(BuildContext context, String message) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 50.0, // Adjust this value for the desired vertical position
        left: 10.0,
        right: 10.0,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    // Remove the snackbar after a delay
    Timer(const Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }
}
