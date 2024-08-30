import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/components/app_scrollbar.dart';
import '../../../../features.dart';

class HadithViewBodyPartSearchInBook extends StatelessWidget {
  const HadithViewBodyPartSearchInBook({super.key, required this.hadithBookEntity, required this.searchText});

  final String searchText;
  final HadithBookEntity hadithBookEntity;

  @override
  Widget build(BuildContext context) {
    var scrollController = context.read<HadithViewCubit>().scrollController;
    return AppScrollbar(
      controller: scrollController,
      child: searchText.isEmpty
          ? HadithViweBodyAllItems(hadithBookEntity: hadithBookEntity)
          : HadithViewBodySearchedItems(
              hadithBookEntities: [hadithBookEntity],
              searchText: searchText,
              scrollController: scrollController,
              hadiths: hadithBookEntity.hadiths,
            ),
    );
  }
}