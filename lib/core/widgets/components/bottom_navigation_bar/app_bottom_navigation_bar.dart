import 'package:flutter/material.dart';
import 'package:hadith_books/core/core.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key, required this.currentIndex, this.onTap, required this.items});
  final int currentIndex;
  final Function(int)? onTap;
  final List<BottomNavigationBarItem> items;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: context.themeColors.primary,
      showUnselectedLabels: true,
      selectedLabelStyle: AppStyles.small.bold,
      unselectedLabelStyle: AppStyles.small,
      unselectedItemColor: context.themeColors.natural,
      currentIndex: currentIndex,
      onTap: onTap,
      items: items,
    );
  }
}
