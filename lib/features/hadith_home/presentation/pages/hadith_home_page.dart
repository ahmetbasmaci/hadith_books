import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/config/local/l10n.dart';
import 'package:hadith_books/core/enums/hadith_books_enum.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';
import '../../../../core/widgets/components/app_circular_progress_indicator.dart';
import '../../../../core/widgets/components/app_scrollbar.dart';
import '../../../../core/widgets/components/my_appbar.dart';
import '../../../features.dart';
import '../widgets/hadith_view_body_part/hadith_view_body_search_in_all_books.dart';

class HadithHomePage extends StatelessWidget {
  const HadithHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        title: AppStrings.of(context).hadithBooks,
        actions: [
          BlocBuilder<HadithHomeCubit, HadithHomeState>(
            builder: (context, state) {
              if (state is HadithHomeLoading) {
                return const Padding(padding: EdgeInsets.all(8.0), child: AppCircularProgressIndicator());
              }
              return IconButton(
                icon: const Icon(Icons.search),
                onPressed: () => _seachIconPressed(context),
              );
            },
          ),
        ],
      ),
      drawer: const HadithHomeDrawer(),
      body: _body(context),
    );
  }

  Padding _body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.screenPadding),
      child: AppScrollbar(
        controller: context.read<HadithHomeCubit>().scrollController,
        child: GridView.builder(
          controller: context.read<HadithHomeCubit>().scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          physics: const BouncingScrollPhysics(),
          itemCount: HadithBooksEnum.values.length,
          itemBuilder: (context, index) {
            return BlocBuilder<HadithHomeCubit, HadithHomeState>(
              builder: (context, state) {
                // return AnimatedListItemUpToDown(
                //   staggerDuration: const Duration(milliseconds: 5),
                //   index: index,
                //   child: HadithBookItem(hadithBooksEnum: HadithBooksEnum.values[index]),
                // );
                return HadithBookItem(hadithBooksEnum: HadithBooksEnum.values[index]);
              },
            );
          },
        ),
      ),
    );
  }

  void _seachIconPressed(BuildContext context) async {
    List<HadithBookEntity> allHadithBookEntitys = await context.read<HadithHomeCubit>().getAllHadithsBooks();
    await showSearch(
      context: context,
      delegate: AppSearchDelegate(
        child: (query) =>
            HadithViewBodyPartSearchInAllBooks(allHadithBookEntitys: allHadithBookEntitys, searchText: query),
      ),
    );
  }
}
