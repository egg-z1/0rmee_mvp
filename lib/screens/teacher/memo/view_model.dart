import 'package:get/get.dart';
import 'package:ormee_mvp/screens/teacher/memo/model.dart';
import 'package:ormee_mvp/screens/teacher/memo/service.dart';

class TeacherMemoController extends GetxController {
  final TeacherMemoService _service = TeacherMemoService();
  RxList<Memo> openMemos = <Memo>[].obs;
  RxList<Memo> closeMemos = <Memo>[].obs;

  Future<void> fetchTeacherMemos(String teacherId) async {
    try {
      final response = await _service.fetchMemos(teacherId);
      openMemos.value = response.openMemos;
      closeMemos.value = response.closeMemos;
    } catch (e) {
      print('Error fetching memos: $e');
    }
  }

  Future<void> fetchTeacherCreateMemo(
      String teacherId, MemoCreateModel title) async {
    try {
      await _service.fetchCreateMemo(teacherId, title);
    } catch (e) {
      print('Error fetching memos: $e');
    }
  }

  Future<void> fetchTeacherMemoClose(String teacherId, int memoId) async {
    try {
      await _service.fetchCloseMemos(teacherId, memoId);
    } catch (e) {
      print('Error fetching memos: $e');
    }
  }
}

class TeacherMessageStatisticsController extends GetxController {
  final MessageStatisticsService service = MessageStatisticsService();
  RxList<MessageStatistics> statistics = <MessageStatistics>[].obs;
  RxBool isLoading = false.obs;

  Future<void> fetchMessageStatistics(int memoId) async {
    try {
      isLoading.value = true;
      final response = await service.fetchMessageStatistics(memoId);
      statistics.value = response;
    } catch (e) {
      print('Error loading message statistics: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
