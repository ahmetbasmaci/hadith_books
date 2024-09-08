import 'package:flutter/material.dart';
import '../../../../../config/local/l10n.dart';
import '../../../../core.dart';

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
            _title(),
            _actionButtons(setState),
            const Divider(),
            Expanded(child: _selectHadithCards(setState)),
          ],
        );
      },
    );
  }

  Text _title() => Text(title, style: AppStyles.titleBigBold);

  Row _actionButtons(void Function(void Function()) setState) {
    return Row(
      children: [
        _selectAllBtn(setState),
        _selectedItemsCountText(),
        const Spacer(),
        _closeBtn(),
        _confirmBtn(),
      ],
    );
  }

  IconButton _selectAllBtn(void Function(void Function()) setState) {
    return IconButton(
      onPressed: () => _triggerSelectAll(setState),
      icon: Row(
        children: <Widget>[
          Text(AppStrings.of(context).selectAll, style: AppStyles.normalBold),
          AppIcons.animatedCheck3State(isAllItemsSelected, selectedItems.isNotEmpty ),
        ],
      ),
    );
  }

  Text _selectedItemsCountText() {
    String allCount = HadithBooksEnum.values.length.toString();
    if (context.isArabicLang) {
      return Text('$allCount/$selectedItemsCount', style: AppStyles.normalBold);
    } else {
      return Text('$selectedItemsCount/$allCount', style: AppStyles.normalBold);
    }
  }

  TextButton _closeBtn() {
    return TextButton(
      onPressed: () {
        _isConfermSelected = false;
        NavigatorHelper.pop();
      },
      child: Text(
        AppStrings.of(context).close,
        style: AppStyles.normalBold.copyWith(color: context.themeColors.natural),
        // style: AppStyles.normalBold.copyWith(color: context.themeColors.error),
      ),
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
    );
  }

  Widget _selectHadithCardItem(BuildContext context, void Function(void Function()) setState, int index) {
    return IconButton(
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
            Text(
              HadithBooksEnum.values[index].bookName,
              overflow: TextOverflow.ellipsis, // Adds ellipsis if text overflows
              softWrap: false, // Prevents text from wrapping to the next line
              style: AppStyles.normalBold,
            ),
            AppIcons.animatedCheck(_isItemSelected(HadithBooksEnum.values[index]))
          ],
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
