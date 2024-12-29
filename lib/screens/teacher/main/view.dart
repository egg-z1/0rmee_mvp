import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/screens/teacher/header/view.dart';
import 'package:ormee_mvp/screens/teacher/home/view.dart';
import 'package:ormee_mvp/screens/teacher/home/view_model.dart';
import 'package:ormee_mvp/screens/teacher/lecture/view.dart';
import 'package:ormee_mvp/screens/teacher/sidemenu/view.dart';
import 'package:ormee_mvp/screens/teacher/sidemenu/view_model.dart';

class TeacherMain extends StatelessWidget {
  final String teacherCode;
  TeacherMain({required this.teacherCode, super.key});

  LectureController managementController = Get.put(LectureController());
  final TeacherHomeController controller = Get.put(TeacherHomeController());

  late int index = managementController.lecture_index.value;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: OrmeeColor.grey[5],
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Scaffold(
        backgroundColor: OrmeeColor.grey[5],
        appBar: TeacherHeader(),
        body: Row(
          children: [
            SizedBox(
              width: 348,
              child: TeacherSideMenu(
                teacherCode: teacherCode,
              ),
            ),
            Expanded(
              child: _buildTeacherBody(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeacherBody() {
    return Obx(() {
      int currentIndex = managementController.lecture_index.value;
      if (currentIndex == 0) {
        return TeacherHome(
          teacherCode: teacherCode,
          key: ValueKey('teacherHome'),
        );
      } else {
        String lectureId;
        String lectureTitle;
        if (currentIndex <= controller.openLectures.length) {
          lectureId = controller.openLectures[currentIndex - 1].id;
          lectureTitle = controller.openLectures[currentIndex - 1].title;
        } else {
          int closedIndex = currentIndex - controller.openLectures.length - 1;
          lectureId = controller.closedLectures[closedIndex].id;
          lectureTitle = controller.closedLectures[closedIndex].title;
        }
        return TeacherLecture(
          lectureId: lectureId,
          lectureTitle: lectureTitle,
          key: ValueKey('lecture_$lectureId'),
        );
      }
    });
  }
}
