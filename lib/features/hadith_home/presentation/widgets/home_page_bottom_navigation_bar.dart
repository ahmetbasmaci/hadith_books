import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_books/core/core.dart';

import '../../../../config/local/l10n.dart';
import '../../data/models/bottom_navigation_bar_item_model.dart';
import '../home_page_screens/home_page_screens_cubit.dart';

class HomePageBottomNavigationBar extends StatelessWidget {
  const HomePageBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageScreensCubit, HomePageScreensState>(
      builder: (context, state) {
        return AppBottomNavigationBar(
          currentIndex: context.read<HomePageScreensCubit>().getSelectedScreenIndex,
          onTap: (index) => context.read<HomePageScreensCubit>().changeScreen(index),
          
          items: context
              .read<HomePageScreensCubit>()
              .getAllScreensModels
              .map((e) => _bottomNavigartionBarItem(e))
              .toList(),
        );
      },
    );
  }

  BottomNavigationBarItem _bottomNavigartionBarItem(BottomNavigationBarItemModel item) {
    return BottomNavigationBarItem(
      icon: item.icon,
      label:AppStrings.of(AppConstants.context).screenTitle(item.screenEnum),
      
    );
  }
}
