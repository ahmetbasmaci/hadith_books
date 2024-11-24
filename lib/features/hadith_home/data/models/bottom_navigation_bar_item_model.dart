import 'package:flutter/material.dart';

import '../../../../core/enums/home_page_screens_enum.dart';

class BottomNavigationBarItemModel {
  final HomePageScreensEnum screenEnum;
  final Icon icon;
  final Widget screen;
  final Widget? appBarTrailing;

  BottomNavigationBarItemModel({required this.screenEnum, required this.screen, required this.icon,this.appBarTrailing});
}
