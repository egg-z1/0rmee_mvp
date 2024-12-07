import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';

class OrmeeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leftIcon;
  final VoidCallback? leftAction;
  final Widget? rightIcon;
  final VoidCallback? rightAction;
  final Color? rightIconColor;

  const OrmeeAppBar({
    Key? key,
    this.title,
    this.leftIcon,
    this.leftAction,
    this.rightIcon,
    this.rightAction,
    this.rightIconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: OrmeeColor.white,
      backgroundColor: OrmeeColor.white,
      elevation: 0,
      leading: (leftIcon != null && leftAction != null)
          ? IconButton(
              onPressed: leftAction ?? () {},
              icon: leftIcon!,
              color: OrmeeColor.gray[800],
            )
          : null,
      title: T3_18px(
        text: title ?? "Ormee",
      ),
      centerTitle: true,
      actions: rightIcon != null
          ? [
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: rightAction ?? () {},
                  icon: rightIcon!,
                  color: rightIconColor ?? OrmeeColor.gray[800],
                ),
              ),
            ]
          : [],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(52.0);
}
