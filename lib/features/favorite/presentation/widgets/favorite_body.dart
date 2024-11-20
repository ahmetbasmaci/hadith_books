import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/core.dart';
import '../../../features.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key, required this.filteredModels, required this.allHadithBookEntitys}) : searchText = '';
  const FavoriteBody.withSearchText(
      {super.key, required this.searchText, required this.filteredModels, required this.allHadithBookEntitys});
  final String searchText;
  final List<HadithEntity> filteredModels;
  final List<HadithBookEntity> allHadithBookEntitys;
  @override
  Widget build(BuildContext context) {
    return _zikrCards(context);
  }

  Widget _zikrCards(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<FavoriteCubit>().getFavoriteHadiths();
      },
      child: OpacityLayer(
        useTopOpacityContainer: true,
        useBottomOpacityContainer: false,
        child: AppScrollbar(
          controller: context.read<SettingsCubit>().scrollController,
          child: ListView.builder(
            controller: context.read<SettingsCubit>().scrollController,
            key: context.read<FavoriteCubit>().listKey,
            itemCount: filteredModels.length,
            // shrinkWrap: true,
            physics: const BouncingScrollPhysics(),

            itemBuilder: (context, i) {
              return HadithCardItem(
                index: i,
                hadith: filteredModels[i],
                hadithBookEntity: allHadithBookEntitys.firstWhere((element) => element.id == filteredModels[i].bookId),
                showBookTitle: true,
                searchText: searchText,
                afterFavoritePressed: (isFavorite) =>
                    context.read<FavoriteCubit>().removeItemFromList(filteredModels[i]),
                isPageView: false,
              );
            },
          ),
        ),
      ),
    );
  }
}
