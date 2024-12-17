import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/core.dart';
import '../../../../features.dart';

class HadithHomeSearchIcon extends StatelessWidget {
  const HadithHomeSearchIcon({super.key, required this.searchInFavoritePage});
  final bool searchInFavoritePage;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HadithHomeCubit, HadithHomeState>(
      builder: (context, state) {
        // if (state is HadithHomeLoading) {
        //   return Padding(
        //       padding: EdgeInsets.all(AppSizes.smallScreenPadding), child: const AppCircularProgressIndicator());
        // }
        return IconButton(
          // key: key,
          icon: AppIcons.search,
          color: context.themeColors.secondary,
          onPressed: () => _searchBtnPressed(context),
        );
      },
    );
  }

  Future<void> _searchBtnPressed(BuildContext context) async {
    if (searchInFavoritePage) {
      context.read<FavoriteCubit>().searchInFavorite();
    } else {
      await context.read<HadithHomeCubit>().searchBtnPressed();
    }
  }
}
