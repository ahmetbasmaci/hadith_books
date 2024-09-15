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
    return AppScaffold(
      useSliver: false,
      actions: const [AppBackBtn()],
      title: AppStrings.of(context).appDeveloper,
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return BlocBuilder<AppDeveloperCubit, AppDeveloperState>(
      builder: (context, state) {
        return AnimatedBackgroundWidget(child: _childeren(context));
      },
    );
  }

  Widget _childeren(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        _image(context),
        VerticalSpace.xLarge(),
        _aboutApp(context),
        VerticalSpace.xLarge(),
        _aboutDevelper(context),
        VerticalSpace.xLarge(),
        _contactWithUs(context),
        VerticalSpace.xxLarge(),
      ],
    );
  }

  Widget _image(BuildContext context) {
    return Container(
      // color: context.theme.scaffoldBackgroundColor,
      color: Colors.transparent,
      child: ScaleAnimatedForEverWidget(
        child: Lottie.asset(
          AppAnimations.developer,
          repeat: true,
        ),
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

  Widget _contactWithUs(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '${AppStrings.of(context).contactMeOnEmail}:   ',
            style: AppStyles.titleMeduimBold,
          ),
          TextSpan(
            text: AppStrings.of(context).appDeveloperDiscreption,
            style: AppStyles.titleMeduim,
          ),
          const TextSpan(text: '   '),
          WidgetSpan(
            child: RotateAnimatedForEverWidget(
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
          )
        ],
      ),
    );
    // Wrap(
    //   direction: Axis.horizontal,
    //   children: [
    //     Text("${AppStrings.of(context).contactMeOnEmail}:   ", style: AppStyles.titleMeduimBold),
    //     Text(
    //       AppStrings.of(context).appDeveloperDiscreption,
    //       textAlign: TextAlign.center,
    //     ),
    //     RotateAnimatedForEverWidget(
    //       duration: const Duration(milliseconds: 1000),
    //       child: ScaleAnimatedForEverWidget(
    //         duration: const Duration(milliseconds: 1000),
    //         child: AnimatedTextKit(
    //           onTap: () => context.read<AppDeveloperCubit>().sendMessageToDb(),
    //           repeatForever: true,
    //           isRepeatingAnimation: true,
    //           animatedTexts: [
    //             ColorizeAnimatedText(
    //               AppConstants.developerEmail,
    //               textStyle: AppStyles.titleMeduim,
    //               speed: const Duration(milliseconds: 500),
    //               colors: [
    //                 context.themeColors.primary,
    //                 context.themeColors.onBackground,
    //                 context.themeColors.third,
    //                 context.themeColors.error,
    //                 context.themeColors.onBackground,
    //                 context.themeColors.third,
    //                 context.themeColors.error,
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
