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
      width: 335,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: OrmeeColor.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              onSubmitted: onSubmitted,
              style: TextStyle(
                color: OrmeeColor.grey[90],
                fontFamily: 'Pretendard',
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: '찾으시는 정보를 검색해보세요.',
                hintStyle: TextStyle(
                  color: OrmeeColor.grey[30],
                  fontFamily: 'Pretendard',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
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
              'assets/icons/search.svg',
            ),
          ),
        ],
      ),
    );
  }
}
