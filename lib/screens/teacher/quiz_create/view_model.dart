import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/screens/teacher/quiz_create/model.dart';
import 'package:ormee_mvp/screens/teacher/quiz_create/service.dart';

class QuizCreateController extends GetxController {
  final QuizCreateService _service = Get.put(QuizCreateService());

  var isLoading = false.obs;
  var error = Rx<String?>(null);
  var selectedDueTime = Rx<DateTime?>(null);
  var selectedTimeLimit = Rx<String?>(null);

  var problems = <Problem>[].obs;
  var options = <List<String>>[].obs;
  var answers = <String>[].obs;
  var types = <String>[].obs;

  var layerLinks = <LayerLink>[].obs;
  final titleFocusNode = FocusNode();
  var titleController = TextEditingController();

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

  Future<void> updateQuiz(Map<String, dynamic> quizData, String quizId) async {
    try {
      await _service.updateQuiz(quizData, quizId);
    } catch(e) {
      error(e.toString());
      Get.snackbar('오류', '퀴즈 수정에 실패했습니다: $e', snackPosition: SnackPosition.BOTTOM, duration: const Duration(seconds: 3));
    } finally {
      isLoading(false);
    }
  }

  Future<void> getDraftQuiz(String quizId) async {
    isLoading(true);
    error(null);

    try {
      Quiz quiz = await _service.getQuiz(quizId);

      problems.clear();
      options.clear();
      answers.clear();
      types.clear();
      layerLinks.clear();
      problemControllers.clear();
      optionControllers.clear();
      problemFocusNodes.clear();
      optionFocusNodes.clear();

      titleController.text = quiz.title;
      selectedDueTime(quiz.dueTime);
      selectedTimeLimit('${quiz.timeLimit}분');

      for (var problem in quiz.problems) {
        problems.add(problem);

        problemControllers.add(TextEditingController(text: problem.content));
        optionControllers.add(problem.items.map((item) => TextEditingController(text: item)).toList());
        problemFocusNodes.add(FocusNode());
        optionFocusNodes.add(problem.items.map((_) => FocusNode()).toList());

        options.add(problem.items);
        answers.add(problem.answer);
        types.add(problem.type);
        layerLinks.add(LayerLink());
      }
    } catch(e) {
      error(e.toString());
      Get.snackbar('오류', '퀴즈 가져오기에 실패했습니다: $e', snackPosition: SnackPosition.BOTTOM, duration: const Duration(seconds: 3));
    } finally {
      isLoading(false);
    }

  }
  
  void addProblem() {
    problems.add(Problem(content: "", type: "", answer: "", items: []));
    options.add([]);
    answers.add("");
    types.add("CHOICE");
    layerLinks.add(LayerLink());
    problemControllers.add(TextEditingController());
    optionControllers.add([]);
    problemFocusNodes.add(FocusNode());
    optionFocusNodes.add([]);
    addOption(problems.length-1);
  }

  void removeProblem(int index) {
    problems.removeAt(index);
    options.removeAt(index);
    answers.removeAt(index);
    types.removeAt(index);
    layerLinks.removeAt(index);
    problemControllers.removeAt(index);
    optionControllers.removeAt(index);
    problemFocusNodes.removeAt(index);
    optionFocusNodes.removeAt(index);
  }

  void addOption(int problemIndex) {
    options[problemIndex].add("");
    optionControllers[problemIndex].add(TextEditingController());
    optionFocusNodes[problemIndex].add(FocusNode());

    options[problemIndex] = List<String>.from(options[problemIndex]);
  }

  void removeOption(int problemIndex, int index) {
    options[problemIndex].removeAt(index);
    optionControllers[problemIndex].removeAt(index);
    optionFocusNodes[problemIndex].removeAt(index);

    options[problemIndex] = List<String>.from(options[problemIndex]);
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