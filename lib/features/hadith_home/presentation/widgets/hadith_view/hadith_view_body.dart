import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/core.dart';
import '../../../../features.dart';
import '../../../../search/presentation/widgets/seach_btn.dart';

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
    return Scaffold(
      key: context.read<HadithViewCubit>().scaffoldKey,
      drawer: HadithViewDrawer(hadithBooksEnum: hadithBooksEnum),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Skeleton.shade(
                      child: IconButton(
                        onPressed: () => context.read<HadithViewCubit>().scaffoldKey.currentState!.openDrawer(),
                        icon: AppIcons.menu,
                      ),
                    ),
                    Text(HadithLocalizationHelper.getBookName(hadithBookEntity), style: AppStyles.normalBold),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Skeleton.shade(child: SearchBtn(hadithBookEntity)),
                    const Skeleton.keep(child: HadithViewPopupButton(isInSearchPage: false)),
                    const Skeleton.keep(child: AppBackBtn()),
                  ],
                )
              ],
            ),
            Expanded(
              // child: Text('asd'),
              child: BlocBuilder<ChangeHadithViewTypeCubit, ChangeHadithViewTypeState>(
                builder: (context, state) {
                  return state.hadithViewTypeEnum == HadithViewTypeEnum.scrolllable
                      ? OpacityLayer(
                          useTopOpacityContainer: true,
                          useBottomOpacityContainer: false,
                          useBottomnavigationBarMargin: false,
                          child: HadithViewBodyCards(
                            isTempData: isTempData,
                            hadithBookEntity: hadithBookEntity,
                            chapterId: chapterId,
                          ),
                        )
                      : HadithViewBodyPageView(
                          isTempData: isTempData,
                          hadithBookEntity: hadithBookEntity,
                          chapterId: chapterId,
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppScaffold _oldDesign() {
    return AppScaffold(
      title: Text(HadithLocalizationHelper.getBookName(hadithBookEntity), style: AppStyles.normalBold),
      actions: [
        Skeleton.shade(child: SearchBtn(hadithBookEntity)),
        const Skeleton.keep(child: HadithViewPopupButton(isInSearchPage: false)),
        // const Skeleton.keep(child: SettingsBtn()),
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
