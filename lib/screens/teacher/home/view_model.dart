import 'package:get/get.dart';
import 'package:ormee_mvp/screens/teacher/home/model.dart';
import 'package:ormee_mvp/screens/teacher/home/service.dart';

class TeacherHomeController extends GetxController {
  final TeacherLectureCreateService _service = TeacherLectureCreateService();
  var isLoading = true.obs;
  var error = Rxn<String>();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchTeacherCreateLecture(
      String code, LectureCreateModel lecture) async {
    try {
      isLoading(true);
      await _service.fetchCreateLecture(code, lecture);
    } catch (e) {
      error('오류 발생: $e');
    } finally {
      isLoading(false);
    }
  }

  var openLectures = <Lecture>[].obs;
  var closedLectures = <Lecture>[].obs;

  Future<void> fetchTeacherLectures(String teacherId) async {
    try {
      LectureResponse response = await _service.fetchLectures(teacherId);
      openLectures.value = response.openLectures;
      closedLectures.value = response.closedLectures;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> fetchTeacherDeleteLecture(int code) async {
    try {
      await _service.fetchDeleteLecture(code);
    } catch (e) {
      print('Error: $e');
    }
  }
}
