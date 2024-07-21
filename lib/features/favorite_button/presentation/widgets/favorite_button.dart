import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/src/injection_manager.dart';
import '../../../../core/helpers/toats_helper.dart';
import '../../../../core/utils/resources/app_icons.dart';
import '../../../features.dart';
class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.hadith});
  final HadithEntity hadith;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InjectionManager.instance.favoriteButtonCubit,
      child: BlocConsumer<FavoriteButtonCubit, FavoriteButtonState>(
        listener: (context, state) {
          if (state is FavoriteButtonErrorState) {
            ToatsHelper.showSnackBarError(state.message);
          }
        },
        builder: (context, state) => FutureBuilder(
          future: context.read<FavoriteButtonCubit>().checkIfItemIsFavorite(hadith),
          builder: (context, snapshot) => IconButton(
            onPressed: () async {
              await context.read<FavoriteButtonCubit>().changeFavoriteStatus(hadith);
              if (state is FavoriteButtonInitialState) {
                ToatsHelper.showSnackBar(
                    state.isFavorite ? 'Removed from favorite' : 'Added to favorite'); //TODo add localization
              }
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: state.isFavorite ? AppIcons.favoriteFilled : AppIcons.favorite,
            ),
          ),
        ),
      ),
    );
  }
}
