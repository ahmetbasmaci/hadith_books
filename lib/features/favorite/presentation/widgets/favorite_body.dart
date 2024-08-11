import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/resources/resources.dart';
import '../../../../core/widgets/animations/animations.dart';
import '../../../../core/widgets/components/app_circular_progress_indicator.dart';
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
    if (searchText.isNotEmpty) context.read<FavoriteCubit>().getFilteredZikrModels(searchText);
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteLoadedState) {
          return _zikrCards(context, state.favoriteZikrModels);
        } else if (state is FavoriteErrorState) {
          return Center(child: Center(child: Text(state.message, style: AppStyles.normal)));
        } else //init and loading
        {
          return const AppCircularProgressIndicator();
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
              return const AppCircularProgressIndicator();
            }

            List<HadithBookEntity> allHadithBookEntitys = snapshot.data as List<HadithBookEntity>;
            List<Widget> cards = filteredModels
                .map((hadith) => HadithCardItem(
                      hadith: hadith,
                      hadithBookEntity: allHadithBookEntitys.firstWhere((element) => element.id == hadith.bookId),
                    ))
                .toList();
            return ListView.builder(
              key: context.read<FavoriteCubit>().listKey,
              itemCount: cards.length,
              // shrinkWrap: true,
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              itemBuilder: (context, index) {
                return AnimatedListItemUpToDown(
                  index: index,
                  slideDuration: const Duration(milliseconds: 0),
                  staggerDuration: const Duration(milliseconds: 0),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: AppSizes.screenPadding,
                      right: AppSizes.screenPadding,
                      top: index == 0 ? AppSizes.screenPadding : 0,
                      bottom: index == cards.length - 1 ? AppSizes.screenPadding : 0,
                    ),
                    child: cards[index],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
