// lecture_controller.dart
import 'package:get/get.dart';
import 'package:ormee_mvp/screens/lecture_detail/model.dart';
import 'package:ormee_mvp/screens/lecture_detail/service.dart';

class LectureController extends GetxController {
  final LectureService _service = LectureService();

  var isLoading = false.obs;
  var lectureDetail = Rx<LectureDetailModel?>(null);
  var error = Rx<String?>(null);

  // @override
  // void onInit() {
  //   super.onInit();
  //   // 초기 데이터 로드
  //   fetchLectureDetail("5465");
  // }

  Future<void> fetchLectureDetail(String lectureId) async {
    isLoading(true);
    error(null);

    try {
      final detail = await _service.fetchLectureDetail(lectureId);
      lectureDetail.value = detail;
    } catch (e) {
      error(e.toString());
      Get.snackbar(
        '오류',
        '강의 정보를 불러오는데 실패했습니다.',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    } finally {
      isLoading(false);
    }
  }
}
