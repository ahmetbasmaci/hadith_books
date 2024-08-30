import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/enums/hadith_books_enum.dart';

import '../../../../core/helpers/hadith_localization_helper.dart';
import '../../../../core/utils/resources/resources.dart';
import '../../../../core/widgets/components/buttons/app_search.dart';
import '../../../features.dart';

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
                _bookHeader(context,state),
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

    String leading = context.isArabicLang ? (index + 1).toArabicNumber : '${index + 1}';
    String title = HadithLocalizationHelper.getChapterTitle(state.hadithBookEntity.chapters[index]);
    String subtitle = HadithLocalizationHelper.getChapterHadithsCount(
      state.hadithBookEntity,
      state.hadithBookEntity.chapters[index].id,
    );

    return ListTile(
      selected: isItemSelected,
      textColor: context.themeColors.onBackground,
      leading: Text(leading, style: AppStyles.titleMeduimBold),
      title: Text(
        title,
        style: isItemSelected ? AppStyles.titleSmallBold : AppStyles.titleSmall,
      ),
      subtitle: Text(subtitle),
      trailing: IconButton(
        color: context.themeColors.primary,
        onPressed: () => AppSearch.showSearchInChapter(
          hadithBookEntity: state.hadithBookEntity,
          chapterId: state.hadithBookEntity.chapters[index].id,
        ),
        icon: AppIcons.search,
      ),
      onTap: () => context
          .read<HadithViewCubit>()
          .changeSelectedChapter(hadithBooksEnum, state.hadithBookEntity.chapters[index]),
    );
  }

  ListTile _bookHeader(BuildContext context,HadithViewLoaded state) {
    return ListTile(
      textColor: context.themeColors.onBackground,
      title: Text(HadithLocalizationHelper.getBookTitle(state.hadithBookEntity)),
      subtitle: Text(HadithLocalizationHelper.getBookAuther(state.hadithBookEntity)),
      leading: Image.asset(
          HadithBooksEnum.values.firstWhere((element) => element.bookId == state.hadithBookEntity.id).bookImage),
    );
  }
}
