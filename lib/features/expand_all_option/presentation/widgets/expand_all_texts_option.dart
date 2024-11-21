import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/config/local/l10n.dart';

import '../../../../core/core.dart';
import '../cubit/expand_all_option_cubit.dart';

class ExpandAllTextsOption extends StatelessWidget {
  const ExpandAllTextsOption({super.key, this.showText = true});
  final bool showText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (showText)
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(AppStrings.of(context).toggleExpandedAllTexts, style: AppStyles.normal),
          ),
        HorizontalSpace.small(),
        BlocBuilder<ExpandAllOptionCubit, ExpandAllOptionState>(
          builder: (context, state) {
            return AnimatedEffectButton(
              onPressed: () => context.read<ExpandAllOptionCubit>().toggleExpandAll(),
              child: AppIcons.animatedCheck(context.read<ExpandAllOptionCubit>().state.isTextsExpanded,color: context.themeColors.primary),
            );
          },
        )
      ],
    );
  }
}
