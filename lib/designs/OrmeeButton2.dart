import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';

class OrmeeButton2 extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;

  OrmeeButton2({
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: OrmeeColor.purple[40]!.withOpacity(0.4),
              offset: Offset(2, 4),
              blurRadius: 12.5,
            ),
          ],
          color: OrmeeColor.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/plus.svg',
              color: OrmeeColor.purple[40],
            ),
            SizedBox(width: 10),
            Headline1_Bold(
              text: text,
              color: OrmeeColor.purple[40],
            ),
          ],
        ),
      ),
    );
  }
}
