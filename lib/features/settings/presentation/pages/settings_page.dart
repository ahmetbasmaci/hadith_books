import 'package:flutter/material.dart';
import 'package:hadith_books/config/local/l10n.dart';

import '../../../../core/core.dart';
import '../../../features.dart';
import '../../../change_hadith_view_type_cubit/widgets/change_hadith_view_type_list_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      useSliver: false,
      title: Text(AppStrings.of(context).settings),
      actions: const [AppBackBtn()],
      leading: const SizedBox(),
      body: Column(
        children: [
          VerticalSpace.small(),
          const LocaleListTile(),
          VerticalSpace.small(),
          const ThemeListTile(),
          VerticalSpace.small(),
          const ChangeHadithViewTypeListTile(),
          VerticalSpace.small(),
          const ChangeFontSizeListTile(),
        ],
      ),
    );
  }
}
