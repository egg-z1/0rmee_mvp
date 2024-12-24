import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/designs/OrmeeAppbar.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeSingleChoiceAnswer.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';
import 'package:ormee_mvp/screens/quiz/model.dart';

class QuizAnswer extends StatelessWidget {
  final String quizTitle;
  final List<QuizCard> quizList;

  QuizAnswer({
    super.key,
    required this.quizTitle,
    required this.quizList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OrmeeColor.white,
      appBar: OrmeeAppBar(
        title: quizTitle,
        leftIcon: SvgPicture.asset(
          'assets/icons/left.svg',
        ),
        leftAction: () => Get.back(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: ListView.separated(
          itemCount: quizList.length,
          itemBuilder: (context, index) {
            final quiz = quizList[index];

            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: OrmeeColor.gray[200]!),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  B4_14px_R(text: quiz.content),
                  SizedBox(
                    height: 15,
                  ),
                  if (quiz.type == "CHOICE") // 선택형 퀴즈
                    OrmeeSingleChoiceAnswer(
                      answer: quiz.answer,
                      items: quiz.items,
                      isCorrect: quiz.isCorrect!,
                    )
                  else
                    // 에세이형 퀴즈 처리
                    Container(
                      width: double.maxFinite,
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: OrmeeColor.gray[100],
                      ),
                      child: B4_14px_M(text: quiz.submission!),
                    ),
                  SizedBox(
                    height: 15,
                  ),
                  Answer(quiz.isCorrect!, quiz.answer)
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 13);
          },
        ),
      ),
    );
  }
}

Widget Answer(bool isCorrect, String answer) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      color: OrmeeColor.gray[100],
    ),
    child: Row(
      children: [
        B4_14px_M(text: "정답:"),
        SizedBox(
          width: 8,
        ),
        B4_14px_R(text: answer),
        Spacer(),
        if (isCorrect)
          SvgPicture.asset(
            'assets/icons/CheckCircle.svg',
            color: Color(0xFF00B853),
          )
        else
          SvgPicture.asset(
            'assets/icons/xCircle.svg',
            color: OrmeeColor.error,
          )
      ],
    ),
  );
}
