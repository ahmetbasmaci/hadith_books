import 'package:get_it/get_it.dart';

import '../core/database/database_manager.dart';
import '../core/database/i_database_manager.dart';
import '../core/packages/local_storage/local_storage.dart';
import '../core/packages/mail_sender/mail_sender_manager.dart';
import '../core/services/json_service.dart';
import '../features/features.dart';

class InjectionManager {
  InjectionManager._();
  static final _instance = InjectionManager._();
  static InjectionManager get instance => _instance;

  ThemeCubit get themeCubit => _sl<ThemeCubit>();
  LocaleCubit get localeCubit => _sl<LocaleCubit>();
  ChangeFontSizeSliderCubit get changeFontSizeSliderCubit => _sl<ChangeFontSizeSliderCubit>();

  HadithHomeCubit get hadithHomeCubit => _sl<HadithHomeCubit>();
  HadithSearchFilterCubit get hadithSearchFilterCubit => _sl<HadithSearchFilterCubit>();
  HadithViewCubit get hadithViewCubit => _sl<HadithViewCubit>();
  SettingsCubit get settingsCubit => _sl<SettingsCubit>();
  FavoriteButtonCubit get favoriteButtonCubit => _sl<FavoriteButtonCubit>();
  FavoriteCubit get favoriteCubit => _sl<FavoriteCubit>();
  AppDeveloperCubit get appDeveloperCubit => _sl<AppDeveloperCubit>();
  final _sl = GetIt.instance;

  Future<void> init() async {
    await _initExternal();

    await _initTheme();
    await _initLcoale();
    await _initChangeFontSizeSliderCubit();
    await _initHadith();
    await _initSettings();
    await _initFavoriteButton();
    await _initFavorite();
    await _initAppDeveloperCubit();

    // hadithViewCubit = _sl<HadithViewCubit>();
  }

  Future _initExternal() async {
    //!External
    _sl.registerLazySingleton<ILocalStorage>(() => LocalStorage());
    _sl.registerLazySingleton<IJsonService>(() => JsonService());
    _sl.registerLazySingleton<IDatabaseManager>(() => DatabaseManager());
    _sl.registerLazySingleton<IMailSenderManager>(() => MailSenderManager());
  }

  Future _initTheme() async {
    //!Cubit
    _sl.registerFactory(() => ThemeCubit(localStorage: _sl()));
  }

  Future _initLcoale() async {
    //!Cubit
    _sl.registerFactory(() => LocaleCubit(localStorage: _sl()));
  }

  Future _initChangeFontSizeSliderCubit() async {
    //!Cubit
    _sl.registerFactory(() => ChangeFontSizeSliderCubit(_sl()));
  }

  Future _initHadith() async {
//!DataSource
    _sl.registerLazySingleton<IHadithBookDataSource>(() => HadithBookDataSource(_sl()));

    //!Repository
    _sl.registerLazySingleton<IHadithBookRepository>(() => HadithBookRepository(_sl()));

    //!usecase
    _sl.registerLazySingleton(() => GetHadithBookUseCase(_sl()));
    _sl.registerLazySingleton(() => GetAllHadithBookUseCase(_sl()));

    //!Cubit
    _sl.registerFactory(() => HadithHomeCubit(_sl()));
    _sl.registerFactory(() => HadithViewCubit(_sl(), _sl()));
    _sl.registerFactory(() => HadithSearchFilterCubit(_sl()));
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
    _sl.registerLazySingleton<IFavoriteButtonCheckContentIfFavoriteDataSource>(
        () => FavoriteButtonCheckContentIfFavoriteDataSource(databaseManager: _sl()));
    _sl.registerLazySingleton<IFavoriteButtonReadWriteDataSource>(
        () => FavoriteButtonReadWriteDataSource(databaseManager: _sl()));

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

  Future _initFavorite() async {
    //!DataSource
    _sl.registerLazySingleton<IFavoriteGetAllDataSource>(() => FavoriteGetAllDataSource(
          databaseManager: _sl(),
        ));

    //!Repository
    _sl.registerLazySingleton<IFavoriteRepository>(
      () => FavoriteRepository(
        getAllDataSource: _sl(),
      ),
    );

    //!usecase
    _sl.registerLazySingleton(() => FavoriteGetAllUseCase(favoriteRepository: _sl()));

    //!Cubit
    _sl.registerFactory(() => FavoriteCubit(favoriteGetAllUseCase: _sl()));
    _sl.registerFactory(() => FavoriteFilterCubit(_sl()));
  }

  Future _initAppDeveloperCubit() async {
    //!DataSource
    _sl.registerLazySingleton<IAppDeveloperSaveMessageToDbDataSource>(
        () => AppDeveloperSaveMessageToDbDataSource(_sl()));

    //!Repository
    _sl.registerLazySingleton<IAppDeveloperRepository>(() => AppDeveloperRepository(_sl()));

    //!usecase
    _sl.registerLazySingleton(() => AppDeveloperSaveMessageToDbUseCase(_sl()));

    //!Cubit
    _sl.registerFactory(() => AppDeveloperCubit(_sl()));
  }
}
