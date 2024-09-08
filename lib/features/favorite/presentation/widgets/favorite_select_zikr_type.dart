import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/local/l10n.dart';
import '../../../../core/core.dart';
import '../../../features.dart';

class FavoriteSelectZikrType extends StatelessWidget {
  const FavoriteSelectZikrType({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        return IconButton(
          icon: AppIcons.filter,
          onPressed: () => _filterIconPressed(context),
        );
      },
    );
  }

  Future<void> _filterIconPressed(BuildContext context) async {
    var favoriteCubit = context.read<FavoriteCubit>();

    var bottomSheet = MultiSelectibleHadithEnumBottomSheet(
      context: context,
      title: AppStrings.of(context).selectBooksFilter,
      selectedItems: favoriteCubit.state.selectedHadithEnums,
    );

    var result = await bottomSheet.show();

    bool isConfermSelected = result.$1;

    if (!isConfermSelected) return;

    List<HadithBooksEnum> selectedItems = result.$2;

    favoriteCubit.updateSelectededHadiths(selectedItems);
  }
}
