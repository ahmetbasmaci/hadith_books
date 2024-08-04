import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/config/local/l10n.dart';

import '../../../../core/helpers/toats_helper.dart';
import '../../../../core/utils/resources/resources.dart';
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
          appBar: AppBar(
            title: Text(AppStrings.of(context).favorite),
            actions: _actions(context),
          ),
          body: const FavoriteBody(),
        );
      },
    );
  }

  List<Widget> _actions(BuildContext context) {
    return [
      IconButton(
        icon: AppIcons.search,
        onPressed: () => showSearch(
          context: context,
          delegate: AppSearchDelegate(
            child: (query) => FavoriteBody.withSearchText(searchText: query),
          ),
        ),
      ),
    ];
  }
}
