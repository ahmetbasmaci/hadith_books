import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

class FavoriteBodyWithLoading extends StatelessWidget {
  const FavoriteBodyWithLoading({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FavoriteCubit>().updateSavedData();
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<FavoriteCubit>().updateSavedData();
      },
      child: BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: (context, state) {
          if (state is FavoriteErrorState) {
            ToatsHelper.error(state.message);
          }
        },
        builder: (context, state) {
          if (state is FavoriteErrorState) {
            return Center(child: Center(child: Text(state.message, style: AppStyles.normal)));
          }
          if (state is! FavoriteLoadedState) {
            return const HadithViewLoadingWidget(isLoading: true, child: HadithViewTempDataListCards());
          }

          return FavoriteBody(hadithBookEntities: state.selectedHadithBookEntitys);
        },
      ),
    );
  }
}
