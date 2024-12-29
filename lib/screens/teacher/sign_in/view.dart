import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';
import 'package:ormee_mvp/designs/OrmeeSnackbar.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';
import 'package:ormee_mvp/screens/teacher/home/view.dart';
import 'package:ormee_mvp/screens/teacher/sign_in/model.dart';
import 'package:ormee_mvp/screens/teacher/sign_in/view_model.dart';

class TeacherSignIn extends StatelessWidget {
  TeacherSignInController controller = Get.put(TeacherSignInController());

  TeacherSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OrmeeColor.white,
      body: Center(
        child: SizedBox(
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 160,
                child: Image.asset(
                  'assets/images/sign_in_logo.png',
                ),
              ),
              const SizedBox(height: 28),
              Heading2_Semibold(text: '편리하고 간편한 원생 관리 솔루션', color: OrmeeColor.grey[40]),
              const SizedBox(height: 44),
              TextFormField(
                controller: controller.codeController,
                focusNode: controller.codeFocusNode,
                maxLength: 20,
                style: TextStyle(
                  fontFamily: 'Pretendard',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: OrmeeColor.grey[90],
                ),
                decoration: InputDecoration(
                  counterText: '',
                  filled: true,
                  fillColor: OrmeeColor.white,
                  hoverColor: Colors.transparent,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 1, color: OrmeeColor.grey[20]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 1, color: OrmeeColor.purple[40]!),
                  ),
                  hintText: '아이디',
                  hintStyle: TextStyle(
                      color: OrmeeColor.grey[30],
                      fontFamily: 'Pretendard',
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                  contentPadding: const EdgeInsets.all(20),
                ),
              ),
              const SizedBox(height: 12),
              Obx(() {
                  return TextFormField(
                    controller: controller.passwordController,
                    focusNode: controller.passwordFocusNode,
                    maxLength: 20,
                    obscureText: !controller.pwVisible.value,
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: OrmeeColor.grey[90],
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: OrmeeColor.white,
                      hoverColor: Colors.transparent,
                      counterText: '',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1, color: OrmeeColor.grey[20]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1, color: OrmeeColor.purple[40]!),
                      ),
                      hintText: '비밀번호',
                      hintStyle: TextStyle(
                          color: OrmeeColor.grey[30],
                          fontFamily: 'Pretendard',
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: GestureDetector(
                          onTap: () {
                            controller.pwVisible(!controller.pwVisible.value);
                          },
                          child: SvgPicture.asset(controller.pwVisible.value? 'assets/icons/eye_on.svg' : 'assets/icons/eye_off.svg', color: OrmeeColor.grey[60])
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(20),
                    ),
                  );
                }
              ),
              const SizedBox(height: 32),
              GestureDetector(
                onTap: () async {
                  if(await controller.checkTeacherInfo(Teacher(code: int.parse(controller.codeController.text), password: controller.passwordController.text).toJson())) {
                    OrmeeSnackbar.show(context, "로그인이 완료되었어요.", 'assets/icons/check.svg', OrmeeColor.systemGreen[5]!, OrmeeColor.systemGreen[30]!);
                    Get.off(TeacherHome());
                  } else {
                    OrmeeSnackbar.show(context, "로그인 정보가 일치하지 않습니다. 다시 시도해 주세요.", 'assets/icons/notice.svg', OrmeeColor.systemRed[5]!, OrmeeColor.systemRed[30]!);
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 18),
                  decoration: BoxDecoration(
                    color: OrmeeColor.purple[40],
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Center(
                    child: Headline1_Bold(text: '로그인', color: OrmeeColor.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
