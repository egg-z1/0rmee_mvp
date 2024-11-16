import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';

class OrmeeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final IconData? leftIcon;
  final VoidCallback? leftAction;
  final Widget? rightIcon;
  final VoidCallback? rightAction;

  const OrmeeAppBar({
    Key? key,
    this.title,
    this.leftIcon,
    this.leftAction,
    this.rightIcon,
    this.rightAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: OrmeeColor.white,
      elevation: 0,
      leading: IconButton(
        onPressed: leftAction ?? () => Get.back(), // 기본은 Get.back()으로 설정
        icon: leftIcon != null
            ? Icon(leftIcon, color: OrmeeColor.gray[800])
            : SvgPicture.asset(
                'assets/icons/left.svg',
                color: OrmeeColor.gray[800],
              ),
      ),
      title: T3_18px(
        text: title ?? "Ormee",
      ),
      centerTitle: true,
      actions: rightIcon != null
          ? [
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: rightAction ?? () {}, // 기본은 아무 동작도 하지 않음
                  icon: rightIcon!,
                ),
              ),
            ]
          : [],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
