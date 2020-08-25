import 'dart:io' show Platform;

import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final bool isTitle;

  TextWidget({
    this.title,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.isTitle,
  });

  @override
  Widget build(BuildContext context) {
    String fontFamily;
    if (Platform.isAndroid) {
      fontFamily = "Montserrat";
    } else if (Platform.isIOS) {
      fontFamily = "SF-Pro";
    }
    if (isTitle) {
      fontFamily = "Gotham";
    }
    return new Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: textColor
      ),
    );
  }
}
