import 'package:flutter/material.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';

class OrmeeButton2 extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color backgroundColor;
  final Color textColor;

  OrmeeButton2({
    required this.onPressed,
    required this.text,
    this.backgroundColor = const Color.fromARGB(255, 114, 96, 248),
    this.textColor = const Color.fromARGB(255, 255, 255, 255),
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: Size(114, 53),
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: T3_18px(
        text: text,
        color: textColor,
      ),
    );
  }
}
