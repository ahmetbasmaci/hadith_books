import 'package:flutter/material.dart';
import 'package:hadith_books/core/core.dart';

import '../../../../src/src.dart';

class SettingsBtn extends StatelessWidget {
  const SettingsBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        NavigatorHelper.pushNamed(AppRoutes.settingsPage);
      },
      icon: AppIcons.settings,
    );
  }
}
