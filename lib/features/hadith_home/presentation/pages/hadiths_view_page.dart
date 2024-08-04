import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/config/local/l10n.dart';

import '../../../../core/enums/hadith_books_enum.dart';
import '../../../../core/helpers/hadith_localization_helper.dart';
import '../../../../core/utils/resources/resources.dart';
import '../../../../core/widgets/components/buttons/app_back_btn.dart';
import '../../../features.dart';

class HadithsViewPage extends StatelessWidget {
  const HadithsViewPage({super.key, required this.hadithBooksEnum});
  final HadithBooksEnum hadithBooksEnum;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HadithViewCubit, HadithViewState>(
      builder: (context, state) {
        if (state is HadithViewInitial) {
          context.read<HadithViewCubit>().init(hadithBooksEnum);
          return _loadingWidget();
        } else if (state is HadithViewLoading) {
          return _loadingWidget();
        } else if (state is HadithViewLoaded) {
          var chapterHadiths = state.hadithBookEntity.hadiths
              .where(
                (x) => x.chapterId == state.selectedChapterId,
              )
              .toList();
          return _loadedWidget(context, state.hadithBookEntity, chapterHadiths);
        } else if (state is HadithViewError) {
          return _errorWidget(context);
        }
        return const SizedBox();
      },
    );
  }

  Widget _loadedWidget(BuildContext context, HadithBookEntity hadithBookEntity, List<HadithEntity> chapterHadiths) {
    return Scaffold(
      appBar: AppBar(
        title: Text(HadithLocalizationHelper.getBookTitle(hadithBookEntity)),
        actions: [
          IconButton(
            onPressed: () => showSearch(
              context: context,
              delegate: AppSearchDelegate(
                child: (query) =>
                    HadithViewBodyPart.withSearchTextHoleBook(hadithBookEntity: hadithBookEntity, searchText: query),
              ),
            ),
            icon: AppIcons.search,
          ),
          const AppBackBtn(),
        ],
      ),
      drawer: HadithViewDrawer(hadithBooksEnum: hadithBooksEnum),
      body: HadithViewBodyPart(chapterHadiths: chapterHadiths),
    );
  }

  Center _errorWidget(BuildContext context) {
    return Center(
      child: TextButton(
        child: Text(AppStrings.of(context).errorTryAgain),
        onPressed: () {
          context.read<HadithViewCubit>().init(hadithBooksEnum);
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
