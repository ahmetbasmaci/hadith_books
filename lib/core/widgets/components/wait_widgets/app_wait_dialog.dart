import 'package:flutter/material.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';
import 'package:lottie/lottie.dart';

class AppWaitDialog extends StatefulWidget {
  final Stream<double>? progressStream;

  const AppWaitDialog({
    super.key,
    this.progressStream,
  });

  @override
  State<AppWaitDialog> createState() => _AppWaitDialogState();
}

class _AppWaitDialogState extends State<AppWaitDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      shadowColor: context.themeColors.background,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            AppAnimations.loadingDataAnimation,
            repeat: true,
          ),
          if (widget.progressStream != null)
            StreamBuilder<double>(
              stream: widget.progressStream,
              initialData: 0.0,
              builder: (context, snapshot) {
                return LinearProgressIndicator(
                  backgroundColor: context.themeColors.background,
                  color: context.themeColors.primary,
                  minHeight: 10,
                  valueColor: AlwaysStoppedAnimation<Color>(context.themeColors.primary),
                  value: snapshot.data,
                );
              },
            )
        ],
      ),
    );
  }
}
