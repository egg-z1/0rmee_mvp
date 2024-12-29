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
      automaticallyImplyLeading: false,
      backgroundColor: OrmeeColor.grey[5],
      surfaceTintColor: Colors.transparent,
      toolbarHeight: 88,
      elevation: 0,
      title: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            SvgPicture.asset(
              '/icons/logo.svg',
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
              '/icons/setting.svg',
            ),
            const SizedBox(width: 28),
            SvgPicture.asset(
              '/icons/bell.svg',
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(88);
}
