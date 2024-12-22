import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizAuthController extends GetxController {
  final focusNode = FocusNode();
  final textController = TextEditingController();
  final isTextFieldNotEmpty = false.obs;

  @override
  void onClose() {
    focusNode.dispose();
    textController.dispose();
    super.onClose();
  }
}
