import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/config/local/l10n.dart';
import 'package:hadith_books/core/widgets/components/buttons/app_back_btn.dart';
import 'package:hadith_books/core/widgets/components/buttons/app_search.dart';

import '../../../../core/helpers/toats_helper.dart';
import '../../../../core/utils/resources/resources.dart';
import '../../../../core/widgets/components/bottom_sheets/favorite_search_model_bottom_sheet.dart';
import '../../../../core/widgets/components/my_appbar.dart';
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
        return Scaffold(
          appBar: MyAppbar(
            title: AppStrings.of(context).favorite,
            actions: _actions(context),
            leading: const SizedBox(),
          ),
          body: const FavoriteBody(),
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
