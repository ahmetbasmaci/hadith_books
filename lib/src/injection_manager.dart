import 'package:get_it/get_it.dart';
import 'package:hadith_books/features/hadith_home/domain/usecases/get_last_readed_hadith_id.dart';
import 'package:hadith_books/features/search/domain/usecases/insert_all_search_tria_use_case.dart';

import '../core/database/database_manager.dart';
import '../core/database/i_database_manager.dart';
import '../core/packages/local_storage/local_storage.dart';
import '../core/packages/mail_sender/mail_sender_manager.dart';
import '../core/services/json_service.dart';
import '../features/features.dart';
import '../features/hadith_home/presentation/home_page_screens/home_page_screens_cubit.dart';
import '../features/search/domain/usecases/init_all_search_tria_use_case.dart';
import 'src.dart';

class InjectionManager {
  InjectionManager._();
  static final _instance = InjectionManager._();
  static InjectionManager get instance => _instance;

  ThemeCubit get themeCubit => _sl<ThemeCubit>();
  LocaleCubit get localeCubit => _sl<LocaleCubit>();
  ChangeFontSizeSliderCubit get changeFontSizeSliderCubit => _sl<ChangeFontSizeSliderCubit>();
  ChangeHadithViewTypeCubit get changeHadithViewTypeCubit => _sl<ChangeHadithViewTypeCubit>();
  ExpandAllOptionCubit get expandAllOptionCubit => _sl<ExpandAllOptionCubit>();

  HadithHomeCubit get hadithHomeCubit => _sl<HadithHomeCubit>();
  HomePageScreensCubit get homePageScreensCubit => _sl<HomePageScreensCubit>();
  HadithSearchFilterCubit get hadithSearchFilterCubit => _sl<HadithSearchFilterCubit>();
  HadithViewCubit get hadithViewCubit => _sl<HadithViewCubit>();
  SettingsCubit get settingsCubit => _sl<SettingsCubit>();
  FavoriteButtonCubit get favoriteButtonCubit => _sl<FavoriteButtonCubit>();
  FavoriteCubit get favoriteCubit => _sl<FavoriteCubit>();
  AppDeveloperCubit get appDeveloperCubit => _sl<AppDeveloperCubit>();
  OnBoardCubit get onBoardCubit => _sl<OnBoardCubit>();
  SplashCubit get splashCubit => _sl<SplashCubit>();
  SearchCubit get searchCubit => _sl<SearchCubit>();
  late final AppInitializationCubit appInitializationCubit;
  final _sl = GetIt.instance;

  Future<void> init() async {
    await _initExternal();

    await _initTheme();
    await _initLcoale();
    await _initChangeFontSizeSliderCubit();
    await _initChangeHadithViewTypeCubit();
    await _initExpandAllOptionCubit();
    await _initSearch();
    await _initHadith();
    await _initSettings();
    await _initFavoriteButton();
    await _initFavorite();
    await _initAppDeveloperCubit();
    await _initOnBoardCubit();
    await _initSplashCubit();

    await _initAppInitialization();
   
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
    _sl.registerFactory(() => ThemeCubit(_sl()));
  }

  Future _initLcoale() async {
    //!Cubit
    _sl.registerFactory(() => LocaleCubit(_sl()));
  }

  Future _initChangeFontSizeSliderCubit() async {
    //!Cubit
    _sl.registerFactory(() => ChangeFontSizeSliderCubit(_sl()));
  }

  Future _initChangeHadithViewTypeCubit() async {
    //!Cubit
    _sl.registerFactory(() => ChangeHadithViewTypeCubit(_sl()));
  }

  Future _initExpandAllOptionCubit() async {
    //!Cubit
    _sl.registerFactory(() => ExpandAllOptionCubit(_sl()));
  }

