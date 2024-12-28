import 'package:get/get.dart';
import 'package:ormee_mvp/screens/teacher/quiz/model.dart';
import 'package:ormee_mvp/screens/teacher/quiz/service.dart';

class TeacherQuizController extends GetxController {
  final TeacherQuizService _service = TeacherQuizService();
  var isLoading = true.obs;
  var error = Rxn<String>();
  final RxList<Quiz> openQuizzes = <Quiz>[].obs;
  final RxList<Quiz> closedQuizzes = <Quiz>[].obs;
  final RxList<Quiz> draftQuizzes = <Quiz>[].obs;

  Future<void> fetchTeacherQuizList(String teacherId) async {
    try {
      QuizzesResponse response = await _service.fetchQuizzes(teacherId);
      openQuizzes.value = response.openQuizzes;
      closedQuizzes.value = response.closedQuizzes;
    } catch (e) {
      error('오류 발생: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchTeacherQuizOpen(String quizId) async {
    try {
      QuizzesResponse response = await _service.fetchOpenQuiz(quizId);
      openQuizzes.value = response.openQuizzes;
      closedQuizzes.value = response.closedQuizzes;
    } catch (e) {
      error('오류 발생: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchTeacherQuizClose(String quizId) async {
    try {
      QuizzesResponse response = await _service.fetchCloseQuiz(quizId);
      openQuizzes.value = response.openQuizzes;
      closedQuizzes.value = response.closedQuizzes;
    } catch (e) {
      error('오류 발생: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchTeacherQuizDraft(String teacherId) async {
    try {
      QuizzesDraft response = await _service.fetchDraftQuizzes(teacherId);
      draftQuizzes.value = response.draftQuizzes;
    } catch (e) {
      error('오류 발생: $e');
    } finally {
      isLoading(false);
    }
  }
}
