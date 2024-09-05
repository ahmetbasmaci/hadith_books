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
    List<HadithEntity> allHadiths = [];
    for (var element in hadithBookEntities) {
      allHadiths.addAll(element.hadiths);
    }

    return ScrollablePositionedListView(
      itemScrollController: context.read<HadithViewCubit>().hadithItemScrollController,
      itemPositionsListener: context.read<HadithViewCubit>().chapterItemPositionsListener,
      itemCount: allHadiths.length ,
      itemBuilder: (context, index) {
     
        var hadith = allHadiths[index];
        return HadithCardItem(
          index: index,
          hadith: hadith,
          hadithBookEntity: hadithBookEntities.firstWhere((e) => e.id == hadith.bookId),
          showBookTitle: true,
        );
      },
    );
  }
}
