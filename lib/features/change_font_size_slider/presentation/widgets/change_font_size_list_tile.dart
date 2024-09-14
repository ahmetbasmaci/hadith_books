import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/local/l10n.dart';
import '../../../../core/utils/resources/resources.dart';
import '../../../../core/widgets/components/settings_list_tile_item.dart';
import '../../../features.dart';

class ChangeFontSizeListTile extends StatelessWidget {
  const ChangeFontSizeListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingsListTileItem<Brightness>.customTrailing(
          title: AppStrings.of(context).fontSize,
          subtitle: AppStrings.of(context).fontSizeSubtitle,
          leading: AppIcons.fontSize,
          iconColor: Colors.deepOrangeAccent,
          cutomTrailing: const SizedBox(
            height: 20,
            width: 150,
            child: ChangeFontSizeSlider(),
          ),
        ),
        BlocBuilder<ChangeFontSizeSliderCubit, ChangeFontSizeSliderState>(
          builder: (context, state) {
            return AnimatedDefaultTextStyle(
              style: AppStyles.normal.copyWith(
                fontSize: context.read<ChangeFontSizeSliderCubit>().state.fontSize,
                color: context.themeColors.onBackground,
              ),
              duration: const Duration(milliseconds: 300),
              child: Text(
                '${AppStrings.of(context).fontSizeTestText} ${context.read<ChangeFontSizeSliderCubit>().state.fontSize.toInt()}',
              ),
            );
          },
        ),
      ],
    );
  }
}
