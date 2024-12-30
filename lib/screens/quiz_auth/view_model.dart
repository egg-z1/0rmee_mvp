import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/screens/quiz_auth/service.dart';

class QuizAuthController extends GetxController {
  final focusNode = FocusNode();
  final textController = TextEditingController();
  final isTextFieldNotEmpty = false.obs;
  final QuizAuthService _service = QuizAuthService();

  var isLoading = false.obs;
  var userInfoValidate = Rx<bool?>(null);
  var error = Rx<String?>(null);

  @override
  void onClose() {
    focusNode.dispose();
    textController.dispose();
    super.onClose();
  }

  Future<void> fetchUserInfoValidate(
      String quizId, String author, String password) async {
    isLoading(true);
    error(null);

    try {
      final detail =
          await _service.fetchUserInfoValidate(quizId, author, password);
      userInfoValidate.value = detail;
    } catch (e) {
      error(e.toString());
      Get.snackbar(
        '오류',
        '사용자 검증을 실패했습니다.',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    } finally {
      isLoading(false);
    }
  }
}
