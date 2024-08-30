import 'package:flutter/material.dart';
import 'package:hadith_books/core/helpers/navigator_helper.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';
import '../../../../../config/local/l10n.dart';
import '../../../../../src/app_router.dart';

class DrawerSettingsPart extends StatelessWidget {
  const DrawerSettingsPart({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        //! setting
        _settingsListTile(context),

        //! favorite
        _favoriteListTile(context),
        const Spacer(),
      ],
    );
  }

  Widget _settingsListTile(BuildContext context) {
    return _baseListTile(
      context: context,
      iconColor: Colors.blue,
      title: AppStrings.of(context).settings,
      icon: AppIcons.settings,
      appRoutes: AppRoutes.settingsPage,
    );
  }

  Widget _favoriteListTile(BuildContext context) {
    return _baseListTile(
      context: context,
      iconColor: Colors.purple,
      title: AppStrings.of(context).favorite,
      icon: AppIcons.favorite,
      appRoutes: AppRoutes.favoritepage,
    );
  }

  Widget _baseListTile({
    required BuildContext context,
    required Color iconColor,
    required String title,
    required Icon icon,
    required AppRoutes appRoutes,
  }) {
    return ListTile(
      iconColor: iconColor,
      title: Text(title, style: AppStyles.titleSmall),
      leading: icon,
      textColor: context.themeColors.onBackground,
      onTap: () async {
        await NavigatorHelper.pushNamed(appRoutes);
      },
    );
  }
}
