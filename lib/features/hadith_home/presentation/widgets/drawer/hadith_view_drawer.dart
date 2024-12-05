import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/core.dart';
import '../../../../features.dart';

class HadithViewDrawer extends StatelessWidget {
  const HadithViewDrawer({super.key, required this.hadithBooksEnum});
  final HadithBooksEnum hadithBooksEnum;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HadithViewCubit, HadithViewState>(
      builder: (context, state) {
        if (state is! HadithViewLoaded) {
          return const AppScaffold(useSliver: false, body: SizedBox());
        }
        //? must be here to avoid scroll controller error
        context
            .read<HadithViewCubit>()
            .scrollChapterControlerToSavedIndex(state.hadithBookFullModel.hadithBook, state.selectedChapterId);

        return _body(state);
      },
    );
  }

  AppDrawer _body(HadithViewLoaded state) {
    return AppDrawer(
      topPart: DrawerItemAnimation(
        child: DrawerHadithHeaderPart(hadithBookFullModel: state.hadithBookFullModel),
      ),
      centerPart: DrawerChaptersPart(
        hadithBooksEnum: hadithBooksEnum,
        hadithBookFullModel: state.hadithBookFullModel,
        selectedChapterId: state.selectedChapterId,
      ),
      // bottomPart: const DrawerSettingsPart(showFromHadithViewPage: false),
    );
  }
}
