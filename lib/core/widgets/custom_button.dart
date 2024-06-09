import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {required this.backgroundColor,
      this.borderRadius,
      required this.textColor,
      required this.text,
      this.fontSize,
      Key? key, this.onPressed})
      : super(key: key);

  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final Color? textColor;
  final String text;
  final double? fontSize;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: TextButton(
        onPressed:onPressed,
        style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(12))),
        child: Text(
          text,
          style:const TextStyle(color: Colors.white)
      ),
      )
    );
  }
}
