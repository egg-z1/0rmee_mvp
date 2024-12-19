import 'package:flutter/material.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';

class OrmeeButton1 extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color backgroundColor;
  final Color textColor;

  OrmeeButton1({
    required this.onPressed,
    required this.text,
    this.backgroundColor = const Color.fromARGB(255, 241, 242, 243),
    this.textColor = const Color.fromARGB(255, 32, 33, 35),
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: T4_20px(
        text: text,
        color: textColor,
      ),
    );
  }
}
