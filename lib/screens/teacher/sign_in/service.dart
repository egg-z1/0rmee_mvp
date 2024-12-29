import 'package:get/get.dart';
import 'package:ormee_mvp/api/OrmeeApi.dart';

class TeacherSignInService extends GetConnect {
  TeacherSignInService() {
    httpClient.baseUrl = API.hostConnect;
    httpClient.timeout = const Duration(seconds: 10);

    httpClient.addRequestModifier<dynamic>((request) async {
      request.headers['Accept'] = 'application/json';
      request.headers['Content-Type'] = 'application/json; charset=utf-8';
      return request;
    });
  }

  Future<bool> checkTeacherInfo(Map<String, dynamic> teacherData) async {
    const String url = '/teacher/users/check';
    try {
      final response = await post(url, teacherData);

      if(response.isOk && response.body != null) {
        final body = response.body;

        if (body['status'] == 'success') {
          return body['data'];
        } else {
          throw Exception('선생님 정보 확인 실패: ${body['message']}');
        }
      } else {
        throw Exception('API 요청 실패: ${response.statusText}');
      }
    } catch (e) {
      throw Exception('선생님 정보 확인 중 중 오류 발생: $e');
    }
  }
}