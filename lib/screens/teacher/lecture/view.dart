import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';
import 'package:ormee_mvp/screens/teacher/header/view.dart';
import 'package:ormee_mvp/screens/teacher/lecture/view_model.dart';
import 'package:ormee_mvp/screens/teacher/memo/view.dart';
import 'package:ormee_mvp/screens/teacher/quiz/view.dart';
import 'package:ormee_mvp/screens/teacher/sidemenu/view.dart';
import 'package:tab_container/tab_container.dart';

class TeacherLecture extends StatelessWidget {
  final TeacherLectureController controller =
      Get.put(TeacherLectureController());
  TeacherLecture({super.key});

  @override
  Widget build(BuildContext context) {
    controller.fetchMemoData('0a962d36-470f-47f4-8224-68f5200547a6');
    controller.fetchQuizData('0a962d36-470f-47f4-8224-68f5200547a6');
    return Scaffold(
      backgroundColor: OrmeeColor.grey[5],
      appBar: TeacherHeader(),
      body: Row(
        children: [
          SizedBox(width: 348, child: TeacherSideMenu()),
          Container(color: OrmeeColor.gray[50], width: 1),
          SizedBox(
            width: 70,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 13),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset('/icons/lecture.svg'),
                    SizedBox(width: 15),
                    Title1_Bold(text: '오르미 토익 rc'),
                  ],
                ),
                SizedBox(height: 13),
                SizedBox(height: 21),
                Obx(
                  () => Expanded(
                    child: TabContainer(
                      color: OrmeeColor.white,
                      tabsStart: 0,
                      tabsEnd: 0.3,
                      borderRadius: BorderRadius.circular(25),
                      tabBorderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.zero,
                      ),
                      childPadding: EdgeInsets.all(30),
                      selectedTextStyle: TextStyle(
                        color: OrmeeColor.purple[40],
                        fontFamily: 'Pretendard',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      unselectedTextStyle: TextStyle(
                        color: OrmeeColor.grey[40],
                        fontFamily: 'Pretendard',
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                      tabs: [
                        Text(
                            '퀴즈 ${controller.openQuizzesLength.value + controller.closedQuizzesLength.value}'),
                        Text(
                            '쪽지 ${controller.openMemosLength.value + controller.closeMemosLength.value}'),
                      ],
                      children: [
                        TeacherQuizList(),
                        TeacherMemoList(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 70,
          ),
        ],
      ),
    );
  }
}
