import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hadith_books/config/local/l10n.dart';
import 'package:hadith_books/core/core.dart';

import '../../../../src/src.dart';
import '../../../features.dart';
import '../../data/models/bottom_navigation_bar_item_model.dart';

part 'home_page_screens_state.dart';

class HomePageScreensCubit extends Cubit<HomePageScreensState> {
  HomePageScreensCubit() : super(HomePageScreensState(0)) {
    _initScreensModels();
  }
  late final List<BottomNavigationBarItemModel> bottomNavigationBarItemModels;

  void _initScreensModels() {
    bottomNavigationBarItemModels = [
      _getHomeScreenModel(),
      _getFavoriteScreenModel(),
      _getSettingsScreenModel(),
      _getAppDeveloperScreenModel(),
    ];
  }

  BottomNavigationBarItemModel _getHomeScreenModel() {
    return BottomNavigationBarItemModel(
      screen: const HadithHomeBody(),
      icon: AppIcons.home,
      title: AppStrings.of(AppConstants.context).hadithBooks,
    );
  }

  BottomNavigationBarItemModel _getFavoriteScreenModel() {
    return BottomNavigationBarItemModel(
      screen:  const FavoritePage(),
      icon: AppIcons.favorite,
      title: AppStrings.of(AppConstants.context).favorite,
      appBarTrailing:  const FavoriteSelectZikrType(),
    );
  }

  BottomNavigationBarItemModel _getSettingsScreenModel() {
    return BottomNavigationBarItemModel(
      screen: SettingsPage(),
      icon: AppIcons.settings,
      title: AppStrings.of(AppConstants.context).settings,
    );
  }

  BottomNavigationBarItemModel _getAppDeveloperScreenModel() {
    return BottomNavigationBarItemModel(
      screen: BlocProvider(
        create: (context) => InjectionManager.instance.appDeveloperCubit,
        child: const AppDeveloperPage(),
      ),
      icon: AppIcons.info,
      title: AppStrings.of(AppConstants.context).appDeveloper,
    );
  }

  void changeScreen(int index) {
    emit(HomePageScreensState(index));
  }
}
