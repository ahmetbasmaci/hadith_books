import 'package:flutter/material.dart';

class BottomNavigationBarItemModel {
  final Icon icon;
  final String title;
  final Widget screen;

  BottomNavigationBarItemModel({required this.screen, required this.icon, required this.title});
}
