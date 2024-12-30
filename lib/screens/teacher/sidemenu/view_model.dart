import 'package:get/get.dart';
import 'package:ormee_mvp/screens/teacher/sidemenu/model.dart';
import 'package:ormee_mvp/screens/teacher/sidemenu/service.dart';

class TeacherSideMenuController extends GetxController {
  final TeacherLectureService _service = TeacherLectureService();
  var isLoading = true.obs;
  var error = Rxn<String>();
  var sidemenu = Rx<TeacherSideMenuModel?>(null);

  // @override
  // void onInit() {
  //   super.onInit();
  //   fetchTeacherSideMenu('3334'); // 예시 코드로 초기화
  // }

  Future<void> fetchTeacherSideMenu(String code) async {
    try {
      isLoading(true);
      final detail = await _service.fetchTeacherSideMenuModel(code);
      sidemenu.value = detail;
    } catch (e) {
      error('오류 발생: $e');
    } finally {
      isLoading(false);
    }
  }
}

class LectureListController extends GetxController {
  RxInt lecture_index = 0.obs; // 상태를 Rx로 선언

  void updateLectureClick(int index) {
    lecture_index.value = index; // 상태 갱신
    print('lecture_index = ${index}');
  }
}

class TeacherUserController extends GetxController {
  var isLoading = false.obs;
  var teacherUser = Rx<TeacherUser?>(null);

  final TeacherLectureService _service = TeacherLectureService();

  Future<void> fetchTeacherUserInfo(String teacherCode) async {
    isLoading.value = true;
    try {
      final user = await _service.fetchTeacherUser(teacherCode);
      if (user != null) {
        teacherUser.value = user;
      } else {
        print("Failed to load teacher user.");
      }
    } finally {
      isLoading.value = false;
    }
  }
}
