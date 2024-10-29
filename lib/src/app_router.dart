import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
  initialLocation: kDebugMode ? AppRoutes.homeHadith.path : AppRoutes.root.path,
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
        child: const SplashPage(),
      ),
    ),
    GoRoute(
      path: AppRoutes.homeHadith.path,
      name: AppRoutes.homeHadith.name,
      pageBuilder: (context, state) {
        return PageRouteWithTransition.scaleTransation(child: const HadithHomePage());
      },
    ),
    GoRoute(
      path: AppRoutes.hadithsViewPage.path,
      name: AppRoutes.hadithsViewPage.name,
      pageBuilder: (context, state) {
        var hadithBooksEnum = HadithBooksEnumCodec().decoder.convert(state.extra as String);

        return PageRouteWithTransition.slideTTDTransation(
          child: BlocProvider(
            create: (context) => InjectionManager.instance.hadithViewCubit..init(hadithBooksEnum),
            child: HadithsViewPage(hadithBooksEnum: hadithBooksEnum),
          ),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.settingsPage.path,
      name: AppRoutes.settingsPage.name,
      pageBuilder: (context, state) {
        return PageRouteWithTransition.slideRTLTransation(child: const SettingsPage());
      },
    ),
    GoRoute(
      path: AppRoutes.favoritepage.path,
      name: AppRoutes.favoritepage.name,
      pageBuilder: (context, state) {
        return PageRouteWithTransition.slideRTLTransation(
          child: BlocProvider(
            create: (context) => InjectionManager.instance.favoriteCubit,
            child: const FavoritePage(),
          ),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.appDeveloperPage.path,
      name: AppRoutes.appDeveloperPage.name,
      pageBuilder: (context, state) {
        return PageRouteWithTransition.slideRTLTransation(
          child: BlocProvider(
            create: (context) => InjectionManager.instance.appDeveloperCubit,
            child: const AppDeveloperPage(),
          ),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.imamTarjama.path,
      name: AppRoutes.imamTarjama.name,
      pageBuilder: (context, state) {
        var hadithBooksEnum = HadithBooksEnumCodec().decoder.convert(state.extra as String);
        return PageRouteWithTransition.sizeBottomTransation(child: AutherPage(hadithBooksEnum: hadithBooksEnum));
      },
    ),
  ],
);
