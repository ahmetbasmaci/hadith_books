// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/config/local/l10n.dart';
import 'package:hadith_books/src/injection_manager.dart';
import '../../../../core/core.dart';
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
          builder: (context, snapshot) => AnimatedIconParent(
            color: context.themeColors.favoriteBtn,
            child: state.isFavorite
                ? AppIcons.favoriteFilledIcon(key: const ValueKey('key1'), color: context.themeColors.favoriteBtn)
                : AppIcons.favoriteIcon(key: const ValueKey('key2'), color: context.themeColors.favoriteBtn),
            onPressed: () => _onPressed(context, state, afterPressed),
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
        ToatsHelper.success(
          state.isFavorite ? AppStrings.of(context).RemovedFromFavorite : AppStrings.of(context).AddedToFavorite,
          duration: Duration(seconds: 1),
        );
      }
      afterPressed?.call(state.isFavorite);
    }
  }

  void _listener(context, state) {
    if (state is FavoriteButtonErrorState) {
      ToatsHelper.error(state.message);
    }
  }
}