  Future _initHadith() async {
    //!DataSource
    _sl.registerLazySingleton<IHadithBookDataSource>(() => HadithBookDataSource(_sl(), _sl()));

    //!Repository
    _sl.registerLazySingleton<IHadithBookRepository>(() => HadithBookRepository(_sl()));

    //!usecase
    _sl.registerLazySingleton(() => GetHadithBookUseCase(_sl()));
    _sl.registerLazySingleton(() => GetAllHadithBookUseCase(_sl()));
    _sl.registerLazySingleton(() => GetAllAuthersUseCase(_sl()));
    _sl.registerLazySingleton(() => GetAutherByIdUseCase(_sl()));
    _sl.registerLazySingleton(() => GetLastReadedHadithId(_sl()));

    //!Cubit
    _sl.registerFactory(() => HadithHomeCubit(_sl(), _sl(), _sl(), _sl(), _sl()));
    _sl.registerFactory(() => HomePageScreensCubit());
    _sl.registerFactory(() => HadithViewCubit(_sl(), _sl(), _sl()));
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
        () => FavoriteButtonCheckContentIfFavoriteDataSource(_sl()));
    _sl.registerLazySingleton<IFavoriteButtonReadWriteDataSource>(() => FavoriteButtonReadWriteDataSource(_sl()));

    //!Repository
    _sl.registerLazySingleton<IFavoriteButtonRepository>(() => FavoriteButtonRepository(_sl(), _sl()));

    //!usecase
    _sl.registerLazySingleton(() => FavoriteButtonAddItemUseCase(_sl()));
    _sl.registerLazySingleton(() => FavoriteButtonCheckContentIfFavoriteUseCase(_sl()));
    _sl.registerLazySingleton(() => FavoriteButtonRemoveItemUseCase(_sl()));

    //!Cubit
    _sl.registerFactory(() => FavoriteButtonCubit(_sl(), _sl(), _sl()));
  }

  Future _initFavorite() async {
    //!DataSource
    _sl.registerLazySingleton<IFavoriteGetAllDataSource>(() => FavoriteGetAllDataSource(_sl()));
    _sl.registerLazySingleton<IFavoriteSelectedBooksDataSource>(() => FavoriteSelectedBooksDataSource(_sl()));

    //!Repository
    _sl.registerLazySingleton<IFavoriteRepository>(
      () => FavoriteRepository(_sl(), _sl()),
    );

    //!usecase
    _sl.registerLazySingleton(() => FavoriteGetAllUseCase(_sl()));
    _sl.registerLazySingleton(() => FavoriteSaveSelectedBooksUseCase(_sl()));
    _sl.registerLazySingleton(() => FavoriteGetSavedSelectedBooksUseCase(_sl()));

    //!Cubit
    _sl.registerFactory(() => FavoriteCubit(_sl(), _sl(), _sl()));
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

  Future _initOnBoardCubit() async {
    //!DataSource

    //!Repository

    //!usecase

    //!Cubit
    _sl.registerFactory(() => OnBoardCubit(_sl()));
  }

  Future _initSplashCubit() async {
    //!DataSource

    //!Repository

    //!usecase

    //!Cubit
    _sl.registerFactory(() => SplashCubit(_sl()));
  }

  Future _initSearch() async {
    //!DataSource
    _sl.registerLazySingleton<ISearchDataSource>(() => SearchDataSource(_sl()));

    //!Repository
    _sl.registerLazySingleton<ISearchRepository>(() => SearchRepository(_sl()));

    //!usecase
    _sl.registerLazySingleton(() => InitSearchTriaUseCase(_sl()));
    _sl.registerLazySingleton(() => InsertAllSearchTriaUseCase(_sl()));
    _sl.registerLazySingleton(() => SearchUseCase(_sl()));
    _sl.registerLazySingleton(() => InitAllSearchTriaUseCase(_sl()));

    //!Cubit
    _sl.registerFactory(() => SearchCubit(_sl(), _sl(), _sl()));
  }

  Future _initAppInitialization() async {
    //!Cubit
    _sl.registerFactory(() => AppInitializationCubit(_sl()));
     appInitializationCubit = _sl<AppInitializationCubit>();
  }
}
