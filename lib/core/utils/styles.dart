import 'package:flutter/material.dart';

abstract class Styles {

  static const openSans = 'OpenSans';
  

  static double _baseFontSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth / 375;
  }

  static TextStyle textSemiBold12(BuildContext context) {
    final fontSize = 12 * _baseFontSize(context);
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle textNormal14(BuildContext context) {
    final fontSize = 14 * _baseFontSize(context);
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textLight16(BuildContext context) {
    final fontSize = 16 * _baseFontSize(context);
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle textMedium18(BuildContext context) {
    final fontSize = 18 * _baseFontSize(context);
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle textLight20(BuildContext context) {
    final fontSize = 20 * _baseFontSize(context);
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle textMedium24(BuildContext context) {
    final fontSize = 24 * _baseFontSize(context);
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textBold26(BuildContext context) {
    final fontSize = 26 * _baseFontSize(context);
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle textMedium28(BuildContext context) {
    final fontSize = 28 * _baseFontSize(context);
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
    );
  }
}
