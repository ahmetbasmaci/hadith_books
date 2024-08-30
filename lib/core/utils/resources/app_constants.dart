import 'package:flutter/material.dart';

class AppConstants {
  AppConstants._();
  static const String developerEmail = 'engahmet10@gmail.com';
  static const String developerWhatsapp = '+9605398416843';
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>(); // Create a key to can open drawer
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static BuildContext get context => navigatorKey.currentState!.context;
  static FocusScopeNode focusScopeNode = FocusScopeNode();
}
