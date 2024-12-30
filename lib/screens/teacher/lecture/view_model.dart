import 'package:get/get.dart';
import 'package:ormee_mvp/screens/teacher/lecture/service.dart';

class TeacherLectureController extends GetxController {
  final TeacherLectureService _service = TeacherLectureService();

  var openMemosLength = 0.obs;
  var closeMemosLength = 0.obs;
  var openQuizzesLength = 0.obs;
  var closedQuizzesLength = 0.obs;

  Future<void> fetchMemoData(String teacherId) async {
    try {
      final memoData = await _service.fetchMemos(teacherId);
      openMemosLength.value = memoData.openMemos.length;
      closeMemosLength.value = memoData.closeMemos.length;
    } catch (e) {
      print('Error loading memo data: $e');
    }
  }

  Future<void> fetchQuizData(String teacherId) async {
    try {
      final quizData = await _service.fetchQuizzes(teacherId);
      openQuizzesLength.value = quizData.openQuizzes.length;
      closedQuizzesLength.value = quizData.closedQuizzes.length;
    } catch (e) {
      print('Error loading quiz data: $e');
    }
  }
}
