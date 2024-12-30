import 'package:get/get.dart';
import 'package:ormee_mvp/api/OrmeeApi.dart';
import 'package:ormee_mvp/screens/teacher/sidemenu/model.dart';

class TeacherLectureService extends GetConnect {
  TeacherLectureService() {
    httpClient.baseUrl = '${API.hostConnect}';
    httpClient.timeout = const Duration(seconds: 10);

    httpClient.addRequestModifier<dynamic>((request) async {
      request.headers['Accept'] = 'application/json';
      request.headers['Content-Type'] = 'application/json; charset=utf-8';
      return request;
    });
  }

  Future<TeacherSideMenuModel> fetchTeacherSideMenuModel(String code) async {
    final String url = '/lectures/teacher/$code';
    try {
      final response = await get(url);

      if (response.isOk && response.body != null) {
        final body = response.body;

        if (body is Map<String, dynamic> &&
            body['status'] == 'success' &&
            body['code'] == 200 &&
            body['data'] != null) {
          return TeacherSideMenuModel.fromJson(body['data']);
        }

        throw Exception('Invalid response format: ${response.bodyString}');
      }

      throw Exception(
          'Request failed: [${response.statusCode}] ${response.bodyString}');
    } catch (e, stackTrace) {
      rethrow;
    }
  }

  Future<TeacherUser?> fetchTeacherUser(String teacherCode) async {
    final String url = "/teacher/users/$teacherCode";
    final response = await get(url);

    if (response.isOk && response.body['data'] != null) {
      try {
        return TeacherUser.fromJson(response.body['data']);
      } catch (e) {
        throw Exception('데이터 파싱 실패: ${e.toString()}');
      }
    } else {
      throw Exception('API 호출 실패: ${response.statusText}');
    }
  }
}
