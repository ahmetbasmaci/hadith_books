import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/config/local/l10n.dart';
import 'package:hadith_books/core/core.dart';
import 'package:hadith_books/src/injection_manager.dart';

import '../../../features.dart';

class AppSearchDelegate extends SearchDelegate {
  AppSearchDelegate({required this.child});

  final Widget Function(String query) child;

  Widget? _searchedBody;

  @override
  String get searchFieldLabel => AppStrings.of(AppConstants.context).search;

  @override
  ThemeData appBarTheme(BuildContext context) => Theme.of(context).copyWith(
        scaffoldBackgroundColor: context.themeColors.background,
        iconTheme: IconThemeData(color: context.themeColors.primary, size: AppSizes.smallIcon),
        appBarTheme: AppBarTheme(
          color: context.themeColors.background,
          iconTheme: IconThemeData(color: context.themeColors.primary),
          titleTextStyle: TextStyle(color: context.themeColors.primary),
          toolbarTextStyle: TextStyle(color: context.themeColors.primary),
        ),
        textTheme: TextTheme(
          bodySmall: TextStyle(color: context.themeColors.onBackground),
          bodyMedium: AppStyles.normal.copyWith(color: context.themeColors.onBackground),
          bodyLarge: TextStyle(color: context.themeColors.onBackground),
          titleSmall: TextStyle(color: context.themeColors.onBackground),
          titleMedium: TextStyle(color: context.themeColors.onBackground), //dropdown
          titleLarge: TextStyle(color: context.themeColors.onBackground), //search text
          displaySmall: TextStyle(color: context.themeColors.onBackground),
          displayMedium: TextStyle(color: context.themeColors.onBackground),
          displayLarge: TextStyle(color: context.themeColors.onBackground),
          headlineSmall: TextStyle(color: context.themeColors.onBackground),
          headlineMedium: TextStyle(color: context.themeColors.onBackground),
          headlineLarge: TextStyle(color: context.themeColors.onBackground),
          labelSmall: TextStyle(color: context.themeColors.onBackground),
          labelMedium: TextStyle(color: context.themeColors.onBackground),
          labelLarge: TextStyle(color: context.themeColors.onBackground),
        ),
        textSelectionTheme: TextSelectionThemeData(cursorColor: context.themeColors.primary),
        inputDecorationTheme: const InputDecorationTheme(focusedBorder: InputBorder.none, border: InputBorder.none),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            iconSize: WidgetStateProperty.all<double>(AppSizes.smallIcon),
            foregroundColor: WidgetStateProperty.all<Color>(context.themeColors.primary),
          ),
        ),
      );

  @override
  List<Widget>? buildActions(BuildContext context) => [
        // if (fromFavoritePage) const FavoriteSelectZikrType(),
        IconButton(
          icon: AppIcons.search,
          onPressed: () => showResults(context),
        ),
        const HadithViewPopupButton(),
        IconButton(
          icon: AppIcons.backBtn,
          onPressed: () => close(context, null),
        ),
      ];

  @override //back button
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AppIcons.close,
      onPressed: () => query = '',
      key: UniqueKey(),
    );
  }

  @override
  Widget buildResults(BuildContext context) => _body(context: context, sendQuery: true);

  @override
  Widget buildSuggestions(BuildContext context) => _body(context: context, sendQuery: false);

  Widget _body({required BuildContext context, required bool sendQuery}) {
    if (sendQuery) {
      _searchedBody = child(query);
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => InjectionManager.instance.favoriteCubit),
        BlocProvider(create: (context) => InjectionManager.instance.hadithViewCubit),
      ],
      child: Container(
        color: context.theme.scaffoldBackgroundColor,
        child: _searchedBody ?? child(''),
      ),
    );
  }
}
