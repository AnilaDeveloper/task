
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'common_colors.dart';

class CommonTextFormField extends StatelessWidget {
  String? hintText;
  TextEditingController? controller;
  Function()? onTap;
  double? fontSize;
  // int? maxLength;
  int? maxLines;
  Widget? suffixIcon;
  Color? color;
  bool? enable;
  Color? fillColor;
  bool? filled;
  bool? obscureText;
  TextInputType? keyboardType;
  EdgeInsetsGeometry? contentPadding;
  FontWeight? fontWeight;
  List<TextInputFormatter>? inputFormatters;
  CommonTextFormField({
    this.hintText,
    this.enable,
    this.onTap,
    this.controller,
    // this.maxLength,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText,
    this.contentPadding,
    this.fontSize,
    this.color,
    this.fillColor,
    this.filled,
    this.fontWeight,
    this.maxLines,
    this.inputFormatters,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      enabled: enable,
      autovalidateMode: AutovalidateMode.always,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      maxLines: maxLines,
      controller: controller,
      cursorWidth: 1,

      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: black000000,
      ),
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        helperMaxLines: 3,

        hintText: hintText,
        filled: filled,
        fillColor: fillColor ?? whiteF4F4F4,
        suffixIcon: suffixIcon,
        counterText: '',
        hintStyle: TextStyle(
          fontSize: fontSize,
          color: textLight868686,
          fontWeight: fontWeight,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: fillColor ?? whiteF4F4F4,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: fillColor ?? whiteF4F4F4,
          ),
        ),
      ),
    );
  }
}
