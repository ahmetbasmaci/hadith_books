import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hadith_books/core/core.dart';

import '../../../../src/app_router.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final ILocalStorage _localStorage;
  SplashCubit(this._localStorage) : super(SplashInitial());

  AppRoutes get nextRouteName {
    return AppRoutes.onBoard;
    bool isNotFirstLogin = _localStorage.read<bool>(AppStorageKeys.onBoardPageViewed) ?? false;
    if (isNotFirstLogin) {
      return AppRoutes.homeHadith;
    } else {
      return AppRoutes.onBoard;
    }
  }
}
