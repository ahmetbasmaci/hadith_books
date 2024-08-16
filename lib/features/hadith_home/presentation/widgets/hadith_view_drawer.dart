import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/enums/hadith_books_enum.dart';

import '../../../../core/helpers/hadith_localization_helper.dart';
import '../../../../core/utils/resources/resources.dart';
import '../../../features.dart';
import 'hadith_view_body_part/hadith_view_body_search_in_chapter.dart';

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
        physics: const BouncingScrollPhysics(),
        itemCount: state.hadithBookEntity.chapters.length,
        itemBuilder: (context, index) {
          return _chapterListTile(state, index, context);
        },
      ),
    );
  }

  ListTile _chapterListTile(HadithViewLoaded state, int index, BuildContext context) {
    bool isItemSelected = state.selectedChapterId == state.hadithBookEntity.chapters[index].id;
    return ListTile(
      selected: isItemSelected,
      textColor: AppConstants.context.themeColors.onBackground,
      title: Text(
        HadithLocalizationHelper.getChapterTitle(state.hadithBookEntity.chapters[index]),
        style: isItemSelected ? AppStyles.titleSmallBold : AppStyles.titleSmall,
      ),
      subtitle: Text(HadithLocalizationHelper.getChapterHadithsCount(
          state.hadithBookEntity, state.hadithBookEntity.chapters[index].id)),
      trailing: IconButton(
        color: context.themeColors.primary,
        onPressed: () => showSearch(
          context: context,
          delegate: AppSearchDelegate(
            child: (query) => HadithViewBodyPartSearchInChapter(
              hadithBookEntity: state.hadithBookEntity,
              searchText: query,
              chapterId: state.hadithBookEntity.chapters[index].id,
            ),
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
      textColor: AppConstants.context.themeColors.onBackground,
      title: Text(HadithLocalizationHelper.getBookTitle(state.hadithBookEntity)),
      subtitle: Text(HadithLocalizationHelper.getBookAuther(state.hadithBookEntity)),
      leading: Image.asset(
          HadithBooksEnum.values.firstWhere((element) => element.bookId == state.hadithBookEntity.id).bookImage),
    );
  }
}
