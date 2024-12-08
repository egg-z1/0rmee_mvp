import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeacherHeaderController extends GetxController {
  final searchController = TextEditingController();
  var searchClear = false.obs;

  void onSearchChanged(String value) {
    searchClear.value = value.isNotEmpty;
  }

  void clearSearch() {
    searchController.clear();
    searchClear.value = false;
  }

  void onSearchSubmitted(String value) {
    if (value.isNotEmpty) {
      debugPrint('Search Submitted: $value');
    } else {
      Get.snackbar('알림', '검색어를 입력하세요.', snackPosition: SnackPosition.BOTTOM);
    }
  }
}
