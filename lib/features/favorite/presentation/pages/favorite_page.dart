import 'package:flutter/material.dart';
import 'package:hadith_books/config/local/l10n.dart';
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
        icon: AppIcons.search,
        onPressed: () => AppSearch.showSearchInFavorite(),
      ),
      const HadithViewPopupButton(isInSearchPage: false),
      const AppBackBtn(),
    ];
  }
}
