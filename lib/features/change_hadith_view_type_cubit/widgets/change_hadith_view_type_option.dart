import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/local/l10n.dart';
import '../../../core/core.dart';
import '../cubit/change_hadith_view_type_cubit.dart';

class ChangeHadithViewTypeOption extends StatelessWidget {
  const ChangeHadithViewTypeOption({super.key});

  @override
  Widget build(BuildContext context) {
    return

        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //    FittedBox(
        //         fit: BoxFit.scaleDown,
        //         child: Text(AppStrings.of(context).hadithViewType, style: AppStyles.normal),
        //       )
        //       ,
        //     HorizontalSpace.small(),
        //     BlocBuilder<ExpandAllOptionCubit, ExpandAllOptionState>(
        //       builder: (context, state) {
        //         return AnimatedEffectButton(
        //           onPressed: () => context.read<ExpandAllOptionCubit>().toggleExpandAll(),
        //           child: AppIcons.animatedCheck(context.read<ExpandAllOptionCubit>().state.isTextsExpanded),
        //         );
        //       },
        //     )
        //   ],
        // )

        BlocBuilder<ChangeHadithViewTypeCubit, ChangeHadithViewTypeState>(
      builder: (context, state) {
        return SettingsListTileItem<HadithViewTypeEnum>.dropDownTrailing(
          title: AppStrings.of(context).hadithViewType,
          subtitle: AppStrings.of(context).changeHadithViewType,
          leading: AppIcons.hadithViewType,
          value: state.hadithViewTypeEnum,
          iconColor: Colors.green,
          onChanged: (HadithViewTypeEnum? newValue) {
            context.read<ChangeHadithViewTypeCubit>().updateHadithViewType(newValue!);
          },
          items: HadithViewTypeEnum.values.map<DropdownMenuItem<HadithViewTypeEnum>>(
            (HadithViewTypeEnum value) {
              return DropdownMenuItem<HadithViewTypeEnum>(
                value: value,
                child: Text(
                  value.translate,
                  style: AppStyles.normal,
                ),
              );
            },
          ).toList(),
          useShasow: true,
        );
      },
    );
  }
}
