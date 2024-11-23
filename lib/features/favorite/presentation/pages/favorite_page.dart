import 'package:flutter/material.dart';
import '../../../../core/core.dart';
import '../../../features.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const FavoriteBodyWithLoading();
  }

  List<Widget> _actions(BuildContext context) {
    return [
      const FavoriteSelectZikrType(),
      IconButton(
        color: context.themeColors.secondary,
        icon: AppIcons.search,
        onPressed: () => AppSearch.showSearchInFavorite(),
      ),
      const HadithViewPopupButton(isInSearchPage: false),
      const AppBackBtn(),
    ];
  }
}
