import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/config/local/l10n.dart';
import 'package:hadith_books/core/helpers/toats_helper.dart';

import '../../../../core/enums/hadith_books_enum.dart';
import '../../../../core/helpers/navigator_helper.dart';
import '../../../../core/utils/resources/resources.dart';
import '../../../../core/widgets/components/app_scrollbar.dart';
import '../../../../features/favorite/presentation/favorite_filter_cubit/favorite_filter_cubit.dart';
import '../../../../features/features.dart';

class FavoriteSearchModelBottomSheet {
  FavoriteSearchModelBottomSheet._();
  static bool _isConfermSelected = false;
  static Future<bool> show(BuildContext context) async {
    context.read<FavoriteFilterCubit>().getInstanceFromSavedData();
    await showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: _borderRadius()),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(AppSizes.smallSpace),
          decoration: BoxDecoration(color: context.themeColors.background, borderRadius: _borderRadius()),
          height: context.height * 0.3,
          width: double.infinity,
          child: AppScrollbar(
            controller: context.read<HadithHomeCubit>().scrollController,
            child: BlocBuilder<FavoriteFilterCubit, FavoriteFilterState>(
              builder: (context, state) => _body(context, state),
            ),
          ),
        );
      },
    ).then(
      (value) {
        if (_isConfermSelected) {
          if (context.read<FavoriteFilterCubit>().selectedHadithsInFavoriteList.isNotEmpty) return;
          ToatsHelper.showSnackBar(AppStrings.of(context).pleaseSelectAtLeastOneBook);
        }
        _isConfermSelected = false;
        context.read<FavoriteFilterCubit>().resetSelectedHadithsInFavoriteList();
      },
    );
    return _isConfermSelected;
  }

  static Column _body(BuildContext context, FavoriteFilterState state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _title(context),
        _actionButtons(context, state),
        const Divider(),
        Expanded(child: _selectHadithCards(context))
      ],
    );
  }

  static Text _title(BuildContext context) =>
      Text(AppStrings.of(context).selectBooksToSearchIn, style: AppStyles.titleMeduim);

  static Row _actionButtons(BuildContext context, FavoriteFilterState state) {
    var hadithSearchCubit = context.read<FavoriteFilterCubit>();
    return Row(
      children: [
        _selectAllBtn(hadithSearchCubit, context),
        _selectedItemsCountText(state),
        const Spacer(),
        _closeBtn(hadithSearchCubit, context),
        _confirmBtn(hadithSearchCubit, context),
      ],
    );
  }

  static IconButton _selectAllBtn(FavoriteFilterCubit hadithSearchCubit, BuildContext context) {
    return IconButton(
      onPressed: () => hadithSearchCubit.triggerSelectAll(),
      icon: Row(
        children: <Widget>[
          Text(AppStrings.of(context).selectAll, style: AppStyles.normalBold),
          AppIcons.animatedCheck3State(hadithSearchCubit.isSelectedAll, hadithSearchCubit.isHaveItemsSelectedAndNotAll),
        ],
      ),
    );
  }

  static Text _selectedItemsCountText(FavoriteFilterState state) {
    return Text('${state.selectedHadithsInFavorite.length}/${HadithBooksEnum.values.length}',
        style: AppStyles.normalBold);
  }

  static TextButton _closeBtn(FavoriteFilterCubit hadithSearchCubit, BuildContext context) {
    return TextButton(
      onPressed: () {
        hadithSearchCubit.resetSelectedHadithsInFavoriteList();
        NavigatorHelper.pop();
      },
      child: Text(
        AppStrings.of(context).close,
        style: AppStyles.normalBold.copyWith(color: context.themeColors.error),
      ),
    );
  }

  static ElevatedButton _confirmBtn(FavoriteFilterCubit hadithSearchCubit, BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _isConfermSelected = true;
        hadithSearchCubit.saveSelectedHadithsInFavoriteList();
        NavigatorHelper.pop();
      },
      child: Text(AppStrings.of(context).confirm, style: AppStyles.normalBold),
    );
  }

  static GridView _selectHadithCards(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      controller: context.read<HadithHomeCubit>().scrollController,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppSizes.smallSpace,
        mainAxisSpacing: AppSizes.smallSpace,
        childAspectRatio: 3,
      ),
      physics: const BouncingScrollPhysics(),
      itemCount: HadithBooksEnum.values.length,
      itemBuilder: (context, index) => _selectHadithCardItem(context, index),
    );
  }

  static Widget _selectHadithCardItem(BuildContext context, int index) {
    return Card(
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () =>
            context.read<FavoriteFilterCubit>().updateSelectedHadithsInFavoriteList(HadithBooksEnum.values[index]),
        icon: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                HadithBooksEnum.values[index].bookName,
                style: AppStyles.normalBold,
              ),
            ),
            AppIcons.animatedCheck(
              context.read<FavoriteFilterCubit>().isSelectedHadithsInFavorite(HadithBooksEnum.values[index]),
            )
          ],
        ),
      ),
    );
  }

  static BorderRadius _borderRadius() {
    return BorderRadius.only(
      topLeft: Radius.circular(AppSizes.borderRadius),
      topRight: Radius.circular(AppSizes.borderRadius),
    );
  }
}
