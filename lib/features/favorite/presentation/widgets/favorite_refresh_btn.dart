import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

class FavoriteRefreshBtn extends StatelessWidget {
  const FavoriteRefreshBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: AppIcons.refresh,
      onPressed: () => _refreshIconPressed(context),
    );
  }

  void _refreshIconPressed(BuildContext context) {
    context.read<FavoriteCubit>().updateSavedData();
    
  }
}
