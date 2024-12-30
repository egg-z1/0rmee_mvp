import 'package:get/get.dart';
import 'package:ormee_mvp/screens/teacher/quiz_detail/model.dart';
import 'package:ormee_mvp/screens/teacher/quiz_detail/service.dart';

class QuizDetailController extends GetxController {
  final QuizDetailService _service = Get.put(QuizDetailService());

  var isLoading = false.obs;
  var quiz = Rx<QuizDetail?>(null);
  var error = Rx<String?>(null);

  Future<void> fetchQuizDetail(String quizId) async {
    isLoading(true);
    error(null);

    try {
      final QuizDetail quizDetail = await _service.fetchQuiz(quizId);
      quiz.value = quizDetail;
    } catch (e) {
      error(e.toString());
      // Get.snackbar(
      //   '오류',
      //   '퀴즈 정보를 불러오는데 실패했습니다. $e',
      //   snackPosition: SnackPosition.BOTTOM,
      //   duration: const Duration(seconds: 3),
      // );
    } finally {
      isLoading(false);
    }
  }

  Future<bool> deleteQuiz(String quizId) async {
    isLoading(true);
    error(null);

    try {
      return await _service.deleteQuiz(quizId);
    } catch (e) {
      error(e.toString());
      Get.snackbar(
        '오류',
        '퀴즈 삭제에 실패했습니다. $e',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    } finally {
      isLoading(false);
    }

    return false;
  }
}
