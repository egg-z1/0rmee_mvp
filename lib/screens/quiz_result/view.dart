import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/designs/OrmeeAppbar.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';
import 'package:ormee_mvp/screens/quiz_answer/view.dart';
import 'package:ormee_mvp/screens/quiz_result/view_model.dart';

class QuizResult extends StatelessWidget {
  final QuizResultController controller = Get.put(QuizResultController());

  final String quizId;
  final String quizTitle;
  final String author;
  final String password;

  QuizResult({
    super.key,
    required this.quizId,
    required this.quizTitle,
    required this.author,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchQuizResult(quizId, author, password);
    });
    return Scaffold(
      backgroundColor: OrmeeColor.white,
      appBar: OrmeeAppBar(
        title: quizTitle,
        leftIcon: SvgPicture.asset(
          'assets/icons/left.svg',
        ),
        leftAction: () => Get.back(),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        final result = controller.lectureDetail.value;
        if (result == null) {
          return Center(child: Text('No quiz result available'));
        }
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              T4_16px(text: "${quizTitle} 결과"),
              SizedBox(
                height: 12,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: OrmeeColor.gray[200]!,
                    ),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    T4_16px(
                      text: "맞은 문항",
                      color: OrmeeColor.gray[500],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        B3_18px_M(
                          text: "${result.correct.toString()} / ",
                          color: OrmeeColor.gray[900],
                        ),
                        B3_18px_M(
                          text: result.problemDtos.length.toString(),
                          color: OrmeeColor.gray[400],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => QuizAnswer(
                      quizTitle: quizTitle, quizList: result.problemDtos));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: OrmeeColor.gray[200]!,
                      ),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      B4_14px_M(text: "퀴즈 정답 보기"),
                      Spacer(),
                      SvgPicture.asset(
                        'assets/icons/right.svg',
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
