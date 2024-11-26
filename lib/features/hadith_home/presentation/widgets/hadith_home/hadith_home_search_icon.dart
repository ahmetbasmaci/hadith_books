import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/local/l10n.dart';
import '../../../../../core/core.dart';
import '../../../../features.dart';

class HadithHomeSearchIcon extends StatelessWidget {
  const HadithHomeSearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HadithHomeCubit, HadithHomeState>(
      builder: (context, state) {
        // if (state is HadithHomeLoading) {
        //   return Padding(
        //       padding: EdgeInsets.all(AppSizes.smallScreenPadding), child: const AppCircularProgressIndicator());
        // }
        return IconButton(
          // key: key,
          icon: AppIcons.search,
          color: context.themeColors.secondary,
          onPressed: () => _btnSearchPressed(context),
        );
      },
    );
  }

  Future<void> _btnSearchPressed(BuildContext context) async {
    var hadithHomeCubit = context.read<HadithHomeCubit>();

    var hadithSearchCubit = context.read<HadithSearchFilterCubit>();
    hadithSearchCubit.getSavedSelectedHadithsInSearchList();

    var bottomSheet = MultiSelectibleHadithEnumBottomSheet(
      context: context,
      title: AppStrings.of(context).selectBooksToSearchIn,
      selectedItems: hadithSearchCubit.state.selectedHadithsInSearch,
    );

    var result = await bottomSheet.show();

    bool isConfermSelected = result.$1;

    if (!isConfermSelected) return;

    List<HadithBooksEnum> selectedItems = result.$2;

    await Future.delayed(Duration(milliseconds: 1000));

    hadithSearchCubit.updateAndSaveSelectededHadiths(selectedItems);

    await hadithHomeCubit.searchInHoleBooks(selectedItems);
  }
}
