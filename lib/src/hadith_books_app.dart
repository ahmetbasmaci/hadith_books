import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/core.dart';
import 'package:hadith_books/src/app_router.dart';
import 'package:hadith_books/src/injection_manager.dart';

import '../config/local/l10n.dart';
import '../features/features.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class HadithBooksApp extends StatelessWidget {
  const HadithBooksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => InjectionManager.instance.searchCubit),
        BlocProvider(create: (context) => InjectionManager.instance.homePageScreensCubit),
        BlocProvider(create: (context) => InjectionManager.instance.hadithHomeCubit),
        BlocProvider(create: (context) => InjectionManager.instance.themeCubit..getSavedTheme()),
        BlocProvider(create: (context) => InjectionManager.instance.localeCubit..getSavedLocale()),
        BlocProvider(create: (context) => InjectionManager.instance.changeFontSizeSliderCubit..getSavedFontSize()),
        BlocProvider(
            create: (context) => InjectionManager.instance.changeHadithViewTypeCubit..getSavedHadithViewType()),
        BlocProvider(create: (context) => InjectionManager.instance.expandAllOptionCubit..getSavedHadithViewType()),
        BlocProvider(create: (context) => InjectionManager.instance.hadithSearchFilterCubit),
        BlocProvider(create: (context) => InjectionManager.instance.settingsCubit),
      ],
      child: _buildChild(),
    );
  }

  Widget _buildChild() {
    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, lcoaleState) => BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) => BlocConsumer<SearchCubit, SearchState>(
          listener: (context, searchState) {
            if (searchState is SearchErrorState) {
              ToatsHelper.showSnackBarError(searchState.message);
            }
          },
          builder: (context, searchState) => _materialWidget(lcoaleState, themeState),
        ),
      ),
    );
  }

  Widget _materialWidget(LocaleState lcoaleState, ThemeState themeState) {
    return MaterialApp.router(
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      locale: Locale(lcoaleState.locale),
      routerConfig: appRouter,
      localizationsDelegates: const [
        AppStrings.delegate,
        AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppStrings.delegate.supportedLocales,
      theme: themeState.theme,
      debugShowCheckedModeBanner: false,
    );
  }
}
