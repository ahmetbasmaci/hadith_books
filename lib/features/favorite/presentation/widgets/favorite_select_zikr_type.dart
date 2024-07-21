import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/enums/hadith_books_enum.dart';
import '../../../../core/utils/resources/resources.dart';
import '../../../../core/widgets/components/horizontal_space.dart';
import '../../../features.dart';

class FavoriteSelectZikrType extends StatelessWidget {
  const FavoriteSelectZikrType({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppIcons.menu,
        HorizontalSpace.large(),
        _selectZikrTypeDropDown(context),
      ],
    );
  }

  Widget _selectZikrTypeDropDown(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        return DropdownButtonHideUnderline(
          child: DropdownButton<FavoriteHadithTypeEnum>(
            value: context.read<FavoriteCubit>().state.favoriteHadithTypeEnum,
            items: FavoriteHadithTypeEnum.values
                .map(
                  (e) => DropdownMenuItem(value: e, child: Text(e.bookName)),
                )
                .toList(),
            onChanged: (newSelectedType) {
              context.read<FavoriteCubit>().changeFavoriteZikrCategory(newSelectedType!);
            },
          ),
        );
      },
    );
  }
}
