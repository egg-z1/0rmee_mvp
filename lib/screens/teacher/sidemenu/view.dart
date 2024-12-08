import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';
import 'package:ormee_mvp/screens/teacher/sidemenu/model.dart';
import 'package:ormee_mvp/screens/teacher/sidemenu/view_model.dart';

class TeacherSideMenu extends StatelessWidget {
  TeacherSideMenu({super.key});

  final TeacherSideMenuController controller =
      Get.put(TeacherSideMenuController());
  final LectureController _controller = Get.put(LectureController());

  @override
  Widget build(BuildContext context) {
    final String code = "3334"; // 예시용 ID
    controller.fetchTeacherSideMenu(code);

    return Obx(() {
      if (controller.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else if (controller.error.value != null) {
        return Center(
          child: Text(
            '데이터를 불러오는 중 오류가 발생했습니다.',
            style: TextStyle(color: OrmeeColor.error),
          ),
        );
      } else {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                ),
                BoxShadow(
                  color: OrmeeColor.gray[50]!,
                  spreadRadius: -0.5,
                  blurRadius: 20.0,
                  offset: Offset(-15, 15),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Column(
                children: [
                  teacherInfo(),
                  Divider(
                    height: 1.2,
                    color: OrmeeColor.gray[200],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                  myLecture(),
                  lectureList(),
                  Spacer(),
                  Divider(
                    height: 1.2,
                    color: OrmeeColor.gray[200],
                  ),
                  logout(),
                ],
              ),
            ),
          ),
        );
      }
    });
  }

  Widget teacherInfo() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Row(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: OrmeeColor.gray[100]!)),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: OrmeeColor.gray[300],
                image: DecorationImage(
                  image: controller.sidemenu.value!.closedLectures.first
                              .profileImage ==
                          null
                      ? controller.sidemenu.value!.openLectures.first
                                  .profileImage ==
                              null
                          ? AssetImage('assets/images/user-profile-03.png')
                          : NetworkImage(controller.sidemenu.value!.openLectures
                              .first.profileImage!) as ImageProvider
                      : NetworkImage(controller.sidemenu.value!.closedLectures
                          .first.profileImage!) as ImageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              T2_20px(
                text: controller.sidemenu.value == null
                    ? ''
                    : controller.sidemenu.value!.openLectures.isEmpty
                        ? (controller.sidemenu.value!.closedLectures.isEmpty
                            ? ''
                            : '${controller.sidemenu.value!.closedLectures.first.name}')
                        : '${controller.sidemenu.value!.openLectures.first.name}',
                color: OrmeeColor.primaryPuple[500],
              ),
              SizedBox(
                height: 2,
              ),
              T4_16px(
                text: '선생님',
                color: OrmeeColor.gray[500],
              )
            ],
          ),
          Spacer(),
          Container(
            child: SvgPicture.asset(
              'assets/icons/chevron-right.svg',
              color: OrmeeColor.gray[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget myLecture() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/folder.svg',
            color: OrmeeColor.gray[700],
          ),
          SizedBox(
            width: 8,
          ),
          T3_18px(
            text: '나의 강의',
            color: OrmeeColor.gray[700],
          ),
          Spacer(),
          SvgPicture.asset(
            'icons/plus.svg',
            color: OrmeeColor.gray[700],
          ),
        ],
      ),
    );
  }

  Widget lectureList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: B4_16px_M(
            text: '강의 전체',
            color: OrmeeColor.gray[600],
          ),
        ),
        Obx(() {
          // Obx로 상태 변화를 감지
          return buildLectureCards(
              controller.sidemenu.value?.openLectures ?? []);
        }),
        Obx(() {
          return buildLectureCards(
              controller.sidemenu.value?.closedLectures ?? []);
        }),
      ],
    );
  }

  Widget buildLectureCards(List<LectureModel> lectures) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: lectures.length,
      itemBuilder: (context, index) {
        final lecture = lectures[index];
        return Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: OrmeeColor.gray[100],
            onTap: () {
              _controller.updateLectureClick(index); // 상태 갱신
              print('index = ${index}');
              print('lectureClick.value = ${_controller.lecture_index.value}');
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: Row(
                children: [
                  _controller.lecture_index.value == index
                      ? Container(
                          margin: EdgeInsets.only(right: 8),
                          width: 17,
                          height: 2,
                          color: OrmeeColor.primaryPuple[500],
                        )
                      : Container(),
                  B4_16px_M(
                    text: lecture.title,
                    color: _controller.lecture_index.value == index
                        ? OrmeeColor.primaryPuple[500] // 클릭 시 색상
                        : OrmeeColor.gray[600], // 기본 색상
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget logout() {
    return Container(
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        child: Row(children: [
          SvgPicture.asset(
            'icons/plus.svg',
            color: OrmeeColor.gray[500],
          ),
          SizedBox(width: 16),
          T3_18px(
            text: '로그아웃',
            color: OrmeeColor.gray[500],
          ),
        ]));
  }
}
