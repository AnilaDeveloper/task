import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
 final Function()? onTap;
 final String? text;
 final Color? bgColor;
 final Color? textColor;
 final Icon? icon;
 final double? fontSize;

  const CommonButton({
    this.icon,
    this.onTap,
    this.text,
    this.bgColor,
    this.fontSize,
    this.textColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        //padding: const EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(05),
        ),
        child: Text(
          text!,
          style: TextStyle(
              color: textColor,
              fontSize: fontSize ?? 18,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}