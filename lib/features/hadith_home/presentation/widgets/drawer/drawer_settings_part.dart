import 'package:flutter/material.dart';
import 'package:hadith_books/core/helpers/navigator_helper.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';
import '../../../../../config/local/l10n.dart';
import '../../../../../src/app_router.dart';
import '../../../data/models/hadith_drawer_item_model.dart';

class DrawerSettingsPart extends StatelessWidget {
  const DrawerSettingsPart({super.key});

  @override
  Widget build(BuildContext context) {
    final List<HadithDrawerItemModel> items = [
      HadithDrawerItemModel(
        iconColor: Colors.blue,
        title: AppStrings.of(context).settings,
        icon: AppIcons.settings,
        appRoutes: AppRoutes.settingsPage,
      ),
      HadithDrawerItemModel(
        iconColor: Colors.purple,
        title: AppStrings.of(context).favorite,
        icon: AppIcons.favorite,
        appRoutes: AppRoutes.favoritepage,
      ),
      HadithDrawerItemModel(
        iconColor: Colors.amber,
        title: AppStrings.of(context).appDeveloper,
        icon: AppIcons.code,
        appRoutes: AppRoutes.appDeveloperPage,
      ),
    ];
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _baseListTile(context, items[index]);
      },
    );
  }

  Widget _baseListTile(BuildContext context, HadithDrawerItemModel item) {
    return ListTile(
      iconColor: item.iconColor,
      title: Text(item.title, style: AppStyles.titleSmall),
      leading: item.icon,
      textColor: context.themeColors.onBackground,
      onTap: () async {
        await NavigatorHelper.pushNamed(item.appRoutes);
      },
    );
  }
}
