import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/designs/OrmeeButton1.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeDropDownButton.dart';
import 'package:ormee_mvp/designs/OrmeeTextField3.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';

class OrmeeDialog extends StatelessWidget {
  final String titleText;
  final String contentText;
  final TextFieldController titleController;
  final DropdownController? dropdownController1;
  final DropdownController? dropdownController2;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;
  final bool haveDropdown;
  final String buttonText;

  OrmeeDialog({
    required this.titleText,
    required this.contentText,
    required this.titleController,
    this.dropdownController1,
    this.dropdownController2,
    required this.onCancel,
    required this.onConfirm,
    required this.haveDropdown,
    this.buttonText = '개설하기',
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: OrmeeColor.white,
      surfaceTintColor: Colors.transparent,
      contentPadding: EdgeInsets.symmetric(vertical: 40, horizontal: 64),
      content: SizedBox(
        width: haveDropdown ? 491 : 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            T1_24px(
              text: titleText,
              color: OrmeeColor.gray[900],
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                T4_16px(
                  text: contentText,
                  color: OrmeeColor.gray[900],
                ),
              ],
            ),
            SizedBox(height: 8),
            OrmeeTextField3(
              hintText: "입력하기",
              textFieldController: titleController,
              textInputAction: TextInputAction.none,
              onFieldSubmitted: (value) {
                FocusScope.of(context).unfocus();
              },
            ),
            if (haveDropdown) ...[
              SizedBox(height: 36),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  T4_16px(
                    text: '개강 월',
                    color: OrmeeColor.gray[900],
                  ),
                ],
              ),
              SizedBox(height: 8),
              OrmeeDropDownButton(
                dropdownController: dropdownController1!,
                topPadding: 350,
              ),
              SizedBox(height: 36),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  T4_16px(
                    text: '종강 월',
                    color: OrmeeColor.gray[900],
                  ),
                ],
              ),
              SizedBox(height: 8),
              OrmeeDropDownButton(
                dropdownController: dropdownController2!,
                bottomPadding: 120,
              ),
            ],
            SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OrmeeButton1(onPressed: onCancel, text: '취소하기'),
                SizedBox(width: 24),
                Obx(() {
                  bool isFormValid = titleController.isTextNotEmpty.value &&
                      (haveDropdown
                          ? dropdownController1!
                                  .selectedMonth.value.isNotEmpty &&
                              dropdownController2!
                                  .selectedMonth.value.isNotEmpty
                          : true);
                  return OrmeeButton1(
                    onPressed: isFormValid ? onConfirm : null,
                    text: buttonText,
                    textColor:
                        isFormValid ? OrmeeColor.white : OrmeeColor.gray[400]!,
                    backgroundColor: isFormValid
                        ? OrmeeColor.primaryPuple[400]!
                        : OrmeeColor.gray[200]!,
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
