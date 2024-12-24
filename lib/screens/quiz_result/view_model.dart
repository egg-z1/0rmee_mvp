import 'package:get/get.dart';
import 'package:ormee_mvp/screens/quiz_result/model.dart';
import 'package:ormee_mvp/screens/quiz_result/service.dart';

class QuizResultController extends GetxController {
  final QuizResultService _service = QuizResultService();

  var isLoading = false.obs;
  var lectureDetail = Rx<QuizResultModel?>(null);
  var error = Rx<String?>(null);

  Future<void> fetchQuizResult(
    String quizId,
    String author,
    String password,
  ) async {
    isLoading(true);
    error(null);

    try {
      final detail = await _service.fetchQuizResult(quizId, author, password);
      lectureDetail.value = detail;
    } catch (e) {
      error(e.toString());
      Get.snackbar(
        '오류',
        '퀴즈 결과과 정보를 불러오는데 실패했습니다.',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    } finally {
      isLoading(false);
    }
  }
}
