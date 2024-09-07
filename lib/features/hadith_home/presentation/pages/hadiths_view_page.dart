import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/config/local/l10n.dart';

import '../../../../core/core.dart';
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
          return _loadedWidget(context, state.hadithBookEntity, state.selectedChapterId);
        } else if (state is HadithViewError) {
          return _errorWidget(context);
        }
        return const SizedBox();
      },
    );
  }

  Widget _loadedWidget(BuildContext context, HadithBookEntity hadithBookEntity, int chapterId) {
    return AppScaffold(
      title: HadithLocalizationHelper.getBookTitle(hadithBookEntity),
      actions: [
        IconButton(
          onPressed: () => AppSearch.showSearchInBook(hadithBookEntity: hadithBookEntity),
          icon: AppIcons.search,
        ),
        const HadithViewPopupButton(),
        const AppBackBtn(),
      ],
      drawer: HadithViewDrawer(hadithBooksEnum: hadithBooksEnum),
      body: HadithViweBodyChapterItems(hadithBookEntity: hadithBookEntity, chapterId: chapterId),
      useSliver: false,
    );
  }

  Center _errorWidget(BuildContext context) {
    return Center(
      child: TextButton(
        child: Text(AppStrings.of(context).errorTryAgain, style: AppStyles.normal),
        onPressed: () {
          context.read<HadithViewCubit>().init(hadithBooksEnum);
        },
      ),
    );
  }

  Widget _loadingWidget() {
    return const AppScaffold(useSliver: false, body: AppWaitDialog());
  }
}
