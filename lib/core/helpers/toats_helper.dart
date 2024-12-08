import 'package:flutter/material.dart';
import 'package:hadith_books/config/local/l10n.dart';
import 'package:hadith_books/core/core.dart';
import 'package:toastification/toastification.dart';

class ToatsHelper {
  ToatsHelper._();
  static final Toastification _toastification = Toastification();
  static void info(String msg, {Duration? duration}) {
    _showToast(
      msg: msg,
      toastType: ToastificationType.info,
      duration: duration,
    );
  }

  static void error(String msg, {Duration? duration}) {
    _showToast(
      msg: msg,
      toastType: ToastificationType.error,
    );
  }

  static void success(String msg, {Duration? duration}) {
    _showToast(
      msg: msg,
      toastType: ToastificationType.success,
    );
  }

  static void warning(
    String msg, {
    Duration? duration,
    bool alignmentBottom = true,
  }) {
    _showToast(
      msg: msg,
      toastType: ToastificationType.warning,
      duration: duration,
      alignmentBottom: alignmentBottom,
    );
  }

  static void _showToast({
    required String msg,
    required ToastificationType toastType,
    Duration? duration,
    bool alignmentBottom = true,
  }) {
    _toastification.show(
      context: AppConstants.context,
      style: ToastificationStyle.minimal,
      type: toastType,
      title: Text(AppStrings.of(AppConstants.context).appName, style: AppStyles.small.bold),
      autoCloseDuration: duration ?? const Duration(seconds: 2),
      alignment: alignmentBottom
          ? AppConstants.context.isArabicLang
              ? Alignment.bottomRight
              : Alignment.bottomLeft
          : AppConstants.context.isArabicLang
              ? Alignment.topRight
              : Alignment.topLeft,
      description: RichText(
        text: TextSpan(
          text: msg,
          style: AppStyles.small.copyWith(color: AppConstants.context.themeColors.onBackground),
        ),
      ),
    );
  }
}
