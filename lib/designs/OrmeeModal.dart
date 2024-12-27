import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/designs/OrmeeButton1.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';

class OrmeeModal extends StatelessWidget {
  final String titleText;
  final String? contentText;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  OrmeeModal({
    required this.titleText,
    this.contentText,
    required this.onCancel,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: OrmeeColor.white,
      surfaceTintColor: Colors.transparent,
      contentPadding: EdgeInsets.symmetric(vertical: 45, horizontal: 50),
      content: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Title2_Semibold(
              text: titleText,
              color: OrmeeColor.grey[90],
            ),
            SizedBox(height: 13),
            contentText!.isNotEmpty
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Headline1_Regular(
                        text: contentText!,
                        color: OrmeeColor.grey[90],
                      ),
                    ],
                  )
                : Container(),
            SizedBox(height: 44),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OrmeeButton1(onPressed: onCancel, text: '취소'),
                SizedBox(width: 14),
                OrmeeButton1(
                  onPressed: onConfirm,
                  text: '확인',
                  textColor: OrmeeColor.white,
                  backgroundColor: OrmeeColor.primaryPuple[400]!,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
