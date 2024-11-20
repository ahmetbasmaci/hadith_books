import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/config/local/l10n.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _body();
    AppScaffold(
      useSliver: false,
      title: Text(AppStrings.of(context).settings),
      actions: const [AppBackBtn()],
      leading: const SizedBox(),
      body: _body(),
    );
  }

  Column _body() {
    return Column(
      children: [
        VerticalSpace.small(),
        const LocaleListTile(),
        VerticalSpace.small(),
        const ThemeListTile(),
        VerticalSpace.small(),
        const ChangeHadithViewTypeListTile(useShasow: true),
        BlocBuilder<ChangeHadithViewTypeCubit, ChangeHadithViewTypeState>(
          builder: (context, state) {
            if (context.read<ChangeHadithViewTypeCubit>().state.hadithViewTypeEnum == HadithViewTypeEnum.scrolllable) {
              return AnimatedSwicherTransition(
                child: Column(
                  children: [
                    VerticalSpace.small(),
                    const ExpandAllTextsSettingsListTile(useShasow: true),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
        VerticalSpace.small(),
        const ChangeFontSizeListTile(useShasow: true),
      ],
    );
  }
}
