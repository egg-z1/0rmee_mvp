import 'package:get/get.dart';
import 'package:ormee_mvp/screens/teacher/quiz/model.dart';
import 'package:ormee_mvp/screens/teacher/quiz/service.dart';

class TeacherQuizController extends GetxController {
  final TeacherQuizService _service = TeacherQuizService();
  var isLoading = true.obs;
  var error = Rxn<String>();
  var openQuizzes = <Quiz>[].obs;
  var closedQuizzes = <Quiz>[].obs;

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
}
