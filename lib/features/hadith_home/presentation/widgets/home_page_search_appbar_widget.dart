import 'package:flutter/material.dart';
import '../../../../config/local/l10n.dart';
import '../../../../core/core.dart';
import '../../../features.dart';

class HomePageSearchAppbarWidget extends StatelessWidget {
  const HomePageSearchAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.appbarH(context) + 20,
      width: context.width,
      decoration: BoxDecoration(
          //color: context.themeColors.primary.withOpacity(.1),
          ),
      child: Padding(
        padding: EdgeInsets.only(top: AppSizes.screenPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(AppStrings.of(context).appDiscreption, style: AppStyles.normalBold),
              leading: Image.asset(AppImages.appLogo, width: 30.0),
              trailing: HadithHomeSearchIcon(),
            ),
          ],
        ),
      ),
    );
  }
}
