import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/config/local/l10n.dart';
import 'package:hadith_books/core/enums/hadith_books_enum.dart';
import 'package:hadith_books/core/utils/resources/app_sizes.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';
import '../../../../core/widgets/components/app_circular_progress_indicator.dart';
import '../../../../core/widgets/components/app_scrollbar.dart';
import '../../../../core/widgets/components/my_appbar.dart';
import '../../../features.dart';

class HadithHomePage extends StatelessWidget {
  const HadithHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        title: AppStrings.of(context).hadithBooks,
        actions: [_searchIcon()],
      ),
      drawer: const HadithHomeDrawer(),
      body: _body(context),
    );
  }

  Widget _searchIcon() {
    return BlocBuilder<HadithHomeCubit, HadithHomeState>(
      builder: (context, state) {
        if (state is HadithHomeLoading) {
          return Padding(
              padding: EdgeInsets.all(AppSizes.smallScreenPadding), child: const AppCircularProgressIndicator());
        }
        return IconButton(
          icon: const Icon(Icons.search),
          onPressed: () => context.read<HadithHomeCubit>().searchInHoleBooks(context),
        );
      },
    );
  }

  Padding _body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: AppSizes.smallSpace, right: AppSizes.smallSpace, bottom: AppSizes.smallSpace),
      child: AppScrollbar(
        controller: context.read<HadithHomeCubit>().scrollController,
        child: GridView.builder(
          controller: context.read<HadithHomeCubit>().scrollController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: AppSizes.smallSpace,
            mainAxisSpacing: AppSizes.smallSpace,
          ),
          physics: const BouncingScrollPhysics(),
          itemCount: HadithBooksEnum.values.length,
          itemBuilder: (context, index) {
            return HadithBookItemBtn(hadithBooksEnum: HadithBooksEnum.values[index]);
          },
        ),
      ),
    );
  }
}
