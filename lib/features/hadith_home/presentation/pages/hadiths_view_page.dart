import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';

import '../../../../core/helpers/hadith_localization_helper.dart';
import '../../../../core/widgets/animations/animations.dart';
import '../../../../core/widgets/components/buttons/app_back_btn.dart';
import '../../../features.dart';

class HadithsViewPage extends StatelessWidget {
  const HadithsViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HadithViewCubit, HadithViewState>(
      builder: (context, state) {
        if (state is HadithViewError) {
          return _errorWidget();
        }

        if (state is! HadithViewLoaded) {
          return _loadingWidget();
        }

        var chapterHadiths = state.hadithBookEntity.hadiths
            .where(
              (x) => x.chapterId == state.selectedChapterId,
            )
            .toList();
        return _loadedWidget(context, state.hadithBookEntity, chapterHadiths);
      },
    );
  }

  Widget _loadedWidget(BuildContext context, HadithBookEntity hadithBookEntity, List<HadithEntity> chapterHadiths) {
    return Scaffold(
      appBar: AppBar(
        title: Text(HadithLocalizationHelper.getBookTitle(hadithBookEntity)),
        actions: const [AppBackBtn()],
      ),
      drawer: const HadithViewDrawer(),
      body: Scrollbar(
        thickness: 10,
        child: ListView.builder(
          controller: context.read<HadithViewCubit>().scrollController,
          itemCount: chapterHadiths.length,
          itemBuilder: (context, index) {
            var hadith = chapterHadiths[index];
            return Padding(
              padding: EdgeInsets.only(
                left: AppSizes.screenPadding,
                right: AppSizes.screenPadding,
                top: AppSizes.screenPadding,
              ),
              child: AnimatedListItemUpToDown(
                index: index,
                slideDuration: const Duration(milliseconds: 0),
                staggerDuration: const Duration(milliseconds: 0),
                child: HadithCardItem(hadith: hadith),
              ),
            );
          },
        ),
      ),
    );
  }

  Center _errorWidget() {
    return Center(
      child: TextButton(
        child: const Text('Error!!, Try Again'),
        onPressed: () {
          // context.read<HadithViewCubit>().init(HadithBooksEnum.bukhari); //TODO change to state.extra
        },
      ),
    );
  }

  Widget _loadingWidget() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
