import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';
import 'package:ormee_mvp/screens/teacher/quiz_detail/model.dart';

class OrmeeProblemCard extends StatelessWidget {
  ProblemDetail problem;
  int currentIndex;
  int totalIndex;
  OrmeeProblemCard({super.key, required this.problem, required this.currentIndex, required this.totalIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: OrmeeColor.white,
        borderRadius: BorderRadius.circular(25)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Heading1_Semibold(text: '${currentIndex + 1}', color: OrmeeColor.grey[90],),
                  const SizedBox(width: 5),
                  Heading1_Regular(text: '/', color: OrmeeColor.grey[30],),
                  const SizedBox(width: 5),
                  Heading1_Regular(text: '$totalIndex', color: OrmeeColor.grey[30],),
                ],
              ),
              // GestureDetector(
              //   onTap: () {
              //     // problem.id로 답변 수정 요청 보내기
              //   },
              //   child: Container(
              //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              //     decoration: BoxDecoration(
              //       border: Border.all(color: OrmeeColor.grey[20]!),
              //       borderRadius: BorderRadius.circular(10)
              //     ),
              //     child: Center(
              //       child: Headline2_Semibold(text: '수정하기', color: OrmeeColor.grey[90]),
              //     ),
              //   ),
              // )
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: Body_Regular(text: problem.content),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: OrmeeColor.grey[5],
              borderRadius: BorderRadius.circular(10)
            ),
            child: problem.type == 'CHOICE'? ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: problem.items.length,
                itemBuilder: (context, index) {
                  bool isAnswer = problem.items[index] == problem.answer;
                  return Row(
                    children: [
                      isAnswer? SvgPicture.asset('assets/icons/checked_round.svg', color: OrmeeColor.purple[40],) : SvgPicture.asset('assets/icons/default_round.svg'),
                      const SizedBox(width: 16),
                      isAnswer? Headline1_Semibold(text: problem.items[index], color: OrmeeColor.purple[40]) : Body_Regular(text: problem.items[index], color: OrmeeColor.grey[90]),
                      const SizedBox(width: 10),
                      isAnswer? Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                            color: OrmeeColor.purple[5],
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: Label1(text: '정답', color: OrmeeColor.purple[40]),
                      )
                          : const SizedBox()
                    ],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 10)
            )
                : Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                      color: OrmeeColor.purple[5],
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Label1(text: '정답', color: OrmeeColor.purple[40]),
                ),
                const SizedBox(width: 10),
                Headline1_Semibold(text: problem.answer, color: OrmeeColor.purple[40])
              ],
            )
          )
        ],
      ),
    );
  }

}