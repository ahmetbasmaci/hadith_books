import 'package:flutter/material.dart';
import '../../../../config/local/l10n.dart';
import '../../../core.dart';
import '../../animations/animation_grid_up_to_down.dart';

class MultiSelectibleHadithEnumBottomSheet {
  MultiSelectibleHadithEnumBottomSheet({
    required this.context,
    required this.title,
    required List<HadithBooksEnum> selectedItems,
  }) : selectedItems = List<HadithBooksEnum>.from(selectedItems);
  final BuildContext context;
  final String title;
  List<HadithBooksEnum> selectedItems;

  bool _isConfermSelected = false;
  int get selectedItemsCount => selectedItems.length;
  bool get isAllItemsSelected => selectedItems.length == HadithBooksEnum.values.length;
  Future<(bool isConfermSelected, List<HadithBooksEnum> selectedItems)> show() async {
    await showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: _borderRadius()),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(AppSizes.smallSpace),
          decoration: BoxDecoration(color: context.themeColors.background, borderRadius: _borderRadius()),
          width: double.infinity,
          child: _body(),
        );
      },
    );
    return (_isConfermSelected, selectedItems);
  }

  Widget _body() {
    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            BottomSheetSelectionTitle(title: title),
            _actionButtons(setState),
            const Divider(),
            Expanded(child: _selectHadithCards(setState)),
          ],
        );
      },
    );
  }

  Row _actionButtons(void Function(void Function()) setState) {
    return Row(
      children: [
        _selectAllBtn(setState),
        _selectedItemsCountText(),
        const Spacer(),
        _closeBtn(),
        HorizontalSpace.small(),
        _confirmBtn(),
      ],
    );
  }

  IconButton _selectAllBtn(void Function(void Function()) setState) {
    return IconButton(
      onPressed: () => _triggerSelectAll(setState),
      icon: Row(
        children: <Widget>[
          AppIcons.animatedCheck3State(isAllItemsSelected, selectedItems.isNotEmpty),
          HorizontalSpace.small(),
          Text(AppStrings.of(context).selectAll, style: AppStyles.normalBold),
        ],
      ),
    );
  }

  Widget _selectedItemsCountText() {
    String allCount = HadithBooksEnum.values.length.toString();

    var selectedItemsCountWidget = WidgetSpan(
      child: AnimatedSwicherTransition(
        duration: const Duration(milliseconds: 200),
        child: Text(
          ' $selectedItemsCount',
          style: AppStyles.normalBold,
          key: UniqueKey(),
        ),
      ),
    );

    var allCountWidget = WidgetSpan(
      child: Text('$allCount /', style: AppStyles.normalBold),
    );
    return Text.rich(
      style: AppStyles.normalBold,
      TextSpan(
        children: context.isArabicLang
            ? [selectedItemsCountWidget, allCountWidget]
            : [allCountWidget, selectedItemsCountWidget],
      ),
    );
  }

  TextButton _closeBtn() {
    return TextButton(
      onPressed: () {
        _isConfermSelected = false;
        NavigatorHelper.pop();
      },
      child: Text(AppStrings.of(context).close),
    );
  }

  ElevatedButton _confirmBtn() {
    return ElevatedButton(
      onPressed: () {
        if (selectedItemsCount == 0) {
          ToatsHelper.showSnackBar(AppStrings.of(context).pleaseSelectAtLeastOneBook);

          return;
        }
        _isConfermSelected = true;
        NavigatorHelper.pop();
      },
      child: Text(AppStrings.of(context).confirm, style: AppStyles.normalBold),
    );
  }

  Widget _selectHadithCards(void Function(void Function()) setState) {
    return AppScrollbar(
      controller: ScrollController(),
      child: AnimationGridUpToDownParent(
        child: GridView.builder(
          shrinkWrap: true,
          controller: ScrollController(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: AppSizes.smallSpace,
            mainAxisSpacing: AppSizes.smallSpace,
            childAspectRatio: 3,
          ),
          physics: const BouncingScrollPhysics(),
          itemCount: HadithBooksEnum.values.length,
          itemBuilder: (context, index) {
            bool isEven = index % 2 == 0;

            double paddingLeft =
                context.isArabicLang ? (isEven ? 0 : AppSizes.screenPadding) : (isEven ? AppSizes.screenPadding : 0);

            double paddingRight =
                context.isArabicLang ? (isEven ? AppSizes.screenPadding : 0) : (isEven ? 0 : AppSizes.screenPadding);

            return Padding(
                padding: EdgeInsets.only(
                  left: paddingLeft,
                  right: paddingRight,
                  bottom: AppSizes.smallSpace,
                ),
                child: _selectHadithCardItem(context, setState, index));
          },
        ),
      ),
    );
  }

  Widget _selectHadithCardItem(BuildContext context, void Function(void Function()) setState, int index) {
    return AnimationGridUpToDown(
      index: index,
      columnCount: 2,
      child: IconButton(
        style: ButtonStyle(
          shadowColor: WidgetStateProperty.all(Colors.black),
          elevation: WidgetStateProperty.all(10),
          backgroundColor: WidgetStateProperty.all(context.themeColors.background),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.smallBorderRadius),
            ),
          ),
        ),
        onPressed: () => _updateSelectedItems(setState, HadithBooksEnum.values[index]),
        icon: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AnimatedEffectButton(
                onPressed: () => _updateSelectedItems(setState, HadithBooksEnum.values[index]),
                child: AppIcons.animatedCheck(_isItemSelected(HadithBooksEnum.values[index])),
              ),
              HorizontalSpace.small(),
              Text(
                HadithBooksEnum.values[index].bookName,
                style: AppStyles.normalBold,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BorderRadius _borderRadius() {
    return BorderRadius.only(
      topLeft: Radius.circular(AppSizes.borderRadius),
      topRight: Radius.circular(AppSizes.borderRadius),
    );
  }

  void _triggerSelectAll(void Function(void Function()) setState) {
    if (isAllItemsSelected) {
      selectedItems.clear();
    } else {
      selectedItems = HadithBooksEnum.values.toList();
    }
    setState(() {});
  }

  void _updateSelectedItems(void Function(void Function()) setState, HadithBooksEnum item) {
    if (selectedItems.contains(item)) {
      selectedItems.remove(item);
    } else {
      selectedItems.add(item);
    }
    setState(() {});
  }

  bool _isItemSelected(HadithBooksEnum item) {
    return selectedItems.contains(item);
  }
}
