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

class TeacherQuizStatisticsController extends GetxController {
  final ProblemStatisticsService service = ProblemStatisticsService();
  RxList<QuizStatistics> statistics = <QuizStatistics>[].obs;
  RxBool isLoading = false.obs;

  Future<void> fetchQuizStatistics(String quizId) async {
    try {
      isLoading.value = true;
      final response = await service.fetchQuizStatistics(quizId);
      statistics.value = response;
    } catch (e) {
      print('Error loading statistics: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

class TeacherProblemStatisticsController extends GetxController {
  final ProblemStatisticsService service = ProblemStatisticsService();

  Rx<ProblemStatistics?> problemStatistics = Rx<ProblemStatistics?>(null);
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  Future<void> fetchProblemStatistics(int problemId) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final response = await service.fetchProblemStatistics(problemId);
      problemStatistics.value = response;
    } catch (e) {
      errorMessage.value = '실패Error loading statistics: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
