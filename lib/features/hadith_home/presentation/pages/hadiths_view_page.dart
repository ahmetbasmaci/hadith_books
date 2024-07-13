import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';
import 'package:hadith_books/features/hadith_home/hadith_home.dart';

import '../../../../core/widgets/animations/animations.dart';
import '../../../../core/widgets/components/app_back_btn.dart';

class HadithsViewPage extends StatelessWidget {
  const HadithsViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HadithViewCubit, HadithViewState>(
      builder: (context, state) {
        if (state is HadithViewError) {
          return Center(
            child: TextButton(
              child: const Text('Error!!, Try Again'),
              onPressed: () {
                // context.read<HadithViewCubit>().init(HadithBooksEnum.bukhari); //TODO change to state.extra
              },
            ),
          );
        }

        if (state is! HadithViewLoaded) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        var hadithBookEntity = state.hadithBookEntity;
        var chapterHadiths = hadithBookEntity.hadiths.where((x) => x.chapterId == state.selectedChapterId).toList();
        return Scaffold(
          appBar: AppBar(
            title: Text(getLocalBookTitle(context, hadithBookEntity)),
            actions: const [AppBackBtn()],
          ),
          drawer: Drawer(
            child: ListView.builder(
              itemCount: hadithBookEntity.chapters.length,
              itemBuilder: (context, index) {
                return ListTile(
                  selected: state.selectedChapterId == hadithBookEntity.chapters[index].id,
                  title: Text(
                    getChapterTitle(context, hadithBookEntity.chapters[index]),
                  ),
                  onTap: () => context.read<HadithViewCubit>().changeSelectedChapter(hadithBookEntity.chapters[index]),
                );
              },
            ),
          ),
          body: ListView.builder(
            itemCount: chapterHadiths.length,
            itemBuilder: (context, index) {
              var hadith = chapterHadiths[index];
              return AnimatedListItemDownToUp(
                index: index,
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('<<${hadith.id}>>'),
                          context.isArabicLang ? const SizedBox() : Text(hadith.english.narrator),
                        ],
                      ),
                      Text(getLocalHadithText(context, hadith)),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  String getLocalHadithText(BuildContext context, HadithEntity hadithEntity) {
    if (context.isArabicLang) {
      return hadithEntity.arabic;
    }
    return hadithEntity.english.text;
  }

  String getLocalBookTitle(BuildContext context, HadithBookEntity hadithBookEntity) {
    if (context.isArabicLang) {
      return hadithBookEntity.metadata.metadataDiscEntityAr.title;
    }

    return hadithBookEntity.metadata.metadataDiscEntityEn.title;
  }

  String getLocalBookAuther(BuildContext context, HadithBookEntity hadithBookEntity) {
    if (context.isArabicLang) {
      return hadithBookEntity.metadata.metadataDiscEntityAr.author;
    }

    return hadithBookEntity.metadata.metadataDiscEntityAr.author;
  }

  String getChapterTitle(BuildContext context, ChapterEntity chapterEntity) {
    if (context.isArabicLang) {
      return chapterEntity.arabic;
    }
    return chapterEntity.english;
  }
}
