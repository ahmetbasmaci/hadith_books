import 'package:flutter/material.dart';

import '../utils/resources/resources.dart';

class ToatsHelper {
  ToatsHelper._();
  // static void show(String msg) {
  //   Fluttertoast.cancel();
  //   Fluttertoast.showToast(msg: msg);
  // }

  // static void showSuccess(String msg) {
  //   Fluttertoast.cancel();
  //   Fluttertoast.showToast(msg: msg, backgroundColor: Colors.green);
  // }

  // static void showError(String msg) {
  //   Fluttertoast.cancel();
  //   Fluttertoast.showToast(
  //     msg: msg,
  //     toastLength: Toast.LENGTH_LONG,
  //     backgroundColor: AppConstants.context.theme.colorScheme.error,
  //   );
  // }

  static void showSnackBar(String msg) {
    ScaffoldMessenger.of(AppConstants.context).showSnackBar(
      SnackBar(
        content: Text(msg),
      ),
    );
  }

  static void showSnackBarError(String msg) {
    ScaffoldMessenger.of(AppConstants.context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: AppConstants.context.theme.colorScheme.error,
      ),
    );
  }
}
