import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/core.dart';
import '../../../features.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key}) : searchText = '';
  const FavoriteBody.withSearchText({super.key, required this.searchText});
  final String searchText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FavoriteSelectZikrType(),
        _savedDataCards(context),
      ],
    );
  }

  Widget _savedDataCards(BuildContext context) {
    if (searchText.isNotEmpty) {
      context.read<FavoriteCubit>().getFilteredZikrModels(searchText);
    }
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteLoadedState) {
          return _zikrCards(context, state.favoriteZikrModels);
        } else if (state is FavoriteErrorState) {
          return Center(child: Center(child: Text(state.message, style: AppStyles.normal)));
        } else //init and loading
        {
          return const AppWaitDialog();
        }
      },
    );
  }

  Widget _zikrCards(BuildContext context, List<HadithEntity> filteredModels) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          await context.read<FavoriteCubit>().getAllSavedData();
        },
        child: FutureBuilder(
          future: context.read<HadithHomeCubit>().getAllHadithsBooks(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const AppWaitDialog();
            }

            List<Widget> cards = _getCards(snapshot.data as List<HadithBookEntity>, filteredModels);

            return AppScrollbar(
              controller: context.read<SettingsCubit>().scrollController,
              child: ListView.builder(
                controller: context.read<SettingsCubit>().scrollController,
                key: context.read<FavoriteCubit>().listKey,
                itemCount: cards.length ,
                // shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                 
                  return cards[index];
                },
              ),
            );
          },
        ),
      ),
    );
  }

  List<Widget> _getCards(List<HadithBookEntity> allHadithBookEntitys, List<HadithEntity> filteredModels) {
    List<Widget> cards = [];
    for (var i = 0; i < filteredModels.length; i++) {
      cards.add(
        HadithCardItem(
          index: i,
          hadith: filteredModels[i],
          hadithBookEntity: allHadithBookEntitys.firstWhere((element) => element.id == filteredModels[i].bookId),
          showBookTitle: true,
          searchText: searchText,
        ),
      );
    }
    return cards;
  }
}
