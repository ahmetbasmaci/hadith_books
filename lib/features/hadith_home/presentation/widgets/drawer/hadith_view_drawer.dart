import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/enums/hadith_books_enum.dart';
import '../../../../features.dart';

class HadithViewDrawer extends StatelessWidget {
  const HadithViewDrawer({super.key, required this.hadithBooksEnum});
  final HadithBooksEnum hadithBooksEnum;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HadithViewCubit, HadithViewState>(
      builder: (context, state) {
        if (state is! HadithViewLoaded) {
          return const Scaffold(body: SizedBox());
        }
        //? must be here to avoid scroll controller error
        context
            .read<HadithViewCubit>()
            .scrollChapterControlerToSavedIndex(state.hadithBookEntity, state.selectedChapterId);

        return _body(state);
      },
    );
  }

  AppDrawer _body(HadithViewLoaded state) {
    return AppDrawer(
      topPart: DrawerHeaderPart(hadithBookEntity: state.hadithBookEntity),
      centerPart: DrawerChaptersPart(
        hadithBooksEnum: hadithBooksEnum,
        hadithBookEntity: state.hadithBookEntity,
        selectedChapterId: state.selectedChapterId,
      ),
      bottomPart: const DrawerSettingsPart(),
    );
  }
}
