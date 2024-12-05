import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hadith_books/config/local/l10n.dart';
import 'package:hadith_books/core/core.dart';

import '../../../../src/src.dart';
import '../../../features.dart';

part 'home_page_screens_state.dart';

class HomePageScreensCubit extends Cubit<HomePageScreensState> {
  HomePageScreensCubit() : super(HomePageScreensState(HomePageScreensEnum.home)) {
    _initScreensModels();
  }
  late final List<BottomNavigationBarItemModel> _bottomNavigationBarItemModels;
  bool favoriteOpened = false;
  void _initScreensModels() {
    _bottomNavigationBarItemModels = [
      _getHomeScreenModel(),
      _getFavoriteScreenModel(),
      _getSettingsScreenModel(),
      _getAppDeveloperScreenModel(),
    ];
  }

  BottomNavigationBarItemModel _getHomeScreenModel() {
    return BottomNavigationBarItemModel(
      screenEnum: HomePageScreensEnum.home,
      screen: const HadithHomeBody(),
      icon: AppIcons.home,
    );
  }

  BottomNavigationBarItemModel _getFavoriteScreenModel() {
    return BottomNavigationBarItemModel(
      screenEnum: HomePageScreensEnum.favorite,
      screen: const FavoritePage(),
      icon: AppIcons.favorite,
      appBarTrailing: const FavoriteSelectZikrType(),
    );
  }

  BottomNavigationBarItemModel _getSettingsScreenModel() {
    return BottomNavigationBarItemModel(
      screenEnum: HomePageScreensEnum.settings,
      screen: SettingsPage(),
      icon: AppIcons.settings,
    );
  }

  BottomNavigationBarItemModel _getAppDeveloperScreenModel() {
    return BottomNavigationBarItemModel(
      screenEnum: HomePageScreensEnum.aboutApp,
      screen: BlocProvider(
        create: (context) => InjectionManager.instance.appDeveloperCubit,
        child: const AppDeveloperPage(),
      ),
      icon: AppIcons.info,
    );
  }

  void changeScreen(int index) async {
    HomePageScreensEnum selctedScreenEnum = HomePageScreensEnum.values.firstWhere((element) => element.index == index);
    if (selctedScreenEnum == HomePageScreensEnum.favorite && !favoriteOpened) {
      favoriteOpened = true;
      ToatsHelper.info(AppStrings.of(AppConstants.context).openFavoritePageNote);
      await Future.delayed(const Duration(milliseconds: 200));
    }
    _changeScreen(selctedScreenEnum);
  }

  void _changeScreen(HomePageScreensEnum selectedScreen) {
    emit(HomePageScreensState(selectedScreen));
  }

  BottomNavigationBarItemModel get getSelectedScreenModel {
    return _bottomNavigationBarItemModels[state.selectedScreen.index];
  }

  List<BottomNavigationBarItemModel> get getAllScreensModels => _bottomNavigationBarItemModels;

  int get getSelectedScreenIndex => state.selectedScreen.index;
}
