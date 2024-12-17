import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../config/local/l10n.dart';
import '../../../../core/core.dart';
import '../../../features.dart';

class HomePageAppbarListTile extends StatelessWidget {
  const HomePageAppbarListTile({super.key, required this.showBackIcon});
  final bool showBackIcon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.appbarH(context),
      width: context.width,
      child: Row(
        children: [
          HorizontalSpace.customize(space: AppSizes.screenPadding),
          AnimatedEffectButton(
            color: context.themeColors.primary,
            onPressed: () {
              var title = '${AppStrings.of(context).aboutAppDiscreption}\n${AppConstants.appLink}';
              Share.share(title);
            },
            child: Image.asset(AppImages.appLogo, width: AppSizes.icon),
          ),
          HorizontalSpace.xLarge(),
          Text(AppStrings.of(context).appDiscreption, style: AppStyles.normal.bold),
          Spacer(),
          ..._trailing(context),
        ],
      ),
    );
  }

  List<Widget> _trailing(BuildContext context) {
    if (showBackIcon) {
      return [
        HadithViewPopupButton(showFontSizeOption: true, shoHadithViewTypeOption: false),
        //HorizontalSpace.xLarge(),
        AppBackBtn(),
      ];
    }
    return [
      context.read<HomePageScreensCubit>().getSelectedScreenModel.appBarTrailing ?? SizedBox(),
      BlocBuilder<HomePageScreensCubit, HomePageScreensState>(
        builder: (context, state) {
          return HadithHomeSearchIcon(
            key: key,
            searchInFavoritePage:
                context.read<HomePageScreensCubit>().getSelectedScreenModel.screenEnum == HomePageScreensEnum.favorite,
          );
        },
      ),
    ];
  }
}
