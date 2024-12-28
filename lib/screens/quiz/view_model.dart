import 'dart:async';

import 'package:get/get.dart';
import 'package:ormee_mvp/designs/OrmeeToast.dart';
import 'package:ormee_mvp/screens/quiz/model.dart';
import 'package:ormee_mvp/screens/quiz/service.dart';

mixin QuizTimerMixin on GetxController {
  Timer? _timer;
  var remainingTime = '00:00:00'.obs;
  var isTimeUp = false.obs;

  void startTimer(DateTime dueTime, int timeLimit) {
    _timer?.cancel();
    final startTime = DateTime.now();

    // timeLimit 기반의 종료 시간 계산
    final timeLimitEndTime = startTime.add(Duration(minutes: timeLimit));

    // dueTime과 timeLimitEndTime 중 더 이른 시간을 선택
    final effectiveEndTime =
        dueTime.isBefore(timeLimitEndTime) ? dueTime : timeLimitEndTime;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      final difference = effectiveEndTime.difference(now);

      if (difference.isNegative) {
        timer.cancel();
        isTimeUp.value = true;
        remainingTime.value = '00:00:00';
        return;
      }

      final hours = difference.inHours.toString().padLeft(2, '0');
      final minutes = (difference.inMinutes % 60).toString().padLeft(2, '0');
      final seconds = (difference.inSeconds % 60).toString().padLeft(2, '0');
      remainingTime.value = '$hours:$minutes:$seconds';
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}

class QuizController extends GetxController with QuizTimerMixin {
  final QuizService _service = QuizService();

  var isLoading = false.obs;
  var quizList = Rx<List<QuizCard>>([]);
  var error = Rx<String?>(null);
  var dueTime = Rx<DateTime?>(null);
  var timeLimit = Rx<int?>(null);

  Future<void> fetchLectureDetail(String quizId) async {
    isLoading(true);
    error(null);

    try {
      final Map<String, dynamic> result =
          await _service.fetchLectureDetail(quizId);
      dueTime.value = result['dueTime'] as DateTime;
      timeLimit.value = result['timeLimit'] as int;
      final List<QuizCard> list = result['quizList'] as List<QuizCard>;
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
