import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hadith_books/src/injection_manager.dart';

import '../core/core.dart';
import '../features/features.dart';

enum AppRoutes {
  root("/homeHadith"),
  splash("/Splash"),

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
      path: AppRoutes.homeHadith.path,
      name: AppRoutes.homeHadith.name,
      builder: (context, state) => const HadithHomePage(),
    ),
    GoRoute(
      path: AppRoutes.hadithsViewPage.path,
      name: AppRoutes.hadithsViewPage.name,
      builder: (context, state) => BlocProvider(
        create: (context) => InjectionManager.instance.hadithViewCubit,
        child: HadithsViewPage(hadithBooksEnum: HadithBooksEnumCodec().decoder.convert(state.extra as String)),
      ),
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
