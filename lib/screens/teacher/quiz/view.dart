import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeModal.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';
import 'package:ormee_mvp/screens/teacher/quiz/view_model.dart';
import 'package:ormee_mvp/screens/teacher/quiz_create/view.dart';

class TeacherQuizList extends StatelessWidget {
  final TeacherQuizController controller = Get.put(TeacherQuizController());
  TeacherQuizList({super.key});
  final RxBool isRegister = true.obs;

  @override
  Widget build(BuildContext context) {
    controller.fetchTeacherQuizList('0a962d36-470f-47f4-8224-68f5200547a6');
    controller.fetchTeacherQuizDraft('0a962d36-470f-47f4-8224-68f5200547a6');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        header(),
        SizedBox(height: 45),
        Obx(
          () => Expanded(
            child: SingleChildScrollView(
              child: isRegister.value
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Heading1_Semibold(text: '진행 퀴즈'),
                        SizedBox(height: 20),
                        controller.openQuizzes.isNotEmpty
                            ? ING_quizCard(context)
                            : NULL_quizCard('현재 진행 중인 퀴즈가 없어요.'),
                        SizedBox(height: 20),
                        Heading1_Semibold(text: '마감 퀴즈'),
                        SizedBox(height: 20),
                        controller.closedQuizzes.isNotEmpty
                            ? END_quizCard()
                            : NULL_quizCard('현재 마감한 퀴즈가 없어요.'),
                      ],
                    )
                  : Column(
                      children: [
                        controller.draftQuizzes.isNotEmpty
                            ? TEMP_quizCard()
                            : NULL_quizCard('현재 임시 저장한 퀴즈가 없어요.'),
                      ],
                    ),
            ),
          ),
        ),
      ],
    );
  }

  header() {
    return Obx(
      () => Row(
        children: [
          InkWell(
            onTap: () {
              isRegister.value = true;
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color:
                    isRegister.value ? OrmeeColor.grey[60] : OrmeeColor.white,
                border: Border.all(
                  width: 1,
                  color: isRegister.value
                      ? OrmeeColor.grey[60]!
                      : OrmeeColor.grey[20]!,
                ),
              ),
              child: Heading1_Semibold(
                text: '등록',
                color:
                    isRegister.value ? OrmeeColor.white : OrmeeColor.grey[40],
              ),
            ),
          ),
          SizedBox(width: 10),
          InkWell(
            onTap: () {
              isRegister.value = false;
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color:
                    isRegister.value ? OrmeeColor.white : OrmeeColor.grey[60],
                border: Border.all(
                  width: 1,
                  color: isRegister.value
                      ? OrmeeColor.grey[20]!
                      : OrmeeColor.grey[60]!,
                ),
              ),
              child: Heading1_Semibold(
                text: '임시저장',
                color:
                    isRegister.value ? OrmeeColor.grey[40] : OrmeeColor.white,
              ),
            ),
          ),
          Spacer(),
          createQuizButton(),
        ],
      ),
    );
  }

  createQuizButton() {
    return InkWell(
      onTap: () {
        Get.to(Quizcreate(lectureId: '9789', isUpdate: false));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: OrmeeColor.purple[40]!.withOpacity(0.4),
              offset: Offset(2, 4),
              blurRadius: 12.5,
            ),
          ],
          color: OrmeeColor.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              '/icons/plus.svg',
              color: OrmeeColor.purple[40],
            ),
            SizedBox(width: 10),
            Headline1_Bold(
              text: '퀴즈 생성',
              color: OrmeeColor.purple[40],
            ),
          ],
        ),
      ),
    );
  }

  Widget NULL_quizCard(text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 78),
      child: Center(
          child: Heading2_Semibold(
        text: text,
        color: OrmeeColor.grey[30],
      )),
    );
  }

  Widget ING_quizCard(context) {
    return Obx(
      () => Column(
        children: List.generate(controller.openQuizzes.length, (index) {
          return Padding(
            padding: index == controller.openQuizzes.length - 1
                ? EdgeInsets.zero
                : EdgeInsets.only(bottom: 20),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
              decoration: BoxDecoration(
                border: Border.all(color: OrmeeColor.grey[10]!, width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 9),
                    decoration: BoxDecoration(
                      color: OrmeeColor.purple[3],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(
                      '/icons/ing_quiz.svg',
                      color: OrmeeColor.purple[40],
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Headline1_Semibold(
                          text: controller.openQuizzes[index].quizName),
                      SizedBox(height: 5),
                      Label1(
                        text: controller.openQuizzes[index].quizDate,
                        color: OrmeeColor.grey[30],
                      ),
                    ],
                  ),
                  Spacer(),
                  SvgPicture.asset(
                    '/icons/timer.svg',
                    color: OrmeeColor.purple[40],
                  ),
                  SizedBox(width: 5),
                  Headline1_Semibold(
                      text: '${controller.openQuizzes[index].timeLimit}분'),
                  SizedBox(width: 29),
                  InkWell(
                    onTap: () {
                      controller.openQuizzes[index].quizAvailable
                          ? showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return OrmeeModal(
                                  titleText: '퀴즈를 마감하시겠어요?',
                                  contentText: '퀴즈를 마감하면 재게시가 불가능해요.',
                                  onCancel: () {
                                    Get.back();
                                  },
                                  onConfirm: () {
                                    controller.fetchTeacherQuizClose(
                                        controller.openQuizzes[index].id);
                                    Get.back();
                                  },
                                );
                              },
                            )
                          : showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return OrmeeModal(
                                  titleText: '퀴즈를 게시하시겠어요?',
                                  contentText: '퀴즈를 게시하면 학생들이 바로 응시할 수 있어요.',
                                  onCancel: () {
                                    Get.back();
                                  },
                                  onConfirm: () {
                                    controller.fetchTeacherQuizOpen(
                                        controller.openQuizzes[index].id);
                                    Get.back();
                                  },
                                );
                              },
                            );
                    },
                    child: Obx(
                      () => Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: OrmeeColor.purple[40]!,
                            width: 1,
                          ),
                          color: controller.openQuizzes[index].quizAvailable
                              ? OrmeeColor.white
                              : OrmeeColor.purple[40],
                        ),
                        child: Headline2_Semibold(
                          text: controller.openQuizzes[index].quizAvailable
                              ? '마감하기'
                              : '게시하기',
                          color: controller.openQuizzes[index].quizAvailable
                              ? OrmeeColor.purple[40]
                              : OrmeeColor.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget END_quizCard() {
    RxList<bool> isClick =
        List<bool>.filled(controller.closedQuizzes.length, true).obs;
    return Obx(
      () => Column(
        children: List.generate(controller.closedQuizzes.length, (index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  isClick[index] = !isClick[index];
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: isClick[index]
                            ? OrmeeColor.grey[10]!
                            : OrmeeColor.purple[40]!,
                        width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Headline1_Semibold(
                            text: controller.closedQuizzes[index].quizName,
                            color: isClick[index]
                                ? OrmeeColor.grey[40]
                                : OrmeeColor.grey[90],
                          ),
                          SizedBox(height: 5),
                          Label1(
                            text: controller.closedQuizzes[index].quizDate,
                            color: OrmeeColor.grey[30],
                          ),
                        ],
                      ),
                      Spacer(),
                      SvgPicture.asset(
                        '/icons/timer.svg',
                        color: OrmeeColor.grey[30],
                      ),
                      SizedBox(width: 5),
                      Headline1_Semibold(
                        text: '${controller.closedQuizzes[index].timeLimit}분',
                        color: OrmeeColor.grey[30],
                      ),
                      SizedBox(width: 29),
                      SvgPicture.asset(
                        '/icons/users.svg',
                        color: OrmeeColor.grey[30],
                      ),
                      SizedBox(width: 5),
                      Headline1_Semibold(
                        text: '${controller.closedQuizzes[index].submitCount}',
                        color: isClick[index]
                            ? OrmeeColor.grey[40]
                            : OrmeeColor.grey[60],
                      ),
                      // Headline1_Regular(
                      //   text: ' / 32',
                      //   color: OrmeeColor.grey[30],
                      // ),
                      SizedBox(width: 29),
                      isClick[index]
                          ? SvgPicture.asset(
                              '/icons/bottom-m.svg',
                              color: OrmeeColor.purple[40],
                            )
                          : SvgPicture.asset(
                              '/icons/top-m.svg',
                              color: OrmeeColor.purple[40],
                            ),
                    ],
                  ),
                ),
              ),
              isClick[index] ? Container() : SizedBox(height: 10),
              isClick[index] ? Container() : Statistic_quizCard(),
              SizedBox(height: 20),
            ],
          );
        }),
      ),
    );
  }

  Widget Statistic_quizCard() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      decoration: BoxDecoration(
        color: OrmeeColor.grey[5],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 74,
                child: Center(
                  child: Label1(
                    text: '순위',
                    color: OrmeeColor.grey[50],
                  ),
                ),
              ),
              SizedBox(width: 55),
              SizedBox(
                width: 89,
                child: Center(
                  child: Label1(
                    text: '문항',
                    color: OrmeeColor.grey[50],
                  ),
                ),
              ),
              SizedBox(width: 55),
              SizedBox(
                width: 89,
                child: Center(
                  child: Label1(
                    text: '오답 비율',
                    color: OrmeeColor.grey[50],
                  ),
                ),
              ),
              SizedBox(width: 55),
              SizedBox(
                width: 89,
                child: Center(
                  child: Label1(
                    text: '오답 인원',
                    color: OrmeeColor.grey[50],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Column(
            children: List.generate(4, (index) {
              return Container(
                padding: index == 4 - 1
                    ? EdgeInsets.zero
                    : EdgeInsets.only(bottom: 5),
                child: Row(
                  children: [
                    SizedBox(
                      width: 74,
                      child: Center(
                        child: Headline2_Semibold(
                          text: '${index + 1}',
                          color: OrmeeColor.grey[50],
                        ),
                      ),
                    ),
                    SizedBox(width: 55),
                    SizedBox(
                      width: 89,
                      child: Center(
                        child: Headline2_Semibold(
                          text: '문항 ${index + 1}',
                          color: OrmeeColor.purple[40],
                          textDecoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    SizedBox(width: 55),
                    SizedBox(
                      width: 89,
                      child: Center(
                        child: Headline2_Semibold(
                          text: '50%',
                          color: OrmeeColor.grey[60],
                        ),
                      ),
                    ),
                    SizedBox(width: 55),
                    SizedBox(
                      width: 89,
                      child: Center(
                        child: Headline2_Semibold(
                          text: '10',
                          color: OrmeeColor.grey[60],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget TEMP_quizCard() {
    return Column(
      children: List.generate(controller.draftQuizzes.length, (index) {
        return Padding(
          padding: index == controller.draftQuizzes.length - 1
              ? EdgeInsets.zero
              : EdgeInsets.only(bottom: 20),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
            decoration: BoxDecoration(
              border: Border.all(color: OrmeeColor.grey[10]!, width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Headline1_Semibold(
                        text: controller.draftQuizzes[index].quizName),
                    SizedBox(height: 5),
                    Label1(
                      text: controller.draftQuizzes[index].quizDate,
                      color: OrmeeColor.grey[30],
                    ),
                  ],
                ),
                Spacer(),
                SvgPicture.asset(
                  '/icons/timer.svg',
                  color: OrmeeColor.purple[40],
                ),
                SizedBox(width: 5),
                Headline1_Semibold(
                    text: '${controller.draftQuizzes[index].timeLimit}분'),
                SizedBox(width: 29),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: OrmeeColor.purple[40]!,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: OrmeeColor.white,
                  ),
                  child: Headline2_Semibold(
                    text: '수정하기',
                    color: OrmeeColor.purple[40],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
