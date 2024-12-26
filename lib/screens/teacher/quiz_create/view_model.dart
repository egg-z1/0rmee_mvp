import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/screens/teacher/quiz_create/model.dart';
import 'package:ormee_mvp/screens/teacher/quiz_create/service.dart';

class QuizCreateController extends GetxController {
  final QuizCreateService _service = Get.put(QuizCreateService());

  var isLoading = false.obs;
  var error = Rx<String?>(null);
  var selectedDueTime = Rx<DateTime?>(null);

  var problems = <Problem>[].obs;
  var options = <List<String>>[].obs;
  var answers = <String>[].obs;

  final titleFocusNode = FocusNode();
  final titleController = TextEditingController();

  var problemFocusNodes = <FocusNode>[].obs;
  var optionFocusNodes = <List<FocusNode>>[].obs;

  var problemControllers = <TextEditingController>[].obs;
  var optionControllers = <List<TextEditingController>>[].obs;

  @override
  void onInit() {
    super.onInit();
    addProblem();
  }

  Future<void> createQuiz(Map<String, dynamic> quizData, String lectureId) async {
    isLoading(true);
    error(null);

    try {
      await _service.createQuiz(quizData, lectureId);
    } catch(e) {
      error(e.toString());
      Get.snackbar('오류', '퀴즈 생성에 실패했습니다: $e', snackPosition: SnackPosition.BOTTOM, duration: const Duration(seconds: 3));
    } finally {
      isLoading(false);
    }
  }
  
  void addProblem() {
    problems.add(Problem(content: "", type: "", answer: "", items: []));
    options.add([]);
    problemControllers.add(TextEditingController());
    optionControllers.add([]);
    problemFocusNodes.add(FocusNode());
    optionFocusNodes.add([]);
  }

  void removeProblem(int index) {
    problems.removeAt(index);
    options.removeAt(index);
    problemControllers.removeAt(index);
    optionControllers.removeAt(index);
    problemFocusNodes.removeAt(index);
    optionFocusNodes.removeAt(index);
  }

  @override
  void dispose() {
    titleFocusNode.dispose();
    titleController.dispose();

    for (final focusNode in problemFocusNodes) {
      focusNode.dispose();
    }
    for (final controller in problemControllers) {
      controller.dispose();
    }
    for (final focusNodeList in optionFocusNodes) {
      for (final focusNode in focusNodeList) {
        focusNode.dispose();
      }
    }
    for (final controllerList in optionControllers) {
      for (final controller in controllerList) {
        controller.dispose();
      }
    }

    super.dispose();
  }
}