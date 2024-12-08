import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:hadith_books/config/local/l10n.dart';
import 'package:hadith_books/core/core.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../../../src/src.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _a = false;
  bool _b = false;
  bool _animateContainerToFullScreen = false;
  bool _d = false;
  double imageSize = 100;
  bool _animationEnded = false;
  bool _initDataEnded = false;

  @override
  void initState() {
    super.initState();
    // _initData();

    _setAnimationTimers();
  }

  Future<void> _initData()async {
   await  InjectionManager.instance.appInitializationCubit.initializeApp();
  }

  void _setAnimationTimers() {
    Timer(const Duration(milliseconds: 100), () {
      if (mounted) {
        setState(() => _a = true);
      }
    });
    Timer(const Duration(milliseconds: 1300), () {
      if (mounted) {
        setState(() => _b = true);
      }
    });
    Timer(const Duration(milliseconds: 1700), () {
      if (mounted) {
        setState(() => _d = true);
      }
    });
    Timer(const Duration(milliseconds: 3400), ()async {
      if (mounted) {
        //setState(() => _c = true);
        _animationEnded = true;
        await _initData();
        _checkIfInitEndedToNavigatePage();
      }
    });
  }

  Future<void> _checkIfInitEndedToNavigatePage() async {
    //if (true) {
    if (_animationEnded && _initDataEnded) {
      setState(() => _animateContainerToFullScreen = true);
      // await InjectionManager.instance.appInitializationCubit.initializeSearch();
      // await Future.delayed(const Duration(milliseconds: 300));
      AppRoutes routeName = InjectionManager.instance.splashCubit.nextRouteName;
      NavigatorHelper.pushReplacementNamed(routeName);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.themeColors.background,
      body: BlocListener<AppInitializationCubit, AppInitializationState>(
        listener: (context, state) {
          if (state is InitializationCompletedState) {
            _initDataEnded = true;
            _checkIfInitEndedToNavigatePage();
          }
        },
        child: _body(),
      ),
    );
  }

  Center _body() {
    return Center(
      child: Column(
        children: [
          _dotWidget(),
          _cardWidget(),
          ..._footer(),
        ],
      ),
    );
  }

  AnimatedContainer _dotWidget() {
    return AnimatedContainer(
      duration: Duration(milliseconds: _animateContainerToFullScreen ? 900 : 2500),
      curve: _animateContainerToFullScreen ? Curves.fastLinearToSlowEaseIn : Curves.elasticOut,
      height: _animateContainerToFullScreen
          ? 0
          : _a
              ? context.height / 3
              : 20,
      width: 20,
    );
  }

  AnimatedContainer _cardWidget() {
    double size = ResponsiveManager.responsiveContainerSize(imageSize * 3);
    return AnimatedContainer(
      curve: Curves.fastLinearToSlowEaseIn,
      duration: Duration(
          seconds: _animateContainerToFullScreen
              ? 1
              : _b
                  ? 2
                  : 0),
      height: _animateContainerToFullScreen
          ? context.height
          : _b
              ? size
              : 20,
      width: _animateContainerToFullScreen
          ? context.width
          : _b
              ? size
              : 20,
      decoration: BoxDecoration(
        color: _b ? context.themeColors.surface : context.themeColors.primary,
        borderRadius:
            _animateContainerToFullScreen ? const BorderRadius.only() : BorderRadius.circular(AppSizes.borderRadius),
        boxShadow: [
          BoxShadow(
            color: context.isDark
                ? Colors.grey.withOpacity(_animateContainerToFullScreen ? .6 : 0.2)
                : Colors.black.withOpacity(_animateContainerToFullScreen ? 1 : 0.2),
            blurRadius: _animateContainerToFullScreen ? 40 : 10,
            spreadRadius: _animateContainerToFullScreen ? 10 : 3,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Center(
        child: _d ? _cardContent(context) : const SizedBox(),
      ),
    );
  }

  Widget _cardContent(BuildContext context) {
    var responsiveSize = ResponsiveManager.responsiveContainerSize(imageSize);

    return SingleChildScrollView(
      child: Column(
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
                textStyle: AppStyles.titleXBig.bold,
              ),
            ],
          ),
          VerticalSpace.small(),
          FadeInText(
            child: Text(
              AppStrings.of(context).appDiscreption,
              style: AppStyles.titleBig.copyWith(color: context.themeColors.natural),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _footer() {
    return (_b && !_animateContainerToFullScreen)
        ? [const Spacer(), const CircularProgressIndicator(), VerticalSpace.xxLarge()]
        : [
            // BlocListener<HadithHomeCubit, HadithHomeState>(
            //   listener: (context, state) {
            //     PrinterHelper.print('*****state ${state.toString()}');
            //     if (state is HadithHomeInitial) {
            //       NavigatorHelper.pushReplacementNamed(AppRoutes.homeHadith);
            //     }
            //   },
            //   // builder: (context, state) {
            //   //   return Text(
            //   //     'init home cubit',
            //   //     style: AppStyles.titleSmall.copyWith(color: context.themeColors.error),
            //   //   );
            //   // },
            // )
          ];
  }
}
