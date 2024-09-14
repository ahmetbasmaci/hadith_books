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
    List<Widget> cards = _getCards(context);
    return RefreshIndicator(
        onRefresh: () async {
          await context.read<FavoriteCubit>().getFavoriteHadiths();
        },
        child: AppScrollbar(
          controller: context.read<SettingsCubit>().scrollController,
          child: ListView.builder(
            controller: context.read<SettingsCubit>().scrollController,
            key: context.read<FavoriteCubit>().listKey,
            itemCount: cards.length,
            // shrinkWrap: true,
            physics: const BouncingScrollPhysics(),

            itemBuilder: (context, index) {
              return cards[index];
            },
          ),
        ));
  }

  List<Widget> _getCards(BuildContext context) {
    List<Widget> cards = [];
    for (var i = 0; i < filteredModels.length; i++) {
      cards.add(
        HadithCardItem(
          index: i,
          hadith: filteredModels[i],
          hadithBookEntity: allHadithBookEntitys.firstWhere((element) => element.id == filteredModels[i].bookId),
          showBookTitle: true,
          searchText: searchText,
          afterFavoritePressed: (isFavorite) => context.read<FavoriteCubit>().removeItemFromList(filteredModels[i]),
        ),
      );
    }
    return cards;
  }
}
