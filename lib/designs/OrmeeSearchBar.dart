import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';

class OrmeeSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final RxBool isClearVisible;
  final VoidCallback onClear;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;

  const OrmeeSearchBar({
    Key? key,
    required this.controller,
    required this.isClearVisible,
    required this.onClear,
    required this.onChanged,
    required this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              controller: controller,
              onChanged: onChanged,
              onSubmitted: onSubmitted,
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
            return isClearVisible.value
                ? GestureDetector(
                    onTap: onClear,
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
              onSubmitted(controller.text);
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
}
