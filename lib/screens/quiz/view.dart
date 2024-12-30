import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/designs/OrmeeAppbar.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeSingleChoiceList.dart';
import 'package:ormee_mvp/designs/OrmeeTextField2.dart';
import 'package:ormee_mvp/designs/OrmeeToast.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';
import 'package:ormee_mvp/screens/quiz/model.dart';
import 'package:ormee_mvp/screens/quiz/view_model.dart';

class Quiz extends StatelessWidget {
  final QuizController controller = Get.put(QuizController());
  final Map<String, String> submissions = {};

  final String quizId;
  final String quizTitle;
  final String author;
  final String password;
  Quiz({
    super.key,
    required this.quizId,
    required this.quizTitle,
    required this.author,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchLectureDetail(quizId).then((_) {
        // 모든 문제에 대해 빈 답안으로 초기화
        for (var quiz in controller.quizList.value) {
          submissions[quiz.id] = "";
        }
        if (controller.dueTime.value != null &&
            controller.timeLimit.value != null) {
          controller.startTimer(
            controller.dueTime.value!,
            controller.timeLimit.value!,
          );
        }
      });
    });

    return Obx(() {
      if (controller.isTimeUp.value) {
        FocusScope.of(context).unfocus();
        WidgetsBinding.instance.addPostFrameCallback(
          (_) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => customDialog(context),
            );
          },
        );
      }
      return Scaffold(
        backgroundColor: OrmeeColor.white,
        appBar: OrmeeAppBar(
          title: quizTitle,
          leftIcon: SvgPicture.asset(
            'assets/icons/left.svg',
          ),
          leftAction: () => Get.back(),
        ),
        body: controller.isLoading.value
            ? Center(child: CircularProgressIndicator()) // 로딩 중 표시
            : controller.quizList.value.isEmpty
                ? Center(child: Text('퀴즈 정보가 없습니다.')) // 퀴즈가 없을 경우
                : Stack(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        margin: EdgeInsets.only(bottom: 48),
                        child: ListView.separated(
                          itemCount: controller.quizList.value.length,
                          itemBuilder: (context, index) {
                            final quiz = controller.quizList.value[index];

                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: OrmeeColor.gray[200]!),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  B4_14px_R(text: quiz.content),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  if (quiz.type == "CHOICE") // 선택형 퀴즈
                                    OrmeeSingleChoiceList(
                                      items: quiz.items
                                          .where((item) => item != null)
                                          .map((item) => item ?? "")
                                          .toList(), // Filter out nulls
                                      onSelectionChanged: (selectedIndex) {
                                        print(
                                            "Selected Index: ${quiz.items[selectedIndex]}");
                                        submissions[quiz.id] =
                                            quiz.items[selectedIndex]!;
                                      },
                                    )
                                  else
                                    // 에세이형 퀴즈 처리
                                    OrmeeTextField2(
                                      hintText: '답을 입력해주세요.',
                                      controller: TextEditingController(),
                                      textInputAction: TextInputAction.done,
                                      onSelectionUnfocused: (value) {
                                        print('Unfocused with value: $value');
                                        submissions[quiz.id] = value;
                                      },
                                    )
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(height: 13);
                          },
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 73,
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFFF03A2E), // #F03A2E
                                  Color(0xFFF87B60), // #F87B60
                                ],
                                begin: Alignment.topLeft, // 그라데이션 시작 지점
                                end: Alignment.bottomRight, // 그라데이션 끝 지점
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Obx(() => T4_16px(
                                  text: controller.remainingTime.value,
                                  color: OrmeeColor.white,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
        bottomSheet: GestureDetector(
          onTap: () async {
            final submissionList = getSubmissionsList();
            final submission = QuizSubmission(
              author: author,
              password: password,
              submissions: submissionList,
            );
            try {
              await controller.submitQuiz(submission);
              OrmeeToast.show(context, '시험 응시가 완료되었습니다.');
              Get.until((route) =>
                  route.settings.name?.startsWith('/ClassCode/') ?? false);
            } catch (e) {
              OrmeeToast.show(context, '제출을 다시 시도해주세요.');
            }
          },
          child: Container(
            width: double.maxFinite,
            color: OrmeeColor.white,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 48,
              decoration: BoxDecoration(
                color: OrmeeColor.primaryPuple[400],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: T4_16px(
                  text: "제출하기",
                  color: OrmeeColor.white,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  List<Map<String, dynamic>> getSubmissionsList() {
    return submissions.entries
        .map((entry) => {
              "problemId": int.parse(entry.key),
              "content": entry.value,
            })
        .toList();
  }

  Widget customDialog(BuildContext context) {
    return Dialog(
        child: Container(
      height: 358,
      width: 273,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 12.5,
          ),
          T2_20px(text: "시험 끝!", color: OrmeeColor.gray[900]),
          SizedBox(
            height: 5,
          ),
          B4_14px_R(text: "제한시간이 끝났어요", color: OrmeeColor.gray[500]),
          SizedBox(
            height: 25.5,
          ),
          Image.asset("assets/images/phoneOrmee.png"),
          SizedBox(
            height: 13,
          ),
          GestureDetector(
            onTap: () async {
              final submissionList = getSubmissionsList();
              final submission = QuizSubmission(
                author: author,
                password: password,
                submissions: submissionList,
              );
              try {
                await controller.submitQuiz(submission);
                controller.isTimeUp.value = false;
                Get.until((route) =>
                    route.settings.name?.startsWith('/ClassCode/') ?? false);
                OrmeeToast.show(context, '시험 응시가 완료되었습니다.');
              } catch (e) {
                OrmeeToast.show(context, '제출을 다시 시도해주세요.');
              }
            },
            child: Container(
                height: 43,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: OrmeeColor.primaryPuple[400],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: T4_16px(
                    text: "제출하기",
                    color: OrmeeColor.white,
                  ),
                )),
          ),
          SizedBox(
            height: 6,
          ),
        ],
      ),
    ));
  }
}
