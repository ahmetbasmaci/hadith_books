import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

class SearchBtn extends StatelessWidget {
  const SearchBtn({required this.hadithBookEntity, super.key});
  final HadithBookEntity hadithBookEntity;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<SearchCubit>().showSearchPageBook(hadithBookEntity),
      color: context.themeColors.secondary,
      icon: AppIcons.search,
    );
  }
}
