import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeModal.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';
import 'package:ormee_mvp/screens/teacher/quiz_create/view.dart';

class TeacherQuizList extends StatelessWidget {
  TeacherQuizList({super.key});
  final RxBool isRegister = true.obs;
  final RxBool isPost = false.obs;

  @override
  Widget build(BuildContext context) {
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
                        ING_quizCard(context),
                        SizedBox(height: 20),
                        Heading1_Semibold(text: '마감 퀴즈'),
                        SizedBox(height: 20),
                        END_quizCard(),
                      ],
                    )
                  : Column(
                      children: [
                        TEMP_quizCard(),
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
        Get.to(Quizcreate(lectureId: '9789'));
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

  Widget ING_quizCard(context) {
    return Column(
      children: List.generate(2, (index) {
        return Padding(
          padding:
              index == 2 - 1 ? EdgeInsets.zero : EdgeInsets.only(bottom: 20),
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
                    Headline1_Semibold(text: '10/29 퀴즈'),
                    SizedBox(height: 5),
                    Label1(
                      text: '2024.10.29 15:00',
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
                Headline1_Semibold(text: '16분'),
                SizedBox(width: 29),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return OrmeeModal(
                          titleText: '퀴즈를 게시하시겠어요?',
                          contentText: '퀴즈를 게시하면 학생들이 바로 응시할 수 있어요.',
                          onCancel: () {
                            Get.back();
                          },
                          onConfirm: () {
                            isPost.value = true;
                            Get.back();
                          },
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: OrmeeColor.purple[40]!,
                        width: 1,
                      ),
                      color: isPost.value
                          ? OrmeeColor.white
                          : OrmeeColor.purple[40],
                    ),
                    child: Headline2_Semibold(
                      text: isPost.value ? '마감하기' : '게시하기',
                      color: isPost.value
                          ? OrmeeColor.purple[40]
                          : OrmeeColor.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget END_quizCard() {
    return Column(
      children: List.generate(5, (index) {
        return Container(
          margin:
              index == 5 - 1 ? EdgeInsets.zero : EdgeInsets.only(bottom: 20),
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
                    text: '10/20 퀴즈',
                    color: OrmeeColor.grey[40],
                  ),
                  SizedBox(height: 5),
                  Label1(
                    text: '2024.10.20 15:00',
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
                text: '16분',
                color: OrmeeColor.grey[30],
              ),
              SizedBox(width: 29),
              SvgPicture.asset(
                '/icons/users.svg',
                color: OrmeeColor.grey[30],
              ),
              SizedBox(width: 5),
              Headline1_Semibold(
                text: '21',
                color: OrmeeColor.grey[40],
              ),
              Headline1_Regular(
                text: ' / 32',
                color: OrmeeColor.grey[30],
              ),
              SizedBox(width: 29),
              SvgPicture.asset(
                '/icons/bottom-m.svg',
                color: OrmeeColor.purple[40],
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget TEMP_quizCard() {
    return Column(
      children: List.generate(6, (index) {
        return Padding(
          padding:
              index == 6 - 1 ? EdgeInsets.zero : EdgeInsets.only(bottom: 20),
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
                    Headline1_Semibold(text: '10/29 퀴즈'),
                    SizedBox(height: 5),
                    Label1(
                      text: '2024.10.29 15:00',
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
                Headline1_Semibold(text: '16분'),
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
