import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/designs/OrmeeButton2.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeDialog.dart';
import 'package:ormee_mvp/designs/OrmeeDropDownButton.dart';
import 'package:ormee_mvp/designs/OrmeeFloatingPopup.dart';
import 'package:ormee_mvp/designs/OrmeeTextField3.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';
import 'package:ormee_mvp/screens/teacher/header/view.dart';
import 'package:ormee_mvp/screens/teacher/sidemenu/view.dart';

class TeacherHome extends StatelessWidget {
  const TeacherHome({super.key});

  @override
  Widget build(BuildContext context) {
    final RxBool isPopupVisible = true.obs;

    return Scaffold(
      backgroundColor: OrmeeColor.white,
      appBar: TeacherHeader(),
      body: Row(
        children: [
          SizedBox(width: 348, child: TeacherSideMenu()),
          Container(color: OrmeeColor.gray[200], width: 1),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Obx(
                () => OrmeeFloatingPopupOverlay(
                  message: "신규 강의를 개설해보세요!",
                  isVisible: isPopupVisible.value,
                  onDismiss: () => isPopupVisible.value = false,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 48),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              T1_24px(
                                text: "강의 홈",
                                color: OrmeeColor.gray[900],
                              ),
                              OrmeeButton2(
                                onPressed: () {
                                  openOrmeeDialog(context);
                                },
                                text: '강의 개설',
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: TeacherHomeTabBar(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
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
            print(titleController.textEditingController.text);
            print(dropdownController1.selectedMonth.value);
            print(dropdownController2.selectedMonth.value);
            Get.back();
          },
        );
      },
    );
  }
}

class TeacherHomeTabBar extends StatelessWidget {
  TeacherHomeTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final RxBool isPopupVisible = true.obs;
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicatorWeight: 4,
            indicatorColor: OrmeeColor.primaryPuple[400],
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: OrmeeColor.primaryPuple[400],
            labelStyle: const TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelColor: OrmeeColor.gray[500],
            unselectedLabelStyle: const TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            tabs: const [
              Tab(text: '진행중 강의 0'),
              Tab(text: '이전 강의'),
            ],
          ),
          Container(
            height: 1,
            color: OrmeeColor.gray[200],
          ),
          Expanded(
            child: TabBarView(
              children: [
                Obx(() => OrmeeFloatingPopupOverlay2(
                    message: '강의 코드를 복사해 학생에게 공유해보세요!',
                    isVisible: isPopupVisible.value,
                    onDismiss: () => isPopupVisible.value = false,
                    top: MediaQuery.of(context).size.height / 5,
                    child: Lectures())),
                // NullLecture('현재 진행 중인 강의가 없어요.'),
                NullLecture('이전 강의가 없어요.'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget NullLecture(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/icons/type=file_edit.svg",
            color: OrmeeColor.gray[400],
          ),
          const SizedBox(height: 24),
          T4_20px(
            text: message,
            color: OrmeeColor.gray[400],
          ),
        ],
      ),
    );
  }

  Widget Lectures() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 25,
          mainAxisSpacing: 25,
          mainAxisExtent: 220,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return LectureCard(context);
        },
      ),
    );
  }

  Widget LectureCard(context) {
    return Container(
      padding: EdgeInsets.fromLTRB(24, 28, 24, 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: OrmeeColor.white,
        border: Border.all(color: OrmeeColor.gray[200]!, width: 2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: OrmeeColor.primaryPuple[400],
                ),
                child: SvgPicture.asset(
                  'assets/icons/type=file.svg',
                  color: OrmeeColor.white,
                ),
              ),
              SizedBox(width: 8),
              T4_20px(text: '오르미 토익 rc'),
              Spacer(),
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
                  'assets/icons/type=more_vertical.svg',
                  color: OrmeeColor.gray[500],
                ),
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/icons/type=user_profile.svg',
                color: OrmeeColor.gray[400],
              ),
              SizedBox(width: 8),
              T6_16px(
                text: '44명',
                color: OrmeeColor.primaryPuple[400],
              ),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/type=calender.svg',
                color: OrmeeColor.gray[400],
              ),
              SizedBox(width: 8),
              B4_16px_M(
                text: '2024.08.24',
                color: OrmeeColor.gray[700],
              ),
              Spacer(),
              InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/icons/type=copy.svg',
                  color: OrmeeColor.primaryPuple[400],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
