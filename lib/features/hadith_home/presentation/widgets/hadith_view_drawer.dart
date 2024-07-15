import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/enums/hadith_books_enum.dart';

import '../../../../core/helpers/hadith_localization_helper.dart';
import '../../hadith_home.dart';

class HadithViewDrawer extends StatelessWidget {
  const HadithViewDrawer({super.key});

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
                ListTile(
                  title: Text(HadithLocalizationHelper.getBookTitle(state.hadithBookEntity)),
                  subtitle: Text(HadithLocalizationHelper.getBookAuther(state.hadithBookEntity)),
                  leading: Image.asset(HadithBooksEnum.values
                      .firstWhere((element) => element.bookId == state.hadithBookEntity.id)
                      .bookImage),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.hadithBookEntity.chapters.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        selected: state.selectedChapterId == state.hadithBookEntity.chapters[index].id,
                        title: Text(
                          HadithLocalizationHelper.getChapterTitle(state.hadithBookEntity.chapters[index]),
                        ),
                        onTap: () => context
                            .read<HadithViewCubit>()
                            .changeSelectedChapter(state.hadithBookEntity.chapters[index]),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
