import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../config/local/l10n.dart';
import '../../../../core/core.dart';
import '../../../../core/widgets/animations/rotate_animated_for_ever_widget.dart';
import '../../../features.dart';

class AppDeveloperPage extends StatelessWidget {
  const AppDeveloperPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppDeveloperCubit, AppDeveloperState>(
      builder: (context, state) {
        return _body(context);
      },
    );
  }

  Widget _body(BuildContext context) {
    return AppScaffold(
      title: AppStrings.of(context).appDeveloper,
      actions: const [AppBackBtn()],
      leading: const SizedBox(),
      useSliver: false,
      body: AnimatedBackgroundWidget(
        child: GestureDetector(
          onTap: () => AppConstants.focusScopeNode.unfocus(),
          child: Padding(
            padding: EdgeInsets.all(AppSizes.screenPadding),
            child: _childeren(context),
          ),
        ),
      ),
    );
  }

  Widget _childeren(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        _image(context), //developer_3d,cosrumerSurvices_3d
        _aboutApp(context),
        VerticalSpace.medium(),
        _aboutDevelper(context),
        VerticalSpace.medium(),
        _description(context),
        VerticalSpace.xLarge(),
        _textFieldsTitle(context),
        // const AppDeveloperAddNameTextField(),
        // VerticalSpace.large(),
        // const AppDeveloperAddMessageTextField(),
        // VerticalSpace.xxLarge(),
        // const AppDeveloperSubmitButton(),
      ],
    );
  }

  Widget _image(BuildContext context) {
    return ScaleAnimatedForEverWidget(
      child: Lottie.asset(
        AppAnimations.developer,
        height: context.height * .3,
        repeat: true,
      ),
    );
  }

  Widget _aboutApp(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.justify,
      TextSpan(
        children: [
          TextSpan(
            text: '${AppStrings.of(context).aboutApp}: ',
            style: AppStyles.titleMeduimBold,
          ),
          TextSpan(
            text: AppStrings.of(context).aboutAppDiscreption,
            style: AppStyles.titleMeduim,
          ),
        ],
      ),
    );
  }

  Widget _aboutDevelper(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.justify,
      TextSpan(
        children: [
          TextSpan(
            text: '${AppStrings.of(context).aboutDeveloper}: ',
            style: AppStyles.titleMeduimBold,
          ),
          TextSpan(
            text: AppStrings.of(context).aboutDeveloperDiscreption,
            style: AppStyles.titleMeduim,
          ),
        ],
      ),
    );
  }

  Widget _description(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("${AppStrings.of(context).contactMeOnEmail}:   ", style: AppStyles.titleMeduimBold),
          RotateAnimatedForEverWidget(
            duration: const Duration(milliseconds: 1000),
            child: ScaleAnimatedForEverWidget(
              duration: const Duration(milliseconds: 1000),
              child: AnimatedTextKit(
                onTap: () => context.read<AppDeveloperCubit>().sendMessageToDb(),
                repeatForever: true,
                isRepeatingAnimation: true,
                animatedTexts: [
                  ColorizeAnimatedText(
                    AppConstants.developerEmail,
                    textStyle: AppStyles.titleMeduim,
                    speed: const Duration(milliseconds: 500),
                    colors: [
                      context.themeColors.primary,
                      context.themeColors.onBackground,
                      context.themeColors.third,
                      context.themeColors.error,
                      context.themeColors.onBackground,
                      context.themeColors.third,
                      context.themeColors.error,
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Text _textFieldsTitle(BuildContext context) => Text(
        AppStrings.of(context).appDeveloperDiscreption,
        textAlign: TextAlign.center,
      );
}
