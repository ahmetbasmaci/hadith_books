import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/core.dart';
import '../../../../features.dart';
import '../../../../search/presentation/widgets/seach_btn.dart';
import '../../../../settings/presentation/widgets/settings_btn.dart';

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
      title: Text(HadithLocalizationHelper.getBookName(hadithBookEntity)),
      actions: [
        Skeleton.shade(child: SearchBtn(hadithBookEntity)),
        const Skeleton.keep(child: HadithViewPopupButton(isInSearchPage: false)),
        const Skeleton.keep(child: SettingsBtn()),
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
