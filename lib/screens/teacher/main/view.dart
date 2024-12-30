import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/screens/teacher/header/view.dart';
import 'package:ormee_mvp/screens/teacher/home/view.dart';
import 'package:ormee_mvp/screens/teacher/home/view_model.dart';
import 'package:ormee_mvp/screens/teacher/lecture/view.dart';
import 'package:ormee_mvp/screens/teacher/quiz_detail/view.dart';
import 'package:ormee_mvp/screens/teacher/sidemenu/view.dart';
import 'package:ormee_mvp/screens/teacher/sidemenu/view_model.dart';

class TeacherMain extends StatelessWidget {
  TeacherMain({super.key});
  LectureController managementController = Get.find<LectureController>();
  TeacherHomeController controller = Get.find<TeacherHomeController>();

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
            Container(
              padding: EdgeInsets.only(bottom: 30),
              width: 300,
              child: TeacherSideMenu(),
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
    final box = GetStorage();
    return Obx(() {
      if (managementController.lecture_index.value == 0) {
        return TeacherHome(
          key: ValueKey('teacherHome'),
        );
      } else {
        String lectureId;
        String lectureTitle;
        if (managementController.lecture_index.value <= controller.openLectures.length) {
          lectureId = controller.openLectures[managementController.lecture_index.value - 1].id;
          lectureTitle = controller.openLectures[managementController.lecture_index.value - 1].title;
        } else {
          int closedIndex = managementController.lecture_index.value - controller.openLectures.length - 1;
          lectureId = controller.closedLectures[closedIndex].id;
          lectureTitle = controller.closedLectures[closedIndex].title;
        }
        box.write('lectureId', lectureId);
        box.write('lectureTitle', lectureTitle);
        return TeacherLecture(
          key: ValueKey('lecture_$lectureId'),
        );
      }
    });
  }
}
