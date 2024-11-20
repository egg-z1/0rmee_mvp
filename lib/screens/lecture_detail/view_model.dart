// lecture_controller.dart
import 'package:get/get.dart';
import 'package:ormee_mvp/screens/lecture_detail/model.dart';
import 'package:ormee_mvp/screens/lecture_detail/service.dart';

class LectureController extends GetxController {
  final LectureService _service = LectureService();

  var isLoading = false.obs; // 로딩 상태
  var lectureDetail = Rx<LectureDetailModel?>(null); // 반응형 LectureDetailModel

  // Lecture 세부정보 가져오기
  Future<void> fetchLectureDetail(String lectureId) async {
    isLoading(true);
    try {
      final detail = await _service.fetchLectureDetail(lectureId);
      lectureDetail.value = detail;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load lecture details');
    } finally {
      isLoading(false);
    }
  }
}
