import 'package:flutter/material.dart';

import '../../../../src/app_router.dart';

class HadithDrawerItemModel {
  final Color iconColor;
  final String title;
  final Icon icon;
  final AppRoutes? appRoutes;
  final VoidCallback? onPress;

  const HadithDrawerItemModel({
    required this.iconColor,
    required this.title,
    required this.icon,
    required this.appRoutes,
  }):onPress=null;

  const HadithDrawerItemModel.customPress({
    required this.iconColor,
    required this.title,
    required this.icon,
    required this.onPress,
  }) : appRoutes = null;
}
