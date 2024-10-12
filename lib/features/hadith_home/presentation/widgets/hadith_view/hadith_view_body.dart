import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/features/hadith_home/presentation/widgets/hadith_view/body_scrollable/hadith_view_body_cards.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/core.dart';
import '../../../../../core/enums/hadith_view_type_enum.dart';
import '../../../../change_hadith_view_type_cubit/cubit/change_hadith_view_type_cubit.dart';
import '../../../../features.dart';
import 'body_list_view/hadith_view_body_page_view.dart';

class HadithViewBody extends StatelessWidget {
  const HadithViewBody({
    super.key,
    required this.hadithBooksEnum,
    required this.hadithBookEntity,
    required this.chapterId,
    required this.isTempData,
  });
  final HadithBooksEnum hadithBooksEnum;
  final HadithBookEntity hadithBookEntity;
  final int chapterId;
  final bool isTempData;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: Text(HadithLocalizationHelper.getBookTitle(hadithBookEntity)),
      actions: [
        Skeleton.shade(
          child: IconButton(
            onPressed: () => AppSearch.showSearchInBook(hadithBookEntity: hadithBookEntity),
            icon: AppIcons.search,
          ),
        ),
        const Skeleton.keep(child: HadithViewPopupButton()),
        const Skeleton.keep(child: AppBackBtn()),
      ],
      drawer: Skeleton.shade(child: HadithViewDrawer(hadithBooksEnum: hadithBooksEnum)),
      body: BlocBuilder<ChangeHadithViewTypeCubit, ChangeHadithViewTypeState>(
        builder: (context, state) {
          return state.hadithViewTypeEnum == HadithViewTypeEnum.scrolllable
              ? HadithViewBodyCards(
                  isTempData: isTempData,
                  hadithBookEntity: hadithBookEntity,
                  chapterId: chapterId,
                )
              : HadithViewBodyPageView(
                  isTempData: isTempData,
                  hadithBookEntity: hadithBookEntity,
                  chapterId: chapterId,
                );
        },
      ),
      useSliver: false,
    );
  }
}
