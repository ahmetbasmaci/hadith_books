import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../config/local/l10n.dart';
import '../../../../core/utils/resources/resources.dart';
import '../../../../core/widgets/components/buttons/app_back_btn.dart';
import '../../../../core/widgets/components/my_appbar.dart';
import '../../../../core/widgets/components/screen_loading_layer.dart';
import '../../../../core/widgets/components/vertical_space.dart';
import '../../app_developer.dart';

class AppDeveloperPage extends StatelessWidget {
  const AppDeveloperPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppDeveloperCubit, AppDeveloperState>(
      listener: (context, state) {
        // if (state is AppDeveloperSuccesState) {
        //   ToatsHelper.showSnackBar('تم ارسال الرسالة بنجاح');
        // } else if (state is AppDeveloperErrorMessage) {
        //   ToatsHelper.showSnackBarError(' حدث خطأ ما الرجاء المحاولة مرة اخرى => [${state.message}]');
        // }
      },
      builder: (context, state) {
        return ScreenLoadingLayer(
          isLoading: context.watch<AppDeveloperCubit>().state is AppDeveloperLoadingState,
          child: _body(context),
        );
      },
    );
  }

  Widget _body(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        title: AppStrings.of(context).appDeveloper,
        actions: const [AppBackBtn()],
        leading: const SizedBox(),
      ),
      body: GestureDetector(
        onTap: () => AppConstants.focusScopeNode.unfocus(),
        child: Padding(
          padding: EdgeInsets.all(AppSizes.screenPadding),
          child: _childeren(context),
        ),
      ),
    );
  }

  Widget _childeren(BuildContext context) {
    return ListView(
      children: [
        _image(context), //developer_3d,cosrumerSurvices_3d
        _title(context),
        VerticalSpace.xLarge(),
        _description(context),
        VerticalSpace.xLarge(),
        _textFieldsTitle(context),
        const AppDeveloperAddNameTextField(),
        VerticalSpace.large(),
        const AppDeveloperAddMessageTextField(),
        VerticalSpace.xxLarge(),
        const AppDeveloperSubmitButton(),
      ],
    );
  }

  Widget _image(BuildContext context) {
    return Lottie.asset(
      AppAnimations.developer,
      height: context.height * .3,
    );
  }

  Text _title(BuildContext context) => Text(AppStrings.of(context).appDeveloperTitle, style: AppStyles.titleMeduimBold);

  Widget _description(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${AppStrings.of(context).contactMeOnEmail}: "),
              SelectableText.rich(
                TextSpan(
                  text: ' ${AppConstants.developerEmail}',
                  style: AppStyles.titleMeduim.copyWith(color: context.themeColors.secondary),
                ),
              ),
            ],
          ),
        ),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${AppStrings.of(context).orByWhatsapp}: '),
              SelectableText.rich(
                TextSpan(
                  text: ' ${AppConstants.developerWhatsapp}',
                  style: AppStyles.titleMeduim.copyWith(color: context.themeColors.secondary),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Text _textFieldsTitle(BuildContext context) => Text(
        AppStrings.of(context).appDeveloperDiscreption,
        textAlign: TextAlign.center,
      );
}
