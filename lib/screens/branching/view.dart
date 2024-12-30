import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/designs/OrmeeAppbar.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeSnackbar.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';
import 'package:ormee_mvp/screens/classcode/view.dart';
import 'package:ormee_mvp/screens/teacher/sign_in/view.dart';

class Branch extends StatelessWidget {
  const Branch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OrmeeColor.white,
      appBar: OrmeeAppBar(
        title: "강의실 입장",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 45,
            ),
            GestureDetector(
              onTap: () {
                // if(defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS) {
                //   Get.to(() => ClassCode());
                // } else {
                //   OrmeeSnackbar.show(context, "모바일로 이용해 주세요.", 'assets/icons/notice.svg', OrmeeColor.systemRed[5]!, OrmeeColor.systemRed[30]!);
                // }
                Get.to(() => ClassCode());
              },
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: OrmeeColor.primaryPuple[500],
                ),
                child: Center(
                  child: B4_14px_R(
                    text: "학생입니다",
                    color: OrmeeColor.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                if(defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS) {
                  OrmeeSnackbar.show(context, "데스크톱을 이용해 주세요.", 'assets/icons/notice.svg', OrmeeColor.systemRed[5]!, OrmeeColor.systemRed[30]!);
                } else {
                  Get.to(() => TeacherSignIn());
                }
              },
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: OrmeeColor.primaryPuple[500],
                ),
                child: const Center(
                  child: B4_14px_R(
                    text: "교사입니다",
                    color: OrmeeColor.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
