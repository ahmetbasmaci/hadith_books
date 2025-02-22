import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../cubit/locale_cubit.dart';

import '../../../config/local/l10n.dart';

class LocaleListTile extends StatelessWidget {
  const LocaleListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, state) {
        return SettingsListTileItem<String>.dropDownTrailing(
          title: AppStrings.of(context).language,
          subtitle: AppStrings.of(context).changeLanguage,
          leading: AppIcons.language,
          value: state.locale,
          iconColor: Colors.blue,
          onChanged: (String? newValue) {
            context.read<LocaleCubit>().changeLocale(newValue!);
          },
          items: AppStrings.delegate.supportedLocales.map<DropdownMenuItem<String>>(
            (Locale value) {
              return DropdownMenuItem<String>(
                value: value.languageCode,
                child: Text(value.languageCode == 'ar' ? 'عربي' : value.languageCode,
                    style: state.locale == value.languageCode ? AppStyles.small : AppStyles.small.natural),
              );
            },
          ).toList(),
          useShadow: true,
        );
      },
    );
  }
}
