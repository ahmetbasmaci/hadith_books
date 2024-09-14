import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hadith_books/core/core.dart';
import 'package:hadith_books/src/injection_manager.dart';

import '../../../features.dart';

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
