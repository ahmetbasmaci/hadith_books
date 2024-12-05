import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/enums/hadith_books_enum.dart';
import '../../../../../core/widgets/components/app_scrollbar.dart';
import '../../../../../core/widgets/components/list_view/scrollable_positioned_list_view.dart';
import '../../../../features.dart';

class DrawerChaptersPart extends StatelessWidget {
  const DrawerChaptersPart({
    super.key,
    required this.hadithBooksEnum,
    required this.hadithBookFullModel,
    required this.selectedChapterId,
  });
  final HadithBooksEnum hadithBooksEnum;
  final HadithBookFullModel hadithBookFullModel;
  final int selectedChapterId;
  @override
  Widget build(BuildContext context) {
    return AppScrollbar(
      controller: ScrollController(),
      child: ScrollablePositionedListView(
        itemScrollController: context.read<HadithViewCubit>().chapterItemScrollController,
        itemCount: hadithBookFullModel.hadithBook.chapters.length,
        itemBuilder: (context, index) {
          return HadithChapterListItem(
            hadithBooksEnum: hadithBooksEnum,
            hadithBookFullModel: hadithBookFullModel,
            selectedChapterId: selectedChapterId,
            index: index,
          );
        },
      ),
    );
  }
}
