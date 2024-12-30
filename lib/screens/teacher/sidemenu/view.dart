import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeDialog.dart';
import 'package:ormee_mvp/designs/OrmeeDropDownButton.dart';
import 'package:ormee_mvp/designs/OrmeeModal.dart';
import 'package:ormee_mvp/designs/OrmeeTextField3.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';
import 'package:ormee_mvp/screens/teacher/home/model.dart';
import 'package:ormee_mvp/screens/teacher/home/view_model.dart';
import 'package:ormee_mvp/screens/teacher/sidemenu/model.dart';
import 'package:ormee_mvp/screens/teacher/sidemenu/view_model.dart';
import 'package:ormee_mvp/screens/teacher/sign_in/view.dart';

class TeacherSideMenu extends StatelessWidget {
  late final teacherCode;
  TeacherSideMenu({super.key});

  final TeacherSideMenuController controller =
      Get.put(TeacherSideMenuController());
  final LectureController _controller = Get.find<LectureController>();

  final TeacherHomeController controller1 = Get.find<TeacherHomeController>();

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    teacherCode = box.read('teacherCode');
    controller.fetchTeacherSideMenu(teacherCode);
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
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            decoration: BoxDecoration(
              color: OrmeeColor.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                teacherInfo(),
                SizedBox(height: 50),
                myLecture(context),
                SizedBox(height: 15),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 33,
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              child:
                                  SingleChildScrollView(child: lectureList()),
                            ),
                            Positioned(
                              left: 0,
                              top: 0,
                              bottom: 0,
                              child: Container(
                                width: 1,
                                color: OrmeeColor.grey[10],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Divider(
                  height: 1.2,
                  color: OrmeeColor.gray[200],
                ),
                SizedBox(height: 25),
                logout(context),
              ],
            ),
          ),
        );
      }
    });
  }

  Widget teacherInfo() {
    return Container(
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: OrmeeColor.gray[100]!)),
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: OrmeeColor.grey[10],
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
            width: 11,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Headline1_Semibold(
                text: controller.sidemenu.value == null
                    ? ''
                    : controller.sidemenu.value!.openLectures.isEmpty
                        ? (controller.sidemenu.value!.closedLectures.isEmpty
                            ? ''
                            : '${controller.sidemenu.value!.closedLectures.first.name}')
                        : '${controller.sidemenu.value!.openLectures.first.name}',
                color: OrmeeColor.grey[90],
              ),
              SizedBox(
                height: 5,
              ),
              Headline2_Regular(
                text: '선생님',
                color: OrmeeColor.grey[40],
              )
            ],
          ),
          Spacer(),
          Container(
            child: SvgPicture.asset(
              '/icons/chevron-right.svg',
              color: OrmeeColor.grey[30],
            ),
          ),
        ],
      ),
    );
  }

  Widget myLecture(context) {
    return Row(
      children: [
        SvgPicture.asset(
          '/icons/mylecture.svg',
        ),
        SizedBox(
          width: 13,
        ),
        Headline1_Semibold(
          text: '나의 강의',
          color: OrmeeColor.grey[90],
        ),
        Spacer(),
        InkWell(
          onTap: () {
            openOrmeeDialog(context);
          },
          child: SvgPicture.asset(
            'icons/plus.svg',
            color: OrmeeColor.grey[30],
          ),
        ),
      ],
    );
  }

  void openOrmeeDialog(BuildContext context) {
    final TextFieldController titleController = TextFieldController();
    final DropdownController dropdownController1 = DropdownController();
    final DropdownController dropdownController2 = DropdownController();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OrmeeDialog(
          titleText: '신규 강의 개설',
          contentText: '강의 명',
          titleController: titleController,
          dropdownController1: dropdownController1,
          dropdownController2: dropdownController2,
          haveDropdown: true,
          onCancel: () {
            Get.back();
          },
          onConfirm: () async {
            controller1.fetchTeacherCreateLecture(
                teacherCode,
                LectureCreateModel(
                  title: titleController.textEditingController.text,
                  openTime: getLocalDateTimeFromMonthString(
                      dropdownController1.selectedMonth.value),
                  dueTime: getLocalDateTimeFromMonthString(
                      dropdownController2.selectedMonth.value),
                ));
            Get.forceAppUpdate();
            Get.back();
          },
        );
      },
    );
  }

  DateTime getLocalDateTimeFromMonthString(String monthString) {
    int currentYear = DateTime.now().year;
    String monthNumberString = monthString.replaceAll(RegExp(r'[^0-9]'), '');
    int month = int.parse(monthNumberString);
    return DateTime(currentYear, month, 1, 0, 0, 0);
  }

  Widget lectureList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            _controller.updateLectureClick(0);
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 7),
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
            child: _controller.lecture_index.value == 0
                ? Headline2_Semibold(
                    text: '강의 관리',
                    color: OrmeeColor.purple[40],
                  )
                : Headline2_Regular(
                    text: '강의 관리',
                    color: OrmeeColor.grey[40],
                  ),
          ),
        ),
        Obx(() {
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
    return ListView.separated(
      shrinkWrap: true,
      itemCount: lectures.length,
      separatorBuilder: (context, index) {
        return Container(
          height: 7,
        );
      },
      itemBuilder: (context, index) {
        final lecture = lectures[index];
        return InkWell(
          onTap: () {
            _controller.updateLectureClick(index + 1);
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
            child: Wrap(
              children: [
                _controller.lecture_index.value == index + 1
                    ? Headline2_Semibold(
                        text: lecture.title,
                        overflow: TextOverflow.ellipsis,
                        color: OrmeeColor.purple[40],
                      )
                    : Headline2_Regular(
                        text: lecture.title,
                        overflow: TextOverflow.ellipsis,
                        color: OrmeeColor.grey[40],
                      ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget logout(context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return OrmeeModal(
              titleText: '로그아웃 하시겠어요?',
              onCancel: () {
                Get.back();
              },
              onConfirm: () {
                Get.offAll(TeacherSignIn());
              },
            );
          },
        );
      },
      child: Row(
        children: [
          SvgPicture.asset(
            'icons/logout.svg',
            color: OrmeeColor.grey[30],
          ),
          SizedBox(width: 10),
          Headline2_Semibold(
            text: '로그아웃',
            color: OrmeeColor.grey[60],
          ),
        ],
      ),
    );
  }
}
