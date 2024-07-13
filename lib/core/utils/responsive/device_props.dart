import 'package:flutter/material.dart';

import 'size_config.dart';

class DeviceProps {
  DeviceProps._();

  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= SizeConfig.desktopWidth;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= SizeConfig.tabletWidth &&
      MediaQuery.of(context).size.width < SizeConfig.desktopWidth;

  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < SizeConfig.tabletWidth;
}
