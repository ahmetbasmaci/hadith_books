import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/components/list_view/scrollable_positioned_list_view.dart';
import '../../../../features.dart';

class HadithViweBodyAllItems extends StatelessWidget {
  const HadithViweBodyAllItems({
    super.key,
    required this.hadithBookEntities,
  });
  final List<HadithBookEntity> hadithBookEntities;

  @override
  Widget build(BuildContext context) {
    final allHadiths = hadithBookEntities.expand((element) => element.hadiths).toList();
    final hadithViewCubit = context.read<HadithViewCubit>();

    return ScrollablePositionedListView(
      itemScrollController: hadithViewCubit.hadithItemScrollController,
      itemPositionsListener: hadithViewCubit.chapterItemPositionsListener,
      itemCount: allHadiths.length,
      itemBuilder: (context, index) {
        final hadith = allHadiths[index];
        final hadithBookEntity = hadithBookEntities.firstWhere((e) => e.id == hadith.bookId);
        return HadithCardItem(
          index: index,
          hadith: hadith,
          hadithBookEntity: hadithBookEntity,
          showBookTitle: true,
          isPageView: false,
        );
      },
    );
  }
}
