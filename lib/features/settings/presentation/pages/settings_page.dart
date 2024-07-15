import 'package:flutter/material.dart';

import '../../../../core/widgets/components/app_back_btn.dart';
import '../../../../core/widgets/components/vertical_space.dart';
import '../../../locale/locale.dart';
import '../../../theme/theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
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
