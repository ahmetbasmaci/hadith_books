import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'size_config.dart';

class ResponsiveManager {
  ResponsiveManager._();

  //! FONTS
  static double responsiveFontSize(double fontSize) {
    final scaleFactor = _getScaleFactor();
    double responsiveFontSize = fontSize * scaleFactor;

    double lowerLimit = fontSize * _lowerFontSizeLimit;
    double upperLimit = fontSize * _upperFontSizeLimit;

    return responsiveFontSize.clamp(lowerLimit, upperLimit);
  }

  //! ICONS
  static double responsiveIconSize(double iconSize) {
    double lowerLimit = iconSize * _lowerIconSizeLimit;
    double upperLimit = iconSize * _upperIconSizeLimit;

    var scaleFactor = _getScaleFactor();
    double responsiveIconSize = iconSize * scaleFactor;
    return responsiveIconSize.clamp(lowerLimit, upperLimit);
  }

  static double get _lowerFontSizeLimit => .8;
  static double get _upperFontSizeLimit => 1.2;

  static double get _lowerIconSizeLimit => .5;
  static double get _upperIconSizeLimit => 1.5;

//use this if you are dont want to use web
  static double _getScaleFactor() {
    final dispatcher = PlatformDispatcher.instance;
    final physicalWidth = dispatcher.views.first.physicalSize.width;
    var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
    final width = physicalWidth / devicePixelRatio;
    return _getScaleFactorByWidth(width);
  }

//use this if you are developing for web
  // ignore: unused_element
  static double _getScaleFactor2(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return _getScaleFactorByWidth(width);
  }

  static double _getScaleFactorByWidth(double width) {
    if (width < SizeConfig.mobileWidth) {
      return width / 400;
    } else if (width < SizeConfig.tabletWidth) {
      return width / 700;
    } else {
      return width / 1300;
    }
  }
}
