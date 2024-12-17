import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/local/l10n.dart';
import '../../../core/core.dart';
import '../../features.dart';

class ChangeHadithFontStyleItem extends StatelessWidget {
  const ChangeHadithFontStyleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: context.isArabicLang ? Alignment.centerRight : Alignment.centerLeft,
            child: Text(AppStrings.of(context).FontType, style: AppStyles.small.bold),
          ),
        ),
        HorizontalSpace.xLarge(),
        BlocBuilder<ChangeHadithFontStyleCubit, ChangeHadithFontStyleState>(
          builder: (context, state) {
            return DropdownButton<AppFontsEnum>(
              value: state.hadithFontStyleEnum,
              onChanged: (AppFontsEnum? newValue) {
                context.read<ChangeHadithFontStyleCubit>().updateFontStyle(newValue!);
                NavigatorHelper.pop();
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
        ),
      ],
    );
  }
}
