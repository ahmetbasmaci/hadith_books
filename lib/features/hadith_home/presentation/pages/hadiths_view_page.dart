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
          return HadithViewBodyWithLoading.loading();
          // return FutureBuilder(
          //   future: context.read<HadithViewCubit>().init(hadithBooksEnum),
          //   builder: (context, snapshot) {
          //     return HadithViewBodyWithLoading.loading();
          //   },
          // );
        } else if (state is HadithViewLoading) {
          return HadithViewBodyWithLoading.loading();
        } else if (state is HadithViewError) {
          return HadithViewErrorWidget(hadithBooksEnum: hadithBooksEnum);
        } else if (state is HadithViewLoaded) {
          return HadithViewBodyWithLoading.withData(
            hadithBooksEnum: hadithBooksEnum,
            hadithBookEntity: state.hadithBookFullModel.hadithBook,
            chapterId: state.selectedChapterId,
          );
        }
        return const SizedBox();
      },
    );
  }
}
