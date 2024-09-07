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
  const FavoriteButton({super.key, required this.hadith, this.afterPressed});
  final HadithEntity hadith;
  final Function(bool isFavorite)? afterPressed;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InjectionManager.instance.favoriteButtonCubit,
      child: BlocConsumer<FavoriteButtonCubit, FavoriteButtonState>(
        listener: _listener,
        builder: (context, state) => FutureBuilder(
          future: context.read<FavoriteButtonCubit>().checkIfItemIsFavorite(hadith),
          builder: (context, snapshot) => IconButton(
            padding: EdgeInsets.zero,
            onPressed: () => _onPressed(context, state, afterPressed),
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

  Future<void> _onPressed(
      BuildContext context, FavoriteButtonState state, Function(bool isFavorite)? afterPressed) async {
    {
      await context.read<FavoriteButtonCubit>().changeFavoriteStatus(hadith);
      if (state is FavoriteButtonInitialState) {
        ToatsHelper.showSnackBar(
          state.isFavorite ? AppStrings.of(context).RemovedFromFavorite : AppStrings.of(context).AddedToFavorite,
        );
      }
      afterPressed?.call(state.isFavorite);
    }
  }

  void _listener(context, state) {
    if (state is FavoriteButtonErrorState) {
      ToatsHelper.showSnackBarError(state.message);
    }
  }
}
