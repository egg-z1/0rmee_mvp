import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:ormee_mvp/designs/OrmeeButton2.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeDialog.dart';
import 'package:ormee_mvp/designs/OrmeeDropDownButton.dart';
import 'package:ormee_mvp/designs/OrmeeFloatingPopup.dart';
import 'package:ormee_mvp/designs/OrmeeModal.dart';
import 'package:ormee_mvp/designs/OrmeeSnackbar.dart';
import 'package:ormee_mvp/designs/OrmeeTextField3.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';
import 'package:ormee_mvp/screens/teacher/header/view.dart';
import 'package:ormee_mvp/screens/teacher/home/model.dart';
import 'package:ormee_mvp/screens/teacher/home/view_model.dart';
import 'package:ormee_mvp/screens/teacher/sidemenu/view.dart';
import 'package:ormee_mvp/screens/teacher/sidemenu/view_model.dart';
import 'package:tab_container/tab_container.dart';

class TeacherHome extends StatelessWidget {
  final TeacherHomeController controller = Get.find<TeacherHomeController>();
  late final teacherCode;
  TeacherHome({super.key});

  @override
  Widget build(BuildContext context) {
    // final RxBool isPopupVisible = true.obs;
    final box = GetStorage();
    teacherCode = box.read('teacherCode');
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.only(left: 50, bottom: 30),
        child: Stack(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Title1_Bold(
                          text: "강의 관리",
                          color: OrmeeColor.grey[90],
                        ),
                        SizedBox(
                          height: 34,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TeacherHomeTabBar(teacherCode: teacherCode),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 65,
              right: 0,
              child: OrmeeButton2(
                onTap: () {
                  openOrmeeDialog(context);
                },
                text: '강의 개설',
              ),
            ),
          ],
        ),
      ),
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
            controller.fetchTeacherCreateLecture(
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
}

class TeacherHomeTabBar extends StatelessWidget {
  final TeacherHomeController controller = Get.find<TeacherHomeController>();
  String teacherCode;
  TeacherHomeTabBar({super.key, required this.teacherCode});

  @override
  Widget build(BuildContext context) {
    controller.fetchTeacherLectures(teacherCode);

    // final RxBool isPopupVisible = true.obs;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Obx(
        () => TabContainer(
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
          childPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
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
            Text('진행 중 강의 ${controller.openLectures.length}'),
            Text('이전 강의 ${controller.closedLectures.length}'),
          ],
          children: [
            controller.openLectures.isNotEmpty
                ? Lectures(0)
                : NullLecture('현재 진행 중인 강의가 없어요.'),
            controller.closedLectures.isNotEmpty
                ? Lectures(1)
                : NullLecture('이전 강의가 없어요.'),
          ],
        ),
      ),
    );
  }

  Widget NullLecture(String message) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 78),
      child: Center(
        child: Heading2_Semibold(
          text: message,
          color: OrmeeColor.gray[400],
        ),
      ),
    );
  }

  Widget Lectures(int OpenOrClose) {
    return Obx(
      () => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
          mainAxisExtent: 178,
        ),
        itemCount: OpenOrClose == 0
            ? controller.openLectures.length
            : controller.closedLectures.length,
        itemBuilder: (context, index) {
          return LectureCard(context, index, OpenOrClose);
        },
      ),
    );
  }

  Widget LectureCard(context, index, OpenOrClose) {
    final LectureListController managementController =
        Get.find<LectureListController>();
    final GetStorage box = GetStorage();
    return Obx(
      () => InkWell(
        onTap: () {
          String lectureId;
          String lectureTitle;
          if (OpenOrClose == 0) {
            lectureId = controller.openLectures[index].id;
            lectureTitle = controller.openLectures[index].title;
            managementController.lecture_index.value = index + 1;
          } else {
            lectureId = controller.closedLectures[index].id;
            lectureTitle = controller.closedLectures[index].title;
            managementController.lecture_index.value =
                (controller.openLectures.length + index + 1).toInt();
          }
          box.write('lectureId', lectureId);
          box.write('lectureTitle', lectureTitle);
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: OrmeeColor.white,
            border: Border.all(color: OrmeeColor.gray[200]!, width: 2),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/lecture.svg',
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Headline2_Semibold(
                              overflow: TextOverflow.ellipsis,
                              text: OpenOrClose == 0
                                  ? controller.openLectures[index].title
                                  : controller.closedLectures[index].title),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuButton<String>(
                    offset: Offset(5, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: OrmeeColor.gray[200]!, width: 1),
                    ),
                    elevation: 8,
                    color: OrmeeColor.white,
                    shadowColor: OrmeeColor.black.withOpacity(0.5),
                    padding: EdgeInsets.zero,
                    icon: SvgPicture.asset(
                      '/icons/dots.svg',
                      color: OrmeeColor.gray[500],
                    ),
                    onSelected: (String value) {
                      if (value == 'delete') {
                        final int lectureCode = OpenOrClose == 0
                            ? controller.openLectures[index].code
                            : controller.closedLectures[index].code;

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return OrmeeModal(
                              titleText: '강의를 삭제하시겠어요?',
                              contentText: '삭제된 강의는 복구가 불가능해요.',
                              onCancel: () {
                                Get.back();
                              },
                              onConfirm: () {
                                controller
                                    .fetchTeacherDeleteLecture(lectureCode);
                                Get.forceAppUpdate();
                                Get.back();
                              },
                            );
                          },
                        );
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: 'delete',
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: B3_18px_M(
                            text: '삭제하기',
                            color: OrmeeColor.gray[600],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     SvgPicture.asset(
              //       'assets/icons/type=user_profile.svg',
              //       color: OrmeeColor.gray[400],
              //     ),
              //     SizedBox(width: 8),
              //     T6_16px(
              //       text: '44명',
              //       color: OrmeeColor.primaryPuple[400],
              //     ),
              //   ],
              // ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/Property 1=calender, size=l.svg',
                    color: OrmeeColor.grey[30],
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: B4_16px_M(
                      overflow: TextOverflow.ellipsis,
                      text: OpenOrClose == 0
                          ? DateFormat('yyyy.MM.dd').format(DateTime.parse(
                              controller.openLectures[index].dueTime))
                          : DateFormat('yyyy.MM.dd').format(DateTime.parse(
                              controller.closedLectures[index].dueTime)),
                      color: OrmeeColor.grey[70],
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Clipboard.setData(ClipboardData(
                          text: (OpenOrClose == 0)
                              ? '${controller.openLectures[index].code}'
                              : '${controller.closedLectures[index].code}'));
                      OrmeeSnackbar.show(
                          context,
                          '강의실 코드가 복사되었어요.',
                          'assets/icons/check.svg',
                          OrmeeColor.systemGreen[5]!,
                          OrmeeColor.systemGreen[30]!);
                    },
                    child: SvgPicture.asset(
                      '/icons/copy.svg',
                      color: OrmeeColor.grey[30],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
