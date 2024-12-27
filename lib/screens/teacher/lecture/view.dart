import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';
import 'package:ormee_mvp/screens/teacher/header/view.dart';
import 'package:ormee_mvp/screens/teacher/quiz/view.dart';
import 'package:ormee_mvp/screens/teacher/sidemenu/view.dart';
import 'package:tab_container/tab_container.dart';

class TeacherLecture extends StatelessWidget {
  const TeacherLecture({super.key});

  @override
  Widget build(BuildContext context) {
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
                Expanded(
                  child: TabContainer(
                    color: OrmeeColor.white,
                    tabsStart: 0,
                    tabsEnd: 0.3,
                    borderRadius: BorderRadius.circular(25),
                    tabBorderRadius: BorderRadius.circular(25),
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
                    tabs: const [
                      Text('퀴즈'),
                      Text('쪽지'),
                    ],
                    children: [
                      TeacherQuizList(),
                      Container(
                        height: 50,
                      ),
                    ],
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
