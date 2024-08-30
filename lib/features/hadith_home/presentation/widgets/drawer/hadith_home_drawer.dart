import 'package:flutter/material.dart';
import 'drawer_settings_part.dart';
import 'app_drawer.dart';

class HadithHomeDrawer extends StatelessWidget {
  const HadithHomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppDrawer(bottomPart: DrawerSettingsPart());
  }
}
