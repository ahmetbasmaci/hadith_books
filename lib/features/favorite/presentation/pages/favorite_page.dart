import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/config/local/l10n.dart';
import '../../../../core/core.dart';
import '../../../features.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteState>(
      listener: (context, state) {
        if (state is FavoriteErrorState) {
          ToatsHelper.showSnackBarError(state.message);
        }
      },
      builder: (context, state) {
        return AppScaffold(
          title: AppStrings.of(context).favorite,
          actions: _actions(context),
          leading: const SizedBox(),
          body: const FavoriteBody(),
          useSliver: false,
        );
      },
    );
  }

  List<Widget> _actions(BuildContext context) {
    return [
      // IconButton(
      //   icon: AppIcons.filter,
      //   onPressed: () => FavoriteSearchModelBottomSheet.show(context),
      // ),
      IconButton(
        icon: AppIcons.search,
        onPressed: () => AppSearch.showSearchInFavorite(),
      ),
      const HadithViewPopupButton(),
      const AppBackBtn(),
    ];
  }
}
