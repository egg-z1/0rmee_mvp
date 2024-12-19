import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeDialog.dart';
import 'package:ormee_mvp/designs/OrmeeDropDownButton.dart';
import 'package:ormee_mvp/designs/OrmeeTextField3.dart';
import 'package:ormee_mvp/screens/teacher/header/view.dart';
import 'package:ormee_mvp/screens/teacher/sidemenu/view.dart';

class TeacherHome extends StatelessWidget {
  const TeacherHome({super.key});

  @override
  Widget build(BuildContext context) {
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
            onConfirm: () {
              print(titleController.textEditingController.text);
              print(dropdownController1.selectedMonth.value);
              print(dropdownController2.selectedMonth.value);
              Get.back();
            },
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: OrmeeColor.white,
      appBar: TeacherHeader(), // Custom header
      body: Row(
        children: [
          // Side menu
          SizedBox(width: 348, child: TeacherSideMenu()),
          Container(
            color: OrmeeColor.gray[200],
            width: 1,
          ),
          // Main body
          Container(
            color: OrmeeColor.white,
            width: MediaQuery.of(context).size.width - 500,
            child: GestureDetector(
              onTap: () {
                openOrmeeDialog(); // Call the function to open the dialog
              },
              child: Container(
                color: OrmeeColor.error,
                width: 200,
                height: 100, // Add height for the tap area
                child: Center(
                    child: Text(
                        'Tap to Open Dialog')), // Optional label to indicate tappable area
              ),
            ),
          ),
        ],
      ),
    );
  }
}
