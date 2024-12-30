import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/screens/classcode/service.dart';

class ClassCodeController extends GetxController {
  final focusNode = FocusNode();
  final textController = TextEditingController();
  final isTextFieldNotEmpty = false.obs;
  final LectureValidate _service = LectureValidate();

  var isLoading = false.obs;
  var lectureValidate = Rx<bool?>(null);
  var error = Rx<String?>(null);

  @override
  void onInit() {
    super.onInit();
    textController.addListener(() {
      isTextFieldNotEmpty.value = textController.text.isNotEmpty;
    });
  }

  @override
  void onClose() {
    focusNode.dispose();
    textController.dispose();
    super.onClose();
  }

  Future<void> fetchLectureValidate(String lectureId) async {
    isLoading(true);
    error(null);

    try {
      final detail = await _service.fetchLectureValidate(lectureId);
      lectureValidate.value = detail;
    } catch (e) {
      error(e.toString());
      Get.snackbar(
        '오류',
        '강의실 ID 검증을 실패했습니다.',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    } finally {
      isLoading(false);
    }
  }
}
