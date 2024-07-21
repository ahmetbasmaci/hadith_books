import 'package:flutter/material.dart';
import 'package:hadith_books/core/helpers/navigator_helper.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';
import 'package:hadith_books/core/widgets/components/vertical_space.dart';

import '../../../../src/app_router.dart';

class HadithHomeDrawer extends StatelessWidget {
  const HadithHomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            //! setting
            ListTile(
              title: const Text('Settings'),
              leading: AppIcons.settings,
              onTap: () {
                NavigatorHelper.pushNamed(AppRoutes.settingsPage);
              },
            ),

            //! favorite
            ListTile(
              title: const Text('Favorite'),//TODO: add localization
              leading: AppIcons.favorite,
              onTap: () {
                NavigatorHelper.pushNamed(AppRoutes.favoritepage);
              },
            ),
            const Spacer(),
            ListTile(
              title: const Text('Back'),
              leading: AppIcons.forwordBtn,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            VerticalSpace.xxLarge(),
          ],
        ),
      ),
    );
  }
}
