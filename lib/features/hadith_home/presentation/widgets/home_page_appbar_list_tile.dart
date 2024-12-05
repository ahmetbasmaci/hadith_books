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
              title: Text(AppStrings.of(context).appDiscreption, style: AppStyles.normal.bold),
              leading: Image.asset(AppImages.appLogo, width: 30.0),
              trailing: _trailing(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _trailing(BuildContext context) {
    if (showBackIcon) {
      return SizedBox(
        width: context.width * .4,
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              HadithViewPopupButton(showFontSizeOption: true, shoHadithViewTypeOption: false),
              HorizontalSpace.xLarge(),
              AppBackBtn(),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<HomePageScreensCubit, HomePageScreensState>(
      builder: (context, state) {
        return context.read<HomePageScreensCubit>().getSelectedScreenModel.appBarTrailing ??
            HadithHomeSearchIcon(key: key);
      },
    );
  }
}
