import 'package:flutter/material.dart';


class TextWidget extends StatelessWidget {

  final String title;
  final double? fontSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final String? fontFamily;

  const TextWidget({
    super.key,
    required this.title,
    this.fontSize,
    this.textColor,
    this.fontWeight,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: textColor,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        fontSize: fontSize
      ),
    );
  }
}