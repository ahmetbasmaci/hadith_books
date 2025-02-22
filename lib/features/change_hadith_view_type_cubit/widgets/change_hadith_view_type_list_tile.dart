import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/local/l10n.dart';
import '../../../core/core.dart';
import '../cubit/change_hadith_view_type_cubit.dart';

class ChangeHadithViewTypeListTile extends StatelessWidget {
  const ChangeHadithViewTypeListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeHadithViewTypeCubit, ChangeHadithViewTypeState>(
      builder: (context, state) {
        return SettingsListTileItem<HadithViewTypeEnum>.dropDownTrailing(
          title: AppStrings.of(context).hadithViewType,
          subtitle: AppStrings.of(context).changeHadithViewType,
          leading: AppIcons.hadithViewType,
          value: state.hadithViewTypeEnum,
          iconColor: Colors.green,
          useShadow: true,
          onChanged: (HadithViewTypeEnum? newValue) {
            context.read<ChangeHadithViewTypeCubit>().updateHadithViewType(newValue!);
          },
          items: HadithViewTypeEnum.values.map<DropdownMenuItem<HadithViewTypeEnum>>(
            (HadithViewTypeEnum value) {
              return DropdownMenuItem<HadithViewTypeEnum>(
                value: value,
                child: Text(
                  value.translate,
                  style: state.hadithViewTypeEnum == value ? AppStyles.small : AppStyles.small.natural,
                ),
              );
            },
          ).toList(),
        );
      },
    );
  }
}
