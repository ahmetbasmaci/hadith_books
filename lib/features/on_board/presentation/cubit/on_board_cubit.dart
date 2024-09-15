import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/core.dart';
import '../../../../src/app_router.dart';

part 'on_board_state.dart';

class OnBoardCubit extends Cubit<OnBoardState> {
  final ILocalStorage localStorage;
  OnBoardCubit(this.localStorage) : super(const OnBoardState(0)) {
    pageController.addListener(
      () {
        emit(OnBoardState(pageController.page?.round().toInt() ?? 0));
      },
    );
  }

  final PageController pageController = PageController(initialPage: 0);

  void nextPage() {
    pageController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  void startApp() {
    localStorage.write(AppStorageKeys.onBoardPageViewed, true);
    NavigatorHelper.pushReplacementNamed(AppRoutes.homeHadith);
  }

  bool isPageSelected(int index) {
    if (pageController.hasClients && pageController.page != null) {
      return (pageController.page ?? 0) == index;
    } else {
      return false;
    }
  }
}
