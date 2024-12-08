import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeSearchbar.dart';
import 'package:ormee_mvp/screens/teacher/header/view_model.dart';

class TeacherHeader extends StatelessWidget implements PreferredSizeWidget {
  TeacherHeader({super.key});

  final TeacherHeaderController controller = Get.put(TeacherHeaderController());

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: OrmeeColor.white,
      toolbarHeight: 88,
      elevation: 0,
      shape: Border(
        bottom: BorderSide(
          color: OrmeeColor.gray[200]!,
          width: 1,
        ),
      ),
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            Image.asset(
              '../assets/images/logo.png',
              height: 48,
            ),
            const Spacer(),
            OrmeeSearchBar(
              controller: controller.searchController,
              isClearVisible: controller.searchClear,
              onClear: controller.clearSearch,
              onChanged: controller.onSearchChanged,
              onSubmitted: controller.onSearchSubmitted,
            ),
            const SizedBox(width: 28),
            SvgPicture.asset(
              'assets/icons/type=bell.svg',
              color: OrmeeColor.gray[500],
              height: 32,
            ),
            const SizedBox(width: 28),
            SvgPicture.asset(
              'assets/icons/type=settings.svg',
              color: OrmeeColor.gray[500],
              height: 32,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(88);
}
