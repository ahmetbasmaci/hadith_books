import 'package:flutter/material.dart';
import 'package:hadith_books/core/core.dart';

import '../../../features.dart';

class ProgressButton extends StatelessWidget {
  final VoidCallback onNext;
  final Duration? duration;
  const ProgressButton({super.key, required this.onNext, this.duration});

  @override
  Widget build(BuildContext context) {
    var responsiveSizeBigContainer = ResponsiveManager.responsiveFontSize(75);
    var responsiveSizeBtn = ResponsiveManager.responsiveFontSize(60);
    return SizedBox(
      width: responsiveSizeBigContainer,
      height: responsiveSizeBigContainer,
      child: Stack(
        children: [
          AnimatedIndicator(
            duration: duration ?? const Duration(seconds: 10),
            size: responsiveSizeBigContainer,
            callback: onNext,
          ),
          Center(
            child: GestureDetector(
              onTap: onNext,
              child: Container(
                height: responsiveSizeBtn,
                width: responsiveSizeBtn,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(99), color: context.themeColors.primary),
                child: Center(
                  child: Icon(
                    Icons.navigate_next_outlined,
                    color: Colors.white,
                    size: ResponsiveManager.responsiveFontSize(45),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
