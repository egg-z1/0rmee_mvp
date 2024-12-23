import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';

// quiz statistics info dialog 사용법
// void openOrmeeQuizInfo() {
//   overlayEntry = OverlayEntry(
//     builder: (context) => OrmeeQuizInfo(
//       currentIndex: 2,
//       totalIndex: 24,
//       problem:
//           '1. Four football matches will be broadcast live on three major stations _______ this weekend.',
//       answerList: ["nation", "bation", "cation"],
//       answerUserList: [16, 12, 18],
//       answerIndex: 0,
//       layerLink: layerLink,
//       onSelect: (selected) {
//         overlayEntry?.remove();
//         overlayEntry = null;
//       },
//     ),
//   );
//   Overlay.of(context).insert(overlayEntry!);
// }

class OrmeeQuizInfo extends StatelessWidget {
  final int currentIndex;
  final int totalIndex;
  final String problem;
  final List<String> answerList;
  final List<int> answerUserList;
  final int answerIndex;
  final LayerLink layerLink;
  final void Function(String selected)? onSelect;

  const OrmeeQuizInfo({
    super.key,
    required this.currentIndex,
    required this.totalIndex,
    required this.problem,
    required this.answerList,
    required this.answerUserList,
    required this.answerIndex,
    required this.layerLink,
    this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final labels = ['a', 'b', 'c', 'd', 'e'];

    return Positioned(
      width: 547,
      child: CompositedTransformFollower(
        link: layerLink,
        offset: const Offset(200, -200),
        showWhenUnlinked: false,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(0, 0),
                blurRadius: 24,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Material(
            color: OrmeeColor.white,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      T3_18px(
                        text: currentIndex.toString(),
                        color: OrmeeColor.gray[800],
                      ),
                      T3_18px(
                        text: '/${totalIndex}',
                        color: OrmeeColor.gray[500],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          onSelect?.call("");
                        },
                        icon: SvgPicture.asset(
                          "assets/icons/type=x.svg",
                          color: OrmeeColor.gray[500],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(24),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: OrmeeColor.gray[100],
                    ),
                    child: B3_18px_M(
                      text: problem,
                      color: OrmeeColor.gray[900],
                    ),
                  ),
                  const SizedBox(height: 24),
                  ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemCount: answerList.length,
                    itemBuilder: (context, index) {
                      final option = answerList[index];

                      final isAnswer = answerIndex == index;

                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              isAnswer
                                  ? "assets/icons/checked_round.svg"
                                  : "assets/icons/default_round.svg",
                              width: 24,
                              height: 24,
                              color: isAnswer
                                  ? OrmeeColor.primaryPuple[400]
                                  : null,
                            ),
                            const SizedBox(width: 10),
                            B3_18px_M(
                              text: "${labels[index]}. $option",
                              color: isAnswer
                                  ? OrmeeColor.primaryPuple[400]
                                  : OrmeeColor.gray[600],
                            ),
                            if (isAnswer)
                              Container(
                                margin: const EdgeInsets.only(left: 6),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: OrmeeColor.primaryPuple[10],
                                ),
                                child: B4_14px_M(
                                  text: '정답',
                                  color: OrmeeColor.primaryPuple[400],
                                ),
                              ),
                            const SizedBox(width: 8),
                            SvgPicture.asset(
                              "assets/icons/user.svg",
                              color: OrmeeColor.gray[400],
                            ),
                            const SizedBox(width: 2.4),
                            T4_16px(
                              text: answerUserList[index].toString(),
                              color: OrmeeColor.gray[600],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
