import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';

class OrmeeSingleChoiceList extends StatelessWidget {
  final List<String> items;
  final Function(int) onSelectionChanged;

  OrmeeSingleChoiceList({
    Key? key,
    required this.items,
    required this.onSelectionChanged,
  }) : super(key: key);

  final RxInt selectedIndex = (-1).obs; // 선택 상태를 Rx로 관리

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(), // 스크롤 비활성화 (필요한 경우 추가)
      shrinkWrap: true, // 부모 위젯의 크기에 맞게 축소
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            selectedIndex.value = index; // 선택된 인덱스 업데이트
            onSelectionChanged(selectedIndex.value);
          },
          child: Obx(() {
            final isSelected = selectedIndex.value == index;
            return Row(
              children: [
                SvgPicture.asset(
                  isSelected
                      ? 'assets/icons/checked_round.svg'
                      : 'assets/icons/n_checked_round.svg',
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: B4_14px_R(
                    text: items[index],
                    color: isSelected
                        ? OrmeeColor.gray[900]
                        : OrmeeColor.gray[600],
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            );
          }),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 8); // 아이템 사이 간격
      },
    );
  }
}
