import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/config/local/l10n.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';

import '../../../../core/helpers/hadith_localization_helper.dart';
import '../../../../core/widgets/animations/animations.dart';
import '../../../../core/widgets/components/app_scrollbar.dart';
import '../../../../core/widgets/components/buttons/app_back_btn.dart';
import '../../../features.dart';

class HadithsViewPage extends StatelessWidget {
  const HadithsViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HadithViewCubit, HadithViewState>(
      builder: (context, state) {
        if (state is HadithViewError) {
          return _errorWidget(context);
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
      body: AppScrollbar(
        controller: context.read<HadithViewCubit>().scrollController,
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

  Center _errorWidget(BuildContext context) {
    return Center(
      child: TextButton(
        child: Text(AppStrings.of(context).errorTryAgain),
        onPressed: () {
          context.read<HadithViewCubit>().init(context.read<HadithViewCubit>().hadithBooksEnum);
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
