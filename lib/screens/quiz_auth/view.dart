import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/designs/OrmeeAppbar.dart';
import 'package:ormee_mvp/designs/OrmeeTextField1.dart';
import 'package:ormee_mvp/designs/OrmeeTypo.dart';

class QuizAuth extends StatelessWidget {
  const QuizAuth({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller_id = TextEditingController();
    final TextEditingController _controller_pw = TextEditingController();
    var isTextFieldNotEmpty_id = false.obs;
    var isTextFieldNotEmpty_pw = false.obs;

    return SafeArea(
      child: Scaffold(
        appBar: OrmeeAppBar(
          title: "6주차 퀴즈",
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, 32, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              T4_16px(text: "응시자 정보 입력"),
              SizedBox(
                height: 12,
              ),
              B4_14px_M(text: "이름"),
              SizedBox(
                height: 4,
              ),
              OrmeeTextField1(
                hintText: "이름을 입력하세요.",
                controller: _controller_id,
                textInputAction: TextInputAction.next,
                isTextNotEmpty: isTextFieldNotEmpty_id,
                onFieldSubmitted: (term) {
                  FocusScope.of(context).nextFocus();
                },
              ),
              SizedBox(
                height: 16,
              ),
              B4_14px_M(text: "비밀번호"),
              SizedBox(
                height: 4,
              ),
              OrmeeTextField1(
                hintText: '비밀번호를 입력하세요.',
                controller: _controller_pw,
                textInputAction: TextInputAction.done,
                isTextNotEmpty: isTextFieldNotEmpty_pw,
                isPassword: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
