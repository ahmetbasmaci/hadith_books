import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/enums/hadith_view_type_enum.dart';
import 'package:hadith_books/features/features.dart';

import '../../../../../core/utils/resources/resources.dart';
import '../../../../change_font_size_slider/widgets/change_font_size_slider_with_text.dart';
import '../../../../change_hadith_view_type_cubit/cubit/change_hadith_view_type_cubit.dart';
import '../../../../expand_all_option/presentation/widgets/expand_all_texts_option.dart';

class HadithViewPopupButton extends StatelessWidget {
  const HadithViewPopupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<PopupMenuEntry>(
      color: context.themeColors.background,
      icon: AppIcons.optinosVertical,
      // iconColor: context.themeColors.primary,
      itemBuilder: (context) {
        bool showExpandCollapceAllBtn =
            context.read<ChangeHadithViewTypeCubit>().state.hadithViewTypeEnum == HadithViewTypeEnum.scrolllable;
        return [
          const PopupMenuItem(
            // value: 1,
            onTap: null,
            // enabled: false,
            child: ChangeFontSizeSliderWithText(),
          ),
          showExpandCollapceAllBtn
              ? const PopupMenuItem(
                  // value: 1,
                  onTap: null,
                  // enabled: false,
                  child: ExpandAllTextsOption(),
                )
              : const PopupMenuItem(
                  // value: 1,
                  onTap: null,
                  // enabled: false,
                  child: ExpandAllTextsOption(),
                ),
        ];
      },
    );
  }
}
