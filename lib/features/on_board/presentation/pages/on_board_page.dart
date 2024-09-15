import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/config/local/l10n.dart';

import 'package:hadith_books/core/core.dart';

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
        var cubit = context.read<OnBoardCubit>();
        return Scaffold(
          body: SafeArea(
            child: PageView(
              controller: cubit.pageController,
              children: [
                OnBoardBodyWidget(
                  animationPath: AppAnimations.booksAnimation,
                  title: AppStrings.of(context).moreThen15OfHadithBookk,
                  subtitle: AppStrings.of(context).moreThen15OfHadithBookkDiscreption,
                  onNext: cubit.nextPage,
                  onSkip: cubit.startApp,
                ),
                OnBoardBodyWidget(
                  animationPath: AppAnimations.searchInnBookAnimation,
                  title: AppStrings.of(context).quikSearch,
                  subtitle: AppStrings.of(context).quikSearchDiscreption,
                  onNext: cubit.nextPage,
                  onSkip: cubit.startApp,
                ),
                OnBoardBodyWidget(
                  animationPath: AppAnimations.bookFlippingPageAnimation,
                  title: AppStrings.of(context).saveReadingForward,
                  subtitle: AppStrings.of(context).saveReadingForwardDiscreption,
                  onNext: cubit.nextPage,
                  onSkip: cubit.startApp,
                ),
                OnBoardBodyWidget(
                  animationPath: AppAnimations.wifiAnimation,
                  title: AppStrings.of(context).workWithOutInternet,
                  subtitle: AppStrings.of(context).workWithOutInternetDiscreption,
                  onNext: cubit.nextPage,
                  onSkip: cubit.startApp,
                ),
                OnBoardBodyWidget(
                  animationPath: AppAnimations.noAdsAnimation,
                  title: AppStrings.of(context).noAds,
                  subtitle: AppStrings.of(context).noAdsDiscreption,
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
