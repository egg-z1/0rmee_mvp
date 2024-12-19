import 'package:ormee_mvp/api/OrmeeApi.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/screens/teacher/home/model.dart';

class TeacherLectureCreateService extends GetConnect {
  TeacherLectureCreateService() {
    httpClient.baseUrl = '${API.hostConnect}';
    httpClient.timeout = const Duration(seconds: 10);

    httpClient.addRequestModifier<dynamic>((request) async {
      request.headers['Accept'] = 'application/json';
      request.headers['Content-Type'] = 'application/json; charset=utf-8';
      return request;
    });
  }

  int teacherCode = 3334;

  Future<void> createLecture(LectureCreateModel lecture) async {
    final String url = '/lectures/{$teacherCode}';
    try {
      final response = await post(url, lecture.toJson());

      if (response.isOk) {
      } else {
        throw Exception(
            'Request failed: [${response.statusCode}] ${response.bodyString}');
      }
    } catch (e, stackTrace) {
      rethrow;
    }
  }
}
