// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/config/local/l10n.dart';
import 'package:hadith_books/core/utils/resources/resources.dart';
import 'package:hadith_books/core/widgets/components/icon_parent.dart';
import 'package:hadith_books/src/injection_manager.dart';
import '../../../../core/helpers/toats_helper.dart';
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
                  state.isFavorite
                      ? AppStrings.of(context).RemovedFromFavorite
                      : AppStrings.of(context).AddedToFavorite,
                );
              }
            },
            icon: IconParent(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: state.isFavorite ? AppIcons.favoriteFilled : AppIcons.favorite,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
