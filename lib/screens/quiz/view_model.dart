import 'package:get/get.dart';
import 'package:ormee_mvp/designs/OrmeeToast.dart';
import 'package:ormee_mvp/screens/quiz/model.dart';
import 'package:ormee_mvp/screens/quiz/service.dart';

class QuizController extends GetxController {
  final QuizService _service = QuizService();

  var isLoading = false.obs;
  var quizList = Rx<List<QuizCard>>([]);
  var error = Rx<String?>(null);

  Future<void> fetchLectureDetail(String quizId) async {
    isLoading(true);
    error(null);

    try {
      final List<QuizCard> list = await _service.fetchLectureDetail(quizId);
      quizList.value = list;
    } catch (e) {
      error(e.toString());
      Get.snackbar(
        '오류',
        '퀴즈 정보를 불러오는데 실패했습니다.',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> submitQuiz(QuizSubmission submission) async {
    Future<void> submitQuiz(QuizSubmission submission) async {
      try {
        isLoading(true);
        await _service.submitQuiz(submission);
        return; // 성공적으로 처리된 경우
      } catch (e) {
        throw Exception('Quiz submission failed');
      } finally {
        isLoading(false);
      }
    }
  }
}
