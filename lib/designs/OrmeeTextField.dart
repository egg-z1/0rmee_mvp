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
// CustomTextFormField(
//                 hintText: '이메일을 입력하세요.',
//                 controller: _controller_1,
//                 textInputAction: TextInputAction.next,
//                 onFieldSubmitted: (term) {
//                   FocusScope.of(context).nextFocus();
//                 },
//                 isTextNotEmpty: isTextFieldNotEmpty1,
//               ),
//
// CustomTextFormField(
//                 hintText: '비밀번호를 입력하세요.',
//                 controller: _controller_2,
//                 textInputAction: TextInputAction.done,
//                 isTextNotEmpty: isTextFieldNotEmpty2,
//               )

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final Function(String)? onFieldSubmitted;
  final RxBool isTextNotEmpty; // Rx<bool>로 상태 관리

  CustomTextFormField({
    required this.hintText,
    required this.controller,
    required this.textInputAction,
    this.onFieldSubmitted,
    required this.isTextNotEmpty, // Rx<bool> 받아오기
  });

  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      isTextNotEmpty.value = controller.text.isNotEmpty;
    });

    return Obx(() => TextFormField(
          controller: controller,
          textInputAction: textInputAction,
          onFieldSubmitted: onFieldSubmitted,
          style: TextStyle(fontSize: 14, color: Colors.black),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[200]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.black),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: OrmeeColor.gray[600],
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            suffixIcon: isTextNotEmpty.value
                ? IconButton(
                    onPressed: () {
                      controller.clear();
                    },
                    icon: SvgPicture.asset(
                      "assets/icons/xCircle.svg",
                      color: OrmeeColor.gray[200],
                    ),
                  )
                : null,
          ),
        ));
  }
}
