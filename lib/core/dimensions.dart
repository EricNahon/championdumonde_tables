import 'package:flutter/material.dart';

class Dimensions {
  static const mobileWidth = 700;
  static const desktopWidth = 1440;

  static int getCrossAxisCount(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    var result = 2;
    if (screenSize.width < mobileWidth) result = 1;
    if (screenSize.width > desktopWidth) result = 3;
    return result;
  }

  static double getWidthfactor(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    var result = 0.80;
    if (screenSize.width < mobileWidth) result = 0.9;
    if (screenSize.width > desktopWidth) result = 0.7;
    return result;
  }
}
