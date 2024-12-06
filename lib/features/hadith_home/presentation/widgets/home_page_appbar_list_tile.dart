import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            HorizontalSpace.customize(space: AppSizes.screenPadding),
            Image.asset(AppImages.appLogo, width: AppSizes.icon),
            HorizontalSpace.xLarge(),
            Text(AppStrings.of(context).appDiscreption, style: AppStyles.normal.bold),
            Spacer(),
            ..._trailing(),
          ],
        ),
      ),
    );
  }

  List<Widget> _trailing() {
    if (showBackIcon) {
      return [
        HadithViewPopupButton(showFontSizeOption: true, shoHadithViewTypeOption: false),
        //HorizontalSpace.xLarge(),
        AppBackBtn(),
      ];
    }
    return [
      BlocBuilder<HomePageScreensCubit, HomePageScreensState>(
        builder: (context, state) {
          return context.read<HomePageScreensCubit>().getSelectedScreenModel.appBarTrailing ??
              HadithHomeSearchIcon(key: key);
        },
      ),
    ];
  }
}
