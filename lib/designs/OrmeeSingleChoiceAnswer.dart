import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';

class OrmeeSingleChoiceAnswer extends StatelessWidget {
  final List<String?> items;
  final String answer;
  final bool isCorrect;

  OrmeeSingleChoiceAnswer({
    Key? key,
    required this.items,
    required this.answer,
    required this.isCorrect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int selectedIndex = items.indexOf(answer);
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(), // 스크롤 비활성화 (필요한 경우 추가)
      shrinkWrap: true, // 부모 위젯의 크기에 맞게 축소
      itemCount: items.length,
      itemBuilder: (context, index) {
        final isSelected = selectedIndex == index;
        return Row(
          children: [
            SvgPicture.asset(
              isSelected
                  ? 'assets/icons/checked_round.svg'
                  : 'assets/icons/n_checked_round.svg',
              width: 24,
              height: 24,
              color: isSelected
                  ? (isCorrect ? Color(0xff00B853) : OrmeeColor.error)
                  : null,
            ),
            const SizedBox(width: 8),
            B4_14px_R(
              text: items[index]!,
              color: isSelected ? OrmeeColor.gray[900] : OrmeeColor.gray[600],
            ),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 8); // 아이템 사이 간격
      },
    );
  }
}
