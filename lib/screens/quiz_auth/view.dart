import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/designs/OrmeeAppbar.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeTextField1.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';
import 'package:ormee_mvp/screens/quiz/view.dart';
import 'package:ormee_mvp/screens/quiz_auth/view_model.dart';
import 'package:ormee_mvp/screens/quiz_result/view.dart';

class QuizAuth extends StatelessWidget {
  final String quizId;
  final String quizTitle;
  final bool quizAvailable;

  const QuizAuth({
    super.key,
    required this.quizId,
    required this.quizTitle,
    required this.quizAvailable,
  });

  @override
  Widget build(BuildContext context) {
    final controller_id = QuizAuthController();
    final controller_pw = QuizAuthController();

    return SafeArea(
      child: Scaffold(
        backgroundColor: OrmeeColor.white,
        appBar: OrmeeAppBar(
          title: "6주차 퀴즈",
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, 32, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              T4_16px(text: "응시자 정보 입력"),
              SizedBox(
                height: 12,
              ),
              B4_14px_M(text: "이름"),
              SizedBox(
                height: 4,
              ),
              OrmeeTextField1(
                hintText: "이름을 입력하세요.",
                controller: controller_id.textController,
                focusNode: controller_id.focusNode,
                textInputAction: TextInputAction.next,
                isTextNotEmpty: controller_id.isTextFieldNotEmpty,
                onFieldSubmitted: (term) {
                  controller_id.focusNode.nextFocus();
                },
              ),
              SizedBox(
                height: 16,
              ),
              B4_14px_M(text: "비밀번호"),
              SizedBox(
                height: 4,
              ),
              OrmeeTextField1(
                hintText: '비밀번호를 입력하세요.',
                controller: controller_pw.textController,
                focusNode: controller_pw.focusNode,
                textInputAction: TextInputAction.done,
                isTextNotEmpty: controller_pw.isTextFieldNotEmpty,
                isPassword: true,
                onFieldSubmitted: (term) {
                  controller_pw.focusNode.unfocus();
                  print(controller_id.textController.text);
                  print(controller_pw.textController.text);
                },
              ),
            ],
          ),
        ),
        bottomSheet: Obx(
          () {
            return GestureDetector(
              onTap: (controller_id.isTextFieldNotEmpty.value &&
                      controller_pw.isTextFieldNotEmpty.value)
                  ? () {
                      if (quizAvailable)
                        Get.to(() => Quiz(
                              quizId: quizId,
                              quizTitle: quizTitle,
                              author: controller_id.textController.text,
                              password: controller_pw.textController.text,
                            ));
                      else
                        Get.to(QuizResult(
                          quizId: quizId,
                          quizTitle: quizTitle,
                          author: controller_id.textController.text,
                          password: controller_pw.textController.text,
                        ));
                    }
                  : null,
              child: Container(
                width: double.maxFinite,
                color: OrmeeColor.white,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  height: 48,
                  decoration: BoxDecoration(
                    color: (controller_id.isTextFieldNotEmpty.value &&
                            controller_pw.isTextFieldNotEmpty.value)
                        ? OrmeeColor.primaryPuple[400]
                        : OrmeeColor.gray[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: T4_16px(
                      text: quizAvailable ? "응시하기" : "결과보기",
                      color: OrmeeColor.white,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
