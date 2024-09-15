import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/core.dart';

import '../../../features.dart';

class OnBoardDotIndecator extends StatelessWidget {
  const OnBoardDotIndecator({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardCubit, OnBoardState>(
      builder: (context, state) {
        var isSelected = state.currentPage == index;
        return Container(
          height: 10,
          width: 20,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: isSelected ? context.themeColors.primary : context.themeColors.natural,
            borderRadius: BorderRadius.circular(10),
          ),
        );
      },
    );
  }
}
