import 'package:flutter/material.dart';

class DialogsHelper {
  DialogsHelper._();
  static Future<void> showCostumDialog({
    required BuildContext context,
    required Widget title,
    required Widget child,
    double? height,
    double? width,
  }) async {
    // await showDialog(
    //   context: context,
    //   builder: (context) {
    //     return AlertDialog(
    //       contentPadding: EdgeInsets.all(AppSizes.screenPadding),
    //       title: title,
    //       content: Container(
    //         decoration: BoxDecoration(
    //           // color: context.themeColors.background,
    //           borderRadius: BorderRadius.circular(AppSizes.cardRadius),
    //         ),
    //         height: height ?? context.height * .6,
    //         width: context.width,
    //         child: child,
    //       ),
    //     );
    //   },
    // );
  }
}
