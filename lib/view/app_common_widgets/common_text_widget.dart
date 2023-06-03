

import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final String? fontFamily;
  final TextAlign? textAlign;
  const CommonText({
    this.text,
    this.fontFamily,
    this.decoration,
    this.fontWeight,
    this.color,
    this.fontSize,
    this.textAlign,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "Empty",
      textAlign: textAlign,
      style: TextStyle(
        overflow: TextOverflow.clip,
        fontFamily: fontFamily ,
        decoration: decoration,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        // fontWeight: FontWeight.bold,
      ),
    );
  }
}
