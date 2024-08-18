import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/widgets/components/app_scrollbar.dart';

import '../../../../features.dart';

class HadithViweBodyChapterItems extends StatelessWidget {
  const HadithViweBodyChapterItems({super.key, required this.hadithBookEntity, required this.chapterId});
  final HadithBookEntity hadithBookEntity;
  final int chapterId;
  @override
  Widget build(BuildContext context) {
    var hadiths = hadithBookEntity.hadiths.where((element) => element.chapterId == chapterId).toList();
    return AppScrollbar(
      controller: context.read<HadithViewCubit>().scrollController,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        controller: context.read<HadithViewCubit>().scrollController,
        itemCount: hadiths.length + 1,
        itemBuilder: (context, index) {
          if (index == hadiths.length) {
            return const LoadedAllResultWidget();
          }
          var hadith = hadiths[index];
          return HadithCardItem(index: index, hadith: hadith, hadithBookEntity: hadithBookEntity);
        },
      ),
    );
  }
}
