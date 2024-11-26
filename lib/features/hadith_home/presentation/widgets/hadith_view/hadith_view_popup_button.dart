import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/core.dart';
import 'package:hadith_books/features/features.dart';

import '../../../../change_hadith_view_type_cubit/widgets/change_hadith_view_item.dart';

class HadithViewPopupButton extends StatelessWidget {
  const HadithViewPopupButton({super.key, required this.isInSearchPage});
  final bool isInSearchPage;
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
            onTap: null,
            value: null,
            child: ChangeFontSizeSliderWithText(),
          ),
          const PopupMenuItem(
            // value: 1,
            onTap: null,
            value: null,
            // enabled: false,
            child: ChangeHadithViewItem(),
            // child: ChangeHadithViewTypeListTile(onlyTitle: true),
          ),
          if (showExpandCollapceAllBtn)
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
