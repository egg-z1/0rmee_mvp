import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';
import 'package:ormee_mvp/screens/teacher/lecture/view_model.dart';
import 'package:ormee_mvp/screens/teacher/memo/view.dart';
import 'package:ormee_mvp/screens/teacher/quiz/view.dart';
import 'package:tab_container/tab_container.dart';

class TeacherLecture extends StatelessWidget {
  final TeacherLectureController controller =
      Get.put(TeacherLectureController());
  late final lectureId;
  late final lectureTitle;
  TeacherLecture({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    lectureId = box.read('lectureId');
    lectureTitle = box.read('lectureTitle');
    controller.fetchMemoData(lectureId);
    controller.fetchQuizData(lectureId);
    return Container(
      padding: EdgeInsets.only(left: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 13),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('/icons/lecture.svg'),
              SizedBox(width: 15),
              Title1_Bold(text: lectureTitle),
            ],
          ),
          SizedBox(height: 34),
          Obx(
            () => Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 30),
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
                  children: [TeacherQuizList(), TeacherMemoList()],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
