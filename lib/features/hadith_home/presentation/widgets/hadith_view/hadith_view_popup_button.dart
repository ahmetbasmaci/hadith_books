import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/core.dart';
import 'package:hadith_books/features/features.dart';

class HadithViewPopupButton extends StatelessWidget {
  const HadithViewPopupButton({super.key, required this.showFontSizeOption, required this.shoHadithViewTypeOption});
  final bool showFontSizeOption;
  final bool shoHadithViewTypeOption;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<PopupMenuEntry>(
      color: context.themeColors.background,
      onSelected: (value) {
        PrinterHelper.print('PopupMenuItem clicked value: $value');
      },
      icon: AppIcons.optinosVertical,
      // iconColor: context.themeColors.primary,
      itemBuilder: (context) {
        bool showExpandCollapceAllBtn =
            context.read<ChangeHadithViewTypeCubit>().state.hadithViewTypeEnum == HadithViewTypeEnum.scrolllable;
        return [
          //! Font Size
          if (showFontSizeOption)
            const PopupMenuItem(
              onTap: null,
              value: null,
              child: ChangeFontSizeSliderWithText(),
            ),

            //! Font Style
            // const PopupMenuItem(
            //   onTap: null,
            //   value: null,
            //   child: ChangeHadithFontStyleItem(),
            // ),

          //! Hadith View
          if (shoHadithViewTypeOption)
            const PopupMenuItem(
              // value: 1,
              onTap: null,
              value: null,
              // enabled: false,
              child: ChangeHadithViewItem(),
              // child: ChangeHadithViewTypeListTile(onlyTitle: true),
            ),

          //! Expand Texts
          if (shoHadithViewTypeOption && showExpandCollapceAllBtn)
            const PopupMenuItem(
              onTap: null,
              value: null,
              child: ExpandAllTextsOption(),
            ),
        ];
      },
    );
  }
}
