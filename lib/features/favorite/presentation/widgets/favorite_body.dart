import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/core.dart';
import '../../../features.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key, required this.hadithBookEntities});

  final List<HadithBookEntity> hadithBookEntities;
  @override
  Widget build(BuildContext context) {
    return _zikrCards(context);
  }

  Widget _zikrCards(BuildContext context) {
    var hadiths = hadithBookEntities.expand((element) => element.hadiths).toList();
    return OpacityLayer(
      useTopOpacityContainer: true,
      useBottomOpacityContainer: false,
      child: AppScrollbar(
        controller: context.read<SettingsCubit>().scrollController,
        child: ListView.builder(
          controller: context.read<SettingsCubit>().scrollController,
          key: context.read<FavoriteCubit>().listKey,
          itemCount: hadiths.length,
          // shrinkWrap: true,
          physics: const BouncingScrollPhysics(),

          itemBuilder: (context, i) {
            var hadith = hadiths[i];
            var hadithBoolEntity = hadithBookEntities.firstWhere((element) => element.id == hadith.bookId);
            return HadithCardItem(
              index: i,
              hadith: hadiths[i],
              hadithBookEntity: hadithBoolEntity,
              showBookTitle: true,
              afterFavoritePressed: (isFavorite) => context.read<FavoriteCubit>().removeItemFromList(hadith),
              isPageView: false,
            );
          },
        ),
      ),
    );
  }
}
