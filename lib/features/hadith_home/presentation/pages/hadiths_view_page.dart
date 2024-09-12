import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          return const AppWaitScreen();
        } else if (state is HadithViewLoading) {
          return const AppWaitScreen();
        } else if (state is HadithViewLoaded) {
          return HadithViewBody(
            hadithBooksEnum: hadithBooksEnum,
            hadithBookEntity: state.hadithBookEntity,
            chapterId: state.selectedChapterId,
          );
        } else if (state is HadithViewError) {
          return HadithViewErrorWidget(hadithBooksEnum: hadithBooksEnum);
        }
        return const SizedBox();
      },
    );
  }
}
