import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/designs/OrmeeAppbar.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';
import 'package:ormee_mvp/screens/classcode/view.dart';

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
              onTap: () => Get.to(() => ClassCode()),
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
            Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: OrmeeColor.primaryPuple[500],
              ),
              child: Center(
                child: B4_14px_R(
                  text: "교사입니다",
                  color: OrmeeColor.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
