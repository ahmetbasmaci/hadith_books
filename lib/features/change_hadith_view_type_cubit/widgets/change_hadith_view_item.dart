import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/enums/hadith_view_type_enum.dart';

import '../../../config/local/l10n.dart';
import '../../../core/core.dart';
import '../../features.dart';

class ChangeHadithViewItem extends StatelessWidget {
  const ChangeHadithViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: context.isArabicLang ? Alignment.centerRight : Alignment.centerLeft,
            child: Text(AppStrings.of(context).hadithViewType, style: AppStyles.small.bold),
          ),
        ),
        HorizontalSpace.xLarge(),
        BlocBuilder<ChangeHadithViewTypeCubit, ChangeHadithViewTypeState>(
          builder: (context, state) {
            return DropdownButton<HadithViewTypeEnum>(
              value: state.hadithViewTypeEnum,
              onChanged: (HadithViewTypeEnum? newValue) {
                context.read<ChangeHadithViewTypeCubit>().updateHadithViewType(newValue!);
                NavigatorHelper.pop();
              },
              items: HadithViewTypeEnum.values.map<DropdownMenuItem<HadithViewTypeEnum>>(
                (HadithViewTypeEnum value) {
                  return DropdownMenuItem<HadithViewTypeEnum>(
                    value: value,
                    child: Text(value.translate,
                        style: state.hadithViewTypeEnum == value ? AppStyles.small : AppStyles.small.natural),
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
