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
    return Column(
      children: [
        BlocBuilder<HadithHomeCubit, HadithHomeState>(
          builder: (context, state) {
            return state is HadithHomeLoading ? const AppLinearProgressindicator() : const SizedBox();
          },
        ),
        _items(context),
      ],
    );
  }

  Widget _items(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: context.width,
      height: context.height,
      child: OpacityLayer(
        useBottomOpacityContainer: true,
        useTopOpacityContainer: true,
        child: AppScrollbar(
          controller: context.read<HadithHomeCubit>().scrollController,
          child: AnimationGridUpToDownParent(
            child: ListView.builder(
              controller: context.read<HadithHomeCubit>().scrollController,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: HadithBooksEnum.values.length,
              itemBuilder: (context, index) {
                return _item(index);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _item(int index) {
    return AnimationGridUpToDown(
      index: index,
      columnCount: 1,
      duration: const Duration(milliseconds: 700),
      key: UniqueKey(),
      child: Padding(
        padding: EdgeInsets.only(
          left: AppSizes.screenPadding,
          right: AppSizes.screenPadding,
          top: index == 0 ? AppSizes.screenPadding : 0,
          bottom: AppSizes.screenPadding,
        ),
        child: HadithBookItemBtn(hadithBooksEnum: HadithBooksEnum.values[index]),
      ),
    );
  }
}
