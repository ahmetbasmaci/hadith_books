import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/core.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../../config/local/l10n.dart';
import '../../../../../src/app_router.dart';
import '../../../../features.dart';

class DrawerSettingsPart extends StatelessWidget {
  const DrawerSettingsPart({super.key, required this.showFromHadithViewPage});
  final bool showFromHadithViewPage;
  @override
  Widget build(BuildContext context) {
    final List<HadithDrawerItemModel> items = [
      HadithDrawerItemModel(
        iconColor: Colors.blue,
        title: AppStrings.of(context).settings,
        icon: AppIcons.settings,
        appRoutes: AppRoutes.settingsPage,
      ),
    ];
    if (showFromHadithViewPage) {
      items.addAll(
        [
          HadithDrawerItemModel(
            iconColor: Colors.purple,
            title: AppStrings.of(context).favorite,
            icon: AppIcons.favorite,
            appRoutes: AppRoutes.favoritepage,
          ),
          HadithDrawerItemModel(
            iconColor: Colors.brown,
            title: AppStrings.of(context).howAreWe,
            icon: AppIcons.info,
            appRoutes: AppRoutes.appDeveloperPage,
          ),
          HadithDrawerItemModel.customPress(
            iconColor: const Color.fromARGB(255, 59, 49, 117),
            title: AppStrings.of(context).shareApp,
            icon: AppIcons.shareIcon(),
            onPress: () async {
              await Share.shareUri(Uri.parse(AppConstants.appLink));
            },
          ),
        ],
      );
    }
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _baseListTile(context, items[index]);
      },
    );
  }

  Widget _baseListTile(BuildContext context, HadithDrawerItemModel item) {
    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, state) {
        return DrawerItemAnimation(
          child: ListTile(
            iconColor: item.iconColor,
            title: Text(item.title, style: AppStyles.titleSmallBold.copyWith(color: context.themeColors.onBackground)),
            leading: item.icon,
            onTap: item.onPress ?? () => NavigatorHelper.pushNamed(item.appRoutes!),
          ),
        );
      },
    );
  }
}
