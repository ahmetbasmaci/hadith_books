import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../features.dart';

class HadithViweBodyAllItems extends StatelessWidget {
  const HadithViweBodyAllItems({super.key, required this.hadithBookEntity});
  final HadithBookEntity hadithBookEntity;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      controller: context.read<HadithViewCubit>().scrollController,
      itemCount: hadithBookEntity.hadiths.length + 1,
      itemBuilder: (context, index) {
        if (index == hadithBookEntity.hadiths.length) {
          return const LoadedAllResultWidget();
        }
        var hadith = hadithBookEntity.hadiths[index];
        return HadithCardItem(index: index, hadith: hadith, hadithBookEntity: hadithBookEntity);
      },
    );
  }
}