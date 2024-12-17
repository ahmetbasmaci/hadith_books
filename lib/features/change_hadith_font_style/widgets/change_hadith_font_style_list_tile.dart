import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/features/change_hadith_font_style/cubit/change_hadith_font_style_cubit.dart';

import '../../../config/local/l10n.dart';
import '../../../core/core.dart';

class ChangeHadithFontStyleListTile extends StatelessWidget {
  const ChangeHadithFontStyleListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeHadithFontStyleCubit, ChangeHadithFontStyleState>(
      builder: (context, state) {
        return SettingsListTileItem<AppFontsEnum>.dropDownTrailing(
          title: AppStrings.of(context).FontType,
          subtitle: '',
          leading: AppIcons.hadithViewType,
          value: state.hadithFontStyleEnum,
          iconColor: Colors.indigoAccent,
          useShadow: true,
          onChanged: (AppFontsEnum? newValue) {
            context.read<ChangeHadithFontStyleCubit>().updateFontStyle(newValue!);
          },
          items: AppFontsEnum.values.map<DropdownMenuItem<AppFontsEnum>>(
            (AppFontsEnum value) {
              return DropdownMenuItem<AppFontsEnum>(
                value: value,
                child: Text(
                  value.translate,
                  style: state.hadithFontStyleEnum == value ? AppStyles.small : AppStyles.small.natural,
                ),
              );
            },
          ).toList(),
        );
      },
    );
  }
}
