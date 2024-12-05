import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

class FavoriteBodyWithLoading extends StatelessWidget {
  const FavoriteBodyWithLoading({super.key}) : searchText = '';
  const FavoriteBodyWithLoading.withSearchText({super.key, required this.searchText});
  final String searchText;

  @override
  Widget build(BuildContext context) {
    if (searchText.isNotEmpty) {
      context.read<FavoriteCubit>().getFilteredZikrModelsForSearch(searchText);
    }
    return FutureBuilder(
      future: _getData(context),
      builder: (context, snapshot) {
        return BlocConsumer<FavoriteCubit, FavoriteState>(
          listener: (context, state) {
            if (state is FavoriteErrorState) {
              ToatsHelper.error(state.message);
            }
          },
          builder: (context, state) {
            bool loaded = state is FavoriteLoadedState && snapshot.hasData;
            var filteredModels = loaded ? state.favoriteZikrModels : <HadithEntity>[];
            var allHadithBookEntitys = loaded ? snapshot.data as List<HadithBookEntity> : <HadithBookEntity>[];

            if (state is FavoriteErrorState) {
              return Center(child: Center(child: Text(state.message, style: AppStyles.normal)));
            }

            return HadithViewLoadingWidget(
                isLoading: !loaded,
                child: !loaded
                    ? const HadithViewTempDataListCards()
                    : searchText.isEmpty
                        ? FavoriteBody(filteredModels: filteredModels, allHadithBookEntitys: allHadithBookEntitys)
                        : FavoriteBody.withSearchText(
                            filteredModels: filteredModels,
                            allHadithBookEntitys: allHadithBookEntitys,
                            searchText: searchText));
          },
        );
      },
    );
  }

  Future<List<HadithBookEntity>> _getData(BuildContext context) async {
    final hadithHomeCubit = context.read<HadithHomeCubit>();
    final favoriteCubit = context.read<FavoriteCubit>();

    var selectedHadithBookEnums = await favoriteCubit.getSelectedFavoriteHadithsEnums();
    List<HadithBookEntity> allHadithBookEntitys = await hadithHomeCubit.getHadithBooks(selectedHadithBookEnums);

    await favoriteCubit.updateSavedData();

    return allHadithBookEntitys;
  }
}
