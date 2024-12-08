import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
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
            _buildSearchBar(),
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

  Widget _buildSearchBar() {
    return Container(
      width: 480,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: OrmeeColor.gray[100],
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller.searchController,
              onChanged: controller.onSearchChanged,
              onSubmitted: controller.onSearchSubmitted,
              style: TextStyle(
                color: OrmeeColor.gray[900],
                fontFamily: 'Pretendard',
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: '찾으시는 정보를 검색해보세요.',
                hintStyle: TextStyle(
                  color: OrmeeColor.gray[500],
                  fontFamily: 'Pretendard',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                border: InputBorder.none,
              ),
              textInputAction: TextInputAction.search,
            ),
          ),
          Obx(() {
            return controller.searchClear.value
                ? GestureDetector(
                    onTap: controller.clearSearch,
                    child: SvgPicture.asset(
                      'assets/icons/type=circle_x.svg',
                      color: OrmeeColor.gray[300],
                      height: 24,
                    ),
                  )
                : const SizedBox.shrink();
          }),
          const SizedBox(width: 16),
          GestureDetector(
            onTap: () {
              controller.onSearchSubmitted(controller.searchController.text);
            },
            child: SvgPicture.asset(
              'assets/icons/type=search.svg',
              color: OrmeeColor.gray[600],
              height: 24,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(88);
}
