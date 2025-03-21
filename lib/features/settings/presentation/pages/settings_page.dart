import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _body() {
    return AppScrollbar(
      controller: ScrollController(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            VerticalSpace.small(),
            const LocaleListTile(),
            VerticalSpace.small(),
            const ThemeListTile(),
            VerticalSpace.small(),
            const ChangeHadithViewTypeListTile(),
            // VerticalSpace.small(),
            // const ChangeHadithFontStyleListTile(),
            _hadithViewType(),
            VerticalSpace.small(),
            const ChangeFontSizeListTile(useShasow: true),
          ],
        ),
      ),
    );
  }

  BlocBuilder<ChangeHadithViewTypeCubit, ChangeHadithViewTypeState> _hadithViewType() {
    return BlocBuilder<ChangeHadithViewTypeCubit, ChangeHadithViewTypeState>(
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
    );
  }
}
