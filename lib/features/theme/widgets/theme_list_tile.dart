import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/local/l10n.dart';
import '../../../config/theme/app_themes.dart';
import '../../../core/core.dart';
import '../cubit/theme_cubit.dart';

class ThemeListTile extends StatelessWidget {
  const ThemeListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return SettingsListTileItem<Brightness>.dropDownTrailing(
          title: AppStrings.of(context).theme,
          subtitle: AppStrings.of(context).changeTheme,
          leading: AppIcons.animatedLightDark,
          value: state.theme.brightness,
          iconColor: Colors.purple,
          onChanged: (Brightness? newValue) {
            context.read<ThemeCubit>().updateTheme(newValue!);
          },
          items: AppThemes.themes.map<DropdownMenuItem<Brightness>>(
            (ThemeData value) {
              return DropdownMenuItem<Brightness>(
                value: value.brightness,
                child: Text(
                  value.brightness == Brightness.dark ? AppStrings.of(context).dark : AppStrings.of(context).light,
                  style: state.theme.brightness == value.brightness ? AppStyles.small : AppStyles.small.natural,
                ),
              );
            },
          ).toList(),
          useShadow: true,
        );
      },
    );
  }
}
