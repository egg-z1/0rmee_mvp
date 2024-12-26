import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';

// 사용법:
// 아래와 같이 컨트롤러와 Rx bool 타입 변수 선언 후 사용
//
// final TextEditingController _controller_1 = TextEditingController();
// var isTextFieldNotEmpty1 = false.obs; // Rx로 상태 관리
//
// OrmeeTextField1(
//                 hintText: "이름을 입력하세요.",
//                 controller: _controller_id,
//                 focusNode: focusNode_id,
//                 textInputAction: TextInputAction.next,
//                 isTextNotEmpty: isTextFieldNotEmpty_id,
//                 onFieldSubmitted: (term) {
//                   FocusScope.of(context).nextFocus();
//                 },
//               ),
//
// OrmeeTextField1(
//                 hintText: '비밀번호를 입력하세요.',
//                 controller: _controller_pw,
//                 focusNode: focusNode_pw,
//                 textInputAction: TextInputAction.done,
//                 isTextNotEmpty: isTextFieldNotEmpty_pw,
//                 isPassword: true,
//                 onFieldSubmitted: (term) {
//                   FocusScope.of(context).unfocus();
//                 },
//               ),

class OrmeeTextField1 extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final Function(String) onFieldSubmitted;
  final RxBool isTextNotEmpty; // Rx<bool>로 상태 관리
  final bool? isPassword; // 선택적 파라미터
  final RxBool isObscure = true.obs; // 비밀번호 숨김 상태 관리
  final FocusNode focusNode;

  OrmeeTextField1({
    required this.hintText,
    required this.controller,
    required this.textInputAction,
    required this.onFieldSubmitted,
    required this.isTextNotEmpty,
    required this.focusNode, // required로 변경
    this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      isTextNotEmpty.value = controller.text.isNotEmpty;
    });

    return Obx(() => TextFormField(
          controller: controller,
          focusNode: focusNode,
          textInputAction: textInputAction,
          onFieldSubmitted: onFieldSubmitted,
          obscureText: isPassword == true ? isObscure.value : false,
          style: TextStyle(fontSize: 14, color: OrmeeColor.black),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: OrmeeColor.gray[200]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: OrmeeColor.black),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: OrmeeColor.gray[600],
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isTextNotEmpty.value)
                  IconButton(
                    onPressed: () {
                      controller.clear();
                      isTextNotEmpty.value = false; // 상태 초기화
                    },
                    icon: SvgPicture.asset(
                      "assets/icons/xCircle.svg",
                      color: OrmeeColor.gray[200],
                    ),
                  ),
                if (isPassword == true && isTextNotEmpty.value)
                  IconButton(
                    onPressed: () {
                      isObscure.value = !isObscure.value; // 토글
                    },
                    icon: SvgPicture.asset(
                      isObscure.value
                          ? "assets/icons/eye_off.svg"
                          : "assets/icons/eye_on.svg",
                      color: OrmeeColor.gray[600],
                    ),
                  ),
              ],
            ),
          ),
        ));
  }
}
