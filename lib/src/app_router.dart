import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hadith_books/features/splash/presentation/pages/splash_page.dart';
import 'package:hadith_books/src/injection_manager.dart';

import '../core/core.dart';
import '../features/features.dart';

enum AppRoutes {
  root("/splash"),
  splash("/splash"),
  onBoard("/onBoard"),

  // Home
  homeHadith("/homeHadith"),
  hadithsViewPage("/hadithsViewPage"),
  settingsPage("/settingsPage"),
  favoritepage("/favoritepage"),
  appDeveloperPage("/appDeveloperPage"),
  imamTarjama("/imamTarjama"),
  ;

  const AppRoutes(this.path);
  final String path;
}

GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.root.path,
  navigatorKey: AppConstants.navigatorKey,
  debugLogDiagnostics: kDebugMode,
  routes: [
    GoRoute(
      path: AppRoutes.onBoard.path,
      name: AppRoutes.onBoard.name,
      builder: (context, state) => BlocProvider(
        create: (context) => InjectionManager.instance.onBoardCubit,
        child: const OnBoardPage(),
      ),
    ),
    GoRoute(
      path: AppRoutes.splash.path,
      name: AppRoutes.splash.name,
      builder: (context, state) => BlocProvider(
        create: (context) => InjectionManager.instance.splashCubit,
        child:  const SplashPage(),
      )
     
    ),
    GoRoute(
      path: AppRoutes.homeHadith.path,
      name: AppRoutes.homeHadith.name,
      builder: (context, state) => const HadithHomePage(),
    ),
    GoRoute(
      path: AppRoutes.hadithsViewPage.path,
      name: AppRoutes.hadithsViewPage.name,
      builder: (context, state) {
        var hadithBooksEnum = HadithBooksEnumCodec().decoder.convert(state.extra as String);
        return BlocProvider(
          create: (context) => InjectionManager.instance.hadithViewCubit..init(hadithBooksEnum),
          child: HadithsViewPage(hadithBooksEnum: hadithBooksEnum),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.settingsPage.path,
      name: AppRoutes.settingsPage.name,
      builder: (context, state) => const SettingsPage(),
    ),
    GoRoute(
      path: AppRoutes.favoritepage.path,
      name: AppRoutes.favoritepage.name,
      builder: (context, state) => BlocProvider(
        create: (context) => InjectionManager.instance.favoriteCubit,
        child: const FavoritePage(),
      ),
    ),
    GoRoute(
      path: AppRoutes.appDeveloperPage.path,
      name: AppRoutes.appDeveloperPage.name,
      builder: (context, state) => BlocProvider(
        create: (context) => InjectionManager.instance.appDeveloperCubit,
        child: const AppDeveloperPage(),
      ),
    ),
    GoRoute(
      path: AppRoutes.imamTarjama.path,
      name: AppRoutes.imamTarjama.name,
      builder: (context, state) => ImamTarjamaScreen(bookId: state.extra as int),
    ),
  ],
);
