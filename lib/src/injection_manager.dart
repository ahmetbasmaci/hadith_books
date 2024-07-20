import 'package:get_it/get_it.dart';

import '../core/packages/local_storage/local_storage.dart';
import '../core/services/json_service.dart';
import '../features/favorite_button/favorite_button.dart';
import '../features/hadith_home/hadith_home.dart';
import '../features/locale/locale.dart';
import '../features/settings/presentation/cubit/settings_cubit.dart';
import '../features/theme/theme.dart';

class InjectionManager {
  InjectionManager._();
  static final _instance = InjectionManager._();
  static InjectionManager get instance => _instance;

  ThemeCubit get themeCubit => _sl<ThemeCubit>();
  LocaleCubit get localeCubit => _sl<LocaleCubit>();

  HadithHomeCubit get hadithHomeCubit => _sl<HadithHomeCubit>();
  HadithViewCubit get hadithViewCubit => _sl<HadithViewCubit>();
  SettingsCubit get settingsCubit => _sl<SettingsCubit>();
  FavoriteButtonCubit get favoriteButtonCubit => _sl<FavoriteButtonCubit>();

  final _sl = GetIt.instance;

  Future<void> init() async {
    await _initExternal();

    await _initTheme();
    await _initLcoale();
    await _initHadith();
    await _initSettings();
    await _initFavoriteButton();
  }

  Future _initExternal() async {
    //!External
    _sl.registerLazySingleton<ILocalStorage>(() => LocalStorage());
    _sl.registerLazySingleton<IJsonService>(() => JsonService());
  }

  Future _initTheme() async {
    //!Cubit
    _sl.registerFactory(() => ThemeCubit(localStorage: _sl()));
  }

  Future _initLcoale() async {
    //!Cubit
    _sl.registerFactory(() => LocaleCubit(localStorage: _sl()));
  }

  Future _initHadith() async {
//!DataSource
    _sl.registerLazySingleton<IHadithBookDataSource>(
      () => HadithBookDataSource(_sl()),
    );

    //!Repository
    _sl.registerLazySingleton<IHadithBookRepository>(
      () => HadithBookRepository(_sl()),
    );

    //!usecase
    _sl.registerLazySingleton(() => GetHadithBookUseCase(_sl()));

    //!Cubit
    _sl.registerFactory(() => HadithHomeCubit(_sl()));
    //!Cubit
    _sl.registerFactory(() => HadithViewCubit(_sl(), _sl()));
  }

  Future _initSettings() async {
    //!DataSource

    //!Repository

    //!usecase

    //!Cubit
    //!Cubit
    _sl.registerFactory(() => SettingsCubit());
  }

  Future _initFavoriteButton() async {
    //!DataSource
    _sl.registerLazySingleton<IFavoriteButtonReadWriteDataSource>(
        () => FavoriteButtonReadWriteDataSource(databaseManager: _sl()));
    _sl.registerLazySingleton<IFavoriteButtonCheckContentIfFavoriteDataSource>(
        () => FavoriteButtonCheckContentIfFavoriteDataSource(databaseManager: _sl()));

    //!Repository
    _sl.registerLazySingleton<IFavoriteButtonRepository>(
      () => FavoriteButtonRepository(
        checkContentIfFavoriteDataSource: _sl(),
        readWriteDataSource: _sl(),
      ),
    );

    //!usecase
    _sl.registerLazySingleton(() => FavoriteButtonAddItemUseCase(favoriteRepository: _sl()));
    _sl.registerLazySingleton(() => FavoriteButtonCheckContentIfFavoriteUseCase(favoriteRepository: _sl()));
    _sl.registerLazySingleton(() => FavoriteButtonRemoveItemUseCase(favoriteRepository: _sl()));

    //!Cubit
    _sl.registerFactory(
      () => FavoriteButtonCubit(
        favoriteButtonAddItemUseCase: _sl(),
        favoriteButtonCheckContentIfFavoriteUseCase: _sl(),
        favoriteButtonRemoveItemUseCase: _sl(),
      ),
    );
  }
}
