import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/core.dart';
import 'package:hadith_books/features/features.dart';

class HadithViewPopupButton extends StatelessWidget {
  const HadithViewPopupButton({super.key});

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
          const PopupMenuItem(
            // value: 1,
            onTap: null,
            value: null,
            padding: EdgeInsets.zero,
            // enabled: false,
            child: ChangeFontSizeSliderWithText(),
          ),
          // const PopupMenuItem(
          //   // value: 1,
          //   onTap: null,
          //   value: null,
          //   padding: EdgeInsets.zero,
          //   // enabled: false,
          //   child: ChangeHadithViewTypeListTile(useShasow: false),
          // ),
          if (showExpandCollapceAllBtn)
            const PopupMenuItem(
              // value: 1,
              onTap: null,
              value: null,
              padding: EdgeInsets.zero,
              // enabled: false,
              child: ExpandAllTextsOption(),
            ),
        ];
      },
    );
  }
}
