import 'package:flutter/material.dart';
import 'dart:async';
import 'package:hadith_books/config/local/l10n.dart';
import 'package:hadith_books/core/core.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:hadith_books/src/app_router.dart';
import 'package:hadith_books/src/injection_manager.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 400), () {
      setState(() {
        _a = true;
      });
    });
    Timer(const Duration(milliseconds: 1300), () {
      setState(() {
        _b = true;
      });
    });
    Timer(const Duration(milliseconds: 1700), () {
      setState(() {
        _d = true;
      });
    });
    Timer(const Duration(milliseconds: 3400), () {
      setState(() {
        _c = true;
      });
    });
    Timer(
      const Duration(milliseconds: 3850),
      () {
        AppRoutes routeName = InjectionManager.instance.splashCubit.nextRouteName;
        NavigatorHelper.pushReplacementNamed(routeName);
      },
    );
  }

  bool _a = false;
  bool _b = false;
  bool _c = false;
  bool _d = false;
  final double imageSize = 100;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = context.height;
    double w = context.width;
    return Scaffold(
      backgroundColor: context.themeColors.background,
      body: Center(
        child: Column(
          children: [
            _dotWidget(h),
            _cardWidget(h, w, context),
            ..._footer(),
          ],
        ),
      ),
    );
  }

  AnimatedContainer _dotWidget(double h) {
    return AnimatedContainer(
      duration: Duration(milliseconds: _c ? 900 : 2500),
      curve: _c ? Curves.fastLinearToSlowEaseIn : Curves.elasticOut,
      height: _c
          ? 0
          : _a
              ? h / 3
              : 20,
      width: 20,
    );
  }

  AnimatedContainer _cardWidget(double h, double w, BuildContext context) {
    double size = ResponsiveManager.responsiveContainerSize(imageSize * 3);
    return AnimatedContainer(
      curve: Curves.fastLinearToSlowEaseIn,
      duration: Duration(
          seconds: _c
              ? 1
              : _b
                  ? 2
                  : 0),
      height: _c
          ? h
          : _b
              ? size
              : 20,
      width: _c
          ? w
          : _b
              ? size
              : 20,
      decoration: BoxDecoration(
        color: _b ? context.themeColors.surface : context.themeColors.primary,
        borderRadius: _c ? const BorderRadius.only() : BorderRadius.circular(AppSizes.borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Center(
        child: _d ? _cardContent(context) : const SizedBox(),
      ),
    );
  }

  Column _cardContent(BuildContext context) {
    var responsiveSize = ResponsiveManager.responsiveContainerSize(imageSize);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppImages.appLogo, height: responsiveSize, width: responsiveSize),
        VerticalSpace.small(),
        AnimatedTextKit(
          totalRepeatCount: 1,
          displayFullTextOnTap: true,
          animatedTexts: [
            TyperAnimatedText(
              AppStrings.of(context).appName,
              textStyle: AppStyles.titleXBigBold,
            ),
          ],
        ),
        VerticalSpace.small(),
        AnimatedTextKit(
          totalRepeatCount: 1,
          displayFullTextOnTap: true,
          animatedTexts: [
            FadeAnimatedText(
              AppStrings.of(context).appDiscreption,
              textStyle: AppStyles.titleBig.copyWith(color: context.themeColors.natural),
              duration: const Duration(milliseconds: 2000),
            )
          ],
        ),
      ],
    );
  }

  List<Widget> _footer() {
    return (_b && !_c) ? [const Spacer(), const CircularProgressIndicator(), VerticalSpace.xxLarge()] : [];
  }
}
