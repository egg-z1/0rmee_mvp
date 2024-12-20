import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeDialog.dart';
import 'package:ormee_mvp/designs/OrmeeDropDownButton.dart';
import 'package:ormee_mvp/designs/OrmeeQuizInfo.dart';
import 'package:ormee_mvp/designs/OrmeeSelect.dart';
import 'package:ormee_mvp/designs/OrmeeTextField3.dart';
import 'package:ormee_mvp/screens/teacher/header/view.dart';
import 'package:ormee_mvp/screens/teacher/sidemenu/view.dart';

class TeacherHome extends StatelessWidget {
  const TeacherHome({super.key});

  @override
  Widget build(BuildContext context) {
    // dialog component 사용법
    void openOrmeeDialog() {
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
              //여기에 api 호출 코드 작성
              Get.back();
            },
          );
        },
      );
    }

    final LayerLink layerLink = LayerLink();
    OverlayEntry? overlayEntry;
    // select answer dialog 사용법
    void openOrmeeSelect() {
      overlayEntry = OverlayEntry(
        builder: (context) => OrmeeSelect(
          answerList: ["Apple", "Banana", "Cherry"],
          layerLink: layerLink,
          onSelect: (selected) {
            print("Selected: $selected");
            overlayEntry?.remove();
            overlayEntry = null;
          },
        ),
      );
      Overlay.of(context).insert(overlayEntry!);
    }

    // quiz statistics info dialog 사용법
    void openOrmeeQuizInfo() {
      overlayEntry = OverlayEntry(
        builder: (context) => OrmeeQuizInfo(
          currentIndex: 2,
          totalIndex: 24,
          problem:
              '1. Four football matches will be broadcast live on three major stations _______ this weekend.',
          answerList: ["nation", "bation", "cation"],
          answerUserList: [16, 12, 18],
          answerIndex: 0,
          layerLink: layerLink,
          onSelect: (selected) {
            overlayEntry?.remove();
            overlayEntry = null;
          },
        ),
      );
      Overlay.of(context).insert(overlayEntry!);
    }

    return Scaffold(
      backgroundColor: OrmeeColor.white,
      appBar: TeacherHeader(),
      body: Row(
        children: [
          SizedBox(width: 348, child: TeacherSideMenu()),
          Container(color: OrmeeColor.gray[200], width: 1),
          Container(
            color: OrmeeColor.white,
            width: MediaQuery.of(context).size.width - 500,
            child: Center(
              child: CompositedTransformTarget(
                link: layerLink,
                child: GestureDetector(
                  onTap: () {
                    if (overlayEntry == null) {
                      // openOrmeeDialog();
                      // openOrmeeSelect();
                      openOrmeeQuizInfo();
                    }
                  },
                  child: Container(
                    color: OrmeeColor.error,
                    width: 200,
                    height: 100,
                    child: const Center(child: Text('Tap to Open Dialog')),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
