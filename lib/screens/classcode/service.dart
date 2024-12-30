import 'package:get/get.dart';
import 'package:ormee_mvp/api/OrmeeApi.dart';
import 'package:ormee_mvp/screens/lecture_detail/model.dart';

class LectureValidate extends GetConnect {
  LectureValidate() {
    // 기본 URL 및 타임아웃 설정
    httpClient.baseUrl = '${API.hostConnect}';
    httpClient.timeout = const Duration(seconds: 10);

    // 요청 인터셉터: 헤더 설정 및 요청 로깅
    httpClient.addRequestModifier<dynamic>((request) async {
      // print('🌐 Request: [${request.method}] ${request.url}');
      request.headers['Accept'] = 'application/json';
      request.headers['Content-Type'] = 'application/json; charset=utf-8';
      return request;
    });

    // 응답 인터셉터: 응답 로깅
    // httpClient.addResponseModifier((request, response) {
    //   print('📥 Response: [${response.statusCode}] ${request.url}');
    //   if (response.bodyString != null) {
    //     print('📥 Body: ${response.bodyString}');
    //   }
    //   return response;
    // });
  }

  /// 강의 상세 정보 가져오기
  Future fetchLectureValidate(String lectureId) async {
    final String url = '/lectures/$lectureId/validate';
    try {
      // GET 요청 전송
      final response = await get(url);

      // 상태 코드 확인 (200~299은 성공)
      if (response.isOk && response.body != null) {
        final body = response.body;

        // 응답 데이터 구조 확인 및 파싱
        if (body is Map<String, dynamic> &&
            body['status'] == 'success' &&
            body['code'] == 200 &&
            body['data'] != null) {
          return (body['data']);
        }

        throw Exception('Invalid response format: ${response.bodyString}');
      }

      // 응답 실패 처리
      throw Exception(
          'Request failed: [${response.statusCode}] ${response.bodyString}');
    } catch (e, stackTrace) {
      // print('❌ Error in fetchLectureDetail: $e');
      // print('Stack trace: $stackTrace');
      rethrow;
    }
  }
}
