import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/designs/OrmeeAppbar.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeTextField1.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';
import 'package:ormee_mvp/screens/classcode/view_model.dart';
import 'package:ormee_mvp/screens/lecture_detail/view.dart';

class ClassCode extends StatelessWidget {
  ClassCode({super.key});
  final controller = Get.put(ClassCodeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OrmeeColor.white,
      appBar: OrmeeAppBar(
        leftIcon: SvgPicture.asset(
          'assets/icons/left.svg',
        ),
        leftAction: () => Get.back(),
        title: "강의실 입장",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 32,
            ),
            T4_16px(text: "강의실 정보 입력"),
            SizedBox(
              height: 12,
            ),
            B4_14px_M(text: "강의실 ID"),
            SizedBox(
              height: 4,
            ),
            OrmeeTextField1(
              hintText: "강의실 ID를 입력하세요.",
              controller: controller.textController,
              focusNode: controller.focusNode,
              textInputAction: TextInputAction.done,
              isTextNotEmpty: controller.isTextFieldNotEmpty,
              onFieldSubmitted: (term) {
                controller.focusNode.unfocus();
              },
            ),
          ],
        ),
      ),
      bottomSheet: Obx(
        () {
          return GestureDetector(
            onTap: controller.isTextFieldNotEmpty.value
                ? () {
                    Get.to(() => LectureDetail(
                        lectureId: controller.textController.text));
                  }
                : null,
            child: Container(
              width: double.maxFinite,
              color: OrmeeColor.white,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: 48,
                decoration: BoxDecoration(
                  color: controller.isTextFieldNotEmpty.value
                      ? OrmeeColor.primaryPuple[400]
                      : OrmeeColor.gray[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: T4_16px(
                    text: "입장하기",
                    color: OrmeeColor.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
