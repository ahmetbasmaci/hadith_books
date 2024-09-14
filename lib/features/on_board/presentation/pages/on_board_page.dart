import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hadith_books/core/core.dart';
import 'package:hadith_books/src/injection_manager.dart';

import '../../../features.dart';

class SplashEndPage extends StatefulWidget {
  const SplashEndPage({super.key});

  @override
  State<SplashEndPage> createState() => _SplashEndPageState();
}

class _SplashEndPageState extends State<SplashEndPage> {
  @override
  Widget build(BuildContext c) {
    return Scaffold(
      backgroundColor: Colors.brown.shade200,
      body: Center(
        child: OpenContainer(
          closedBuilder: (_, openContainer) {
            return const SizedBox(
              height: 60,
              width: 220,
              child: Center(
                child: Text(
                  'View Onboard Animation',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
          openColor: Colors.white,
          closedElevation: 20,
          closedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          transitionDuration: const Duration(milliseconds: 700),
          openBuilder: (_, closeContainer) {
            return const OnBoardPage();
          },
        ),
      ),
    );
  }
}

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({super.key});

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardCubit, OnBoardState>(
      builder: (context, state) {
        var cubit = InjectionManager.instance.onBoardCubit;
        return Scaffold(
          body: SafeArea(
            child: PageView(
              controller: cubit.pageController,
              children: [
                OnBoardBodyWidget(
                  hero: Image.asset(AppImages.appLogo),
                  title: "Boost your traffic",
                  subtitle: "Outreach to many social networks to improve your statistics",
                  onNext: cubit.nextPage,
                  onSkip: cubit.startApp,
                ),
                OnBoardBodyWidget(
                  hero: Image.asset(AppImages.appLogo),
                  title: "Give the best solution",
                  subtitle: "We will give best solution for your business isues",
                  onNext: cubit.nextPage,
                  onSkip: cubit.startApp,
                ),
                OnBoardBodyWidget(
                  hero: Image.asset(AppImages.appLogo),
                  title: "Reach the target",
                  subtitle: "With our help, it will be easier to achieve your goals",
                  onNext: cubit.startApp,
                  onSkip: cubit.startApp,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
