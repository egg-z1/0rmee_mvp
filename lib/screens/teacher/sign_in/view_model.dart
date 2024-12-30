import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/screens/teacher/sign_in/service.dart';

class TeacherSignInController extends GetxController {
  final TeacherSignInService _service = Get.put(TeacherSignInService());

  var isLoading = false.obs;
  var error = Rx<String?>(null);
  TextEditingController codeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode codeFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  var pwVisible = false.obs;

  Future<bool> checkTeacherInfo(Map<String, dynamic> teacherData) async {
    isLoading(true);
    error(null);

    try {
      return await _service.checkTeacherInfo(teacherData);
    } catch(e) {
      error(e.toString());
    } finally {
      isLoading(false);
    }

    return false;
  }

  @override
  void onClose() {
    codeController.dispose();
    passwordController.dispose();
    codeFocusNode.dispose();
    passwordFocusNode.dispose();
    super.onClose();
  }
}