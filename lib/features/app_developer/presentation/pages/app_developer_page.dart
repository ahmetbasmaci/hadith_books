import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../config/local/l10n.dart';
import '../../../../core/core.dart';
import '../../../features.dart';

class AppDeveloperPage extends StatelessWidget {
  const AppDeveloperPage({super.key});
  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  Widget _body(BuildContext context) {
    return BlocBuilder<AppDeveloperCubit, AppDeveloperState>(
      builder: (context, state) {
        return AnimatedBackgroundWidget(child: _childeren(context));
      },
    );
  }

  Widget _childeren(BuildContext context) {
    return OpacityLayer(
      useBottomOpacityContainer: false,
      useTopOpacityContainer: true,
      color: context.themeColors.primary,
      height: context.width * .4,
      startOpacity: .2,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.screenPadding),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            _image(context),
            VerticalSpace.xLarge(),
            _aboutApp(context),
            VerticalSpace.xLarge(),
            _aboutDevelper(context),
            VerticalSpace.xLarge(),
            _contactWithUs(context),
            VerticalSpace.medium(),
          ],
        ),
      ),
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
            style: AppStyles.titleSmallBold,
          ),
          TextSpan(
            text: AppStrings.of(context).aboutAppDiscreption,
            style: AppStyles.normal,
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
            style: AppStyles.titleSmallBold,
          ),
          TextSpan(
            text: AppStrings.of(context).aboutDeveloperDiscreption,
            style: AppStyles.normal,
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
            style: AppStyles.titleSmallBold,
          ),
          TextSpan(
            text: AppStrings.of(context).appDeveloperDiscreption,
            style: AppStyles.normal,
          ),
          WidgetSpan(
            child: Row(
              children: [
                Expanded(
                  child: ScaleAnimatedForEverWidget(
                    duration: const Duration(milliseconds: 1500),
                    child: AnimatedTextKit(
                      onTap: () => context.read<AppDeveloperCubit>().sendMessageToDb(),
                      repeatForever: true,
                      isRepeatingAnimation: true,
                      animatedTexts: [
                        ColorizeAnimatedText(
                          AppConstants.developerEmail,
                          textStyle: AppStyles.titleMeduim,
                          speed: const Duration(milliseconds: 500),
                          textAlign: TextAlign.center,
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
