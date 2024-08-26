import 'package:flutter/material.dart';
import 'package:hadith_books/config/local/l10n.dart';
import 'package:hadith_books/core/helpers/navigator_helper.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';

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
              iconColor: Colors.blue,
              title: Text(AppStrings.of(context).settings, style: AppStyles.titleSmall),
              leading: AppIcons.settings,
              textColor: AppConstants.context.themeColors.onBackground,
              onTap: () {
                NavigatorHelper.pushNamed(AppRoutes.settingsPage);
              },
            ),

            //! favorite
            ListTile(
              iconColor: Colors.purple,
              title: Text(AppStrings.of(context).favorite, style: AppStyles.titleSmall),
              leading: AppIcons.favorite,
              textColor: AppConstants.context.themeColors.onBackground,
              onTap: () {
                NavigatorHelper.pushNamed(AppRoutes.favoritepage);
              },
            ),
            const Spacer(),

            //! back
            // ListTile(
            //   iconColor: Colors.red,
            //   title: Text(AppStrings.of(context).back, style: AppStyles.titleSmall),
            //   leading: AppIcons.forwordBtn,
            //   textColor: AppConstants.context.themeColors.onBackground,
            //   onTap: () {
            //     Navigator.of(context).pop();
            //   },
            // ),
            //VerticalSpace.xxLarge(),
          ],
        ),
      ),
    );
  }
}
