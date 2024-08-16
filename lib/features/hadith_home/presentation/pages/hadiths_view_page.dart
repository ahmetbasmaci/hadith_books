import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/config/local/l10n.dart';
import 'package:hadith_books/features/hadith_home/presentation/widgets/hadith_view_body_part/hadith_viwe_body_all_items.dart';

import '../../../../core/enums/hadith_books_enum.dart';
import '../../../../core/helpers/hadith_localization_helper.dart';
import '../../../../core/utils/resources/resources.dart';
import '../../../../core/widgets/components/buttons/app_back_btn.dart';
import '../../../../core/widgets/components/my_appbar.dart';
import '../../../features.dart';
import '../widgets/hadith_view_body_part/hadith_view_body_search_in_book.dart';

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
          return _loadedWidget(context, state.hadithBookEntity);
        } else if (state is HadithViewError) {
          return _errorWidget(context);
        }
        return const SizedBox();
      },
    );
  }

  Widget _loadedWidget(BuildContext context, HadithBookEntity hadithBookEntity) {
    return Scaffold(
      appBar: MyAppbar(
        title: HadithLocalizationHelper.getBookTitle(hadithBookEntity),
        actions: [
          IconButton(
            onPressed: () => showSearch(
              context: context,
              delegate: AppSearchDelegate(
                child: (query) => HadithViewBodyPartSearchInBook(hadithBookEntity: hadithBookEntity, searchText: query),
              ),
            ),
            icon: AppIcons.search,
          ),
          const HadithViewPopupButton(),
          const AppBackBtn(),
        ],
      ),
      drawer: HadithViewDrawer(hadithBooksEnum: hadithBooksEnum),
      body: HadithViweBodyAllItems(hadithBookEntity: hadithBookEntity),
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
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
