import 'package:flutter/material.dart';

import '../../../../core/utils/resources/resources.dart';
import '../../../features.dart';

class HadithViewPopupButton extends StatelessWidget {
  const HadithViewPopupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<PopupMenuEntry>(
      color: context.themeColors.background,
      icon: AppIcons.optinosVertical,
      iconColor: context.themeColors.primary,
      itemBuilder: (context) {
        return [
          const PopupMenuItem(
            // value: 1,
            onTap: null,
            // enabled: false,
            child: ChangeFontSizeSlider(),
          ),
        ];
      },
    );
  }
}
