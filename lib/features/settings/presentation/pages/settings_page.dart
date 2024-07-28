import 'package:flutter/material.dart';
import 'package:hadith_books/config/local/l10n.dart';

import '../../../../core/widgets/components/buttons/app_back_btn.dart';
import '../../../../core/widgets/components/vertical_space.dart';
import '../../../features.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.of(context).settings),
        actions: const [AppBackBtn()],
        leading: const SizedBox(),
      ),
      body: Column(
        children: [
          VerticalSpace.small(),
          const LocaleListTile(),
          VerticalSpace.small(),
          const ThemeListTile(),
        ],
      ),
    );
  }
}
