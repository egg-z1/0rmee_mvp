import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/designs/OrmeeColor.dart';

class TextFieldController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  RxBool isTextNotEmpty = false.obs;
  RxInt textLength = 0.obs;

  @override
  void onInit() {
    super.onInit();
    textEditingController.addListener(() {
      isTextNotEmpty.value = textEditingController.text.isNotEmpty;
      textLength.value = textEditingController.text.length;
    });
  }

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }
}

class OrmeeTextField3 extends StatelessWidget {
  final String hintText;
  final TextFieldController textFieldController;
  final TextInputAction textInputAction;
  final Function(String)? onFieldSubmitted;
  final int maxLength;

  OrmeeTextField3({
    required this.hintText,
    required this.textFieldController,
    required this.textInputAction,
    this.onFieldSubmitted,
    this.maxLength = 50,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textFieldController.textEditingController,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      maxLength: maxLength,
      minLines: 1,
      maxLines: 5,
      onChanged: (value) {
        textFieldController.textLength.value = value.length;
        textFieldController.isTextNotEmpty.value = value.isNotEmpty;
      },
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: OrmeeColor.gray[900],
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: OrmeeColor.gray[200]!, width: 1.6),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide(color: OrmeeColor.primaryPuple[400]!, width: 2),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'Pretendard',
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: OrmeeColor.gray[500],
        ),
        counterText: '',
        contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 16),
          child: Obx(() => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${textFieldController.textLength.value}",
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: OrmeeColor.gray[900],
                    ),
                  ),
                  Text(
                    "/$maxLength",
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: OrmeeColor.gray[500],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
