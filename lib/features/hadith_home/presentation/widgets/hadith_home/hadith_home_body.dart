import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/core.dart';
import '../../../../features.dart';

class HadithHomeBody extends StatefulWidget {
  const HadithHomeBody({super.key});

  @override
  State<HadithHomeBody> createState() => _HadithHomeBodyState();
}

class _HadithHomeBodyState extends State<HadithHomeBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BlocBuilder<HadithHomeCubit, HadithHomeState>(
          builder: (context, state) {
            return state is HadithHomeLoading ? const LinearProgressIndicator() : const SizedBox();
          },
        ),
        AppScrollbar(
          controller: context.read<HadithHomeCubit>().scrollController,
          child: _items(context),
        ),
      ],
    );
  }

  Widget _items(BuildContext context) {
    return AnimationGridUpToDownParent(
      child: GridView.builder(
        controller: context.read<HadithHomeCubit>().scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: AppSizes.xLargeSpace,
          mainAxisSpacing: AppSizes.xLargeSpace,
        ),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: HadithBooksEnum.values.length,
        itemBuilder: (context, index) {
          double paddingTop = (index == 0 || index == 1) ? AppSizes.screenPadding : 0;

          bool isEven = index % 2 == 0;

          double paddingLeft =
              context.isArabicLang ? (isEven ? 0 : AppSizes.screenPadding) : (isEven ? AppSizes.screenPadding : 0);

          double paddingRight =
              context.isArabicLang ? (isEven ? AppSizes.screenPadding : 0) : (isEven ? 0 : AppSizes.screenPadding);

          return _item(paddingLeft, paddingRight, paddingTop, index);
        },
      ),
    );
  }

  Widget _item(double paddingLeft, double paddingRight, double paddingTop, int index) {
    return AnimationGridUpToDown(
      index: index,
      columnCount: 2,
      duration: const Duration(milliseconds: 2000),
      key: UniqueKey(),
      child: Padding(
        padding: EdgeInsets.only(
          left: paddingLeft,
          right: paddingRight,
          top: paddingTop,
          bottom: AppSizes.screenPadding,
        ),
        child: HadithBookItemBtn(hadithBooksEnum: HadithBooksEnum.values[index]),
      ),
    );
  }
}