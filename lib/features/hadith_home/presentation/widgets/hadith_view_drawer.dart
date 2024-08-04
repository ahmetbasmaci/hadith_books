import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/enums/hadith_books_enum.dart';

import '../../../../core/helpers/hadith_localization_helper.dart';
import '../../../../core/utils/resources/resources.dart';
import '../../../features.dart';
import 'hadith_view_body_part.dart';

class HadithViewDrawer extends StatelessWidget {
  const HadithViewDrawer({super.key, required this.hadithBooksEnum});
  final HadithBooksEnum hadithBooksEnum;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BlocBuilder<HadithViewCubit, HadithViewState>(
        builder: (context, state) {
          if (state is! HadithViewLoaded) {
            return const Scaffold(body: SizedBox());
          }

          return SafeArea(
            child: Column(
              children: [
                _bookHeader(state),
                _chapters(state),
              ],
            ),
          );
        },
      ),
    );
  }

  Expanded _chapters(HadithViewLoaded state) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: state.hadithBookEntity.chapters.length,
        itemBuilder: (context, index) {
          return _chapterListTile(state, index, context);
        },
      ),
    );
  }

  ListTile _chapterListTile(HadithViewLoaded state, int index, BuildContext context) {
    return ListTile(
      selected: state.selectedChapterId == state.hadithBookEntity.chapters[index].id,
      title: Text(
        HadithLocalizationHelper.getChapterTitle(state.hadithBookEntity.chapters[index]),
      ),
      trailing: IconButton(
        color: context.themeColors.primary,
        onPressed: () => showSearch(
          context: context,
          delegate: AppSearchDelegate(
            child: (query) => HadithViewBodyPart.withSearchTextInChapter(
                chapterHadiths: state.hadithBookEntity.hadiths
                    .where((x) => x.chapterId == state.hadithBookEntity.chapters[index].id)
                    .toList(),
                searchText: query),
          ),
        ),
        icon: AppIcons.search,
      ),
      onTap: () => context
          .read<HadithViewCubit>()
          .changeSelectedChapter(hadithBooksEnum, state.hadithBookEntity.chapters[index]),
    );
  }

  ListTile _bookHeader(HadithViewLoaded state) {
    return ListTile(
      title: Text(HadithLocalizationHelper.getBookTitle(state.hadithBookEntity)),
      subtitle: Text(HadithLocalizationHelper.getBookAuther(state.hadithBookEntity)),
      leading: Image.asset(
          HadithBooksEnum.values.firstWhere((element) => element.bookId == state.hadithBookEntity.id).bookImage),
    );
  }
}
