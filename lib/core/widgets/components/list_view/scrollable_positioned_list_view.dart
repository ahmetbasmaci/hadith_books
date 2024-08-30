import 'package:flutter/material.dart';
import 'package:hadith_books/core/widgets/components/app_scrollbar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ScrollablePositionedListView extends StatelessWidget {
  const ScrollablePositionedListView({
    super.key,
    required this.itemScrollController,
    this.itemPositionsListener,
    required this.itemCount,
    required this.itemBuilder,
  });
  final ItemScrollController itemScrollController;
  final ItemPositionsListener? itemPositionsListener;
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return AppScrollbar(
      controller: ScrollController(),
      child: ScrollablePositionedList.builder(
        shrinkWrap: true,
        itemScrollController: itemScrollController,
        itemPositionsListener: itemPositionsListener,
        physics: const BouncingScrollPhysics(),
        itemCount: itemCount,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
