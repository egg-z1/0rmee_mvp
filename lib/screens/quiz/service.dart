import 'package:get/get.dart';
import 'package:ormee_mvp/api/OrmeeApi.dart';
import 'package:ormee_mvp/screens/quiz/model.dart';

class QuizService extends GetConnect {
  QuizService() {
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
  }

  /// 강의 상세 정보 가져오기
  Future<Map<String, Object>> fetchLectureDetail(String quizId) async {
    final String url = '/quizes/$quizId';
    try {
      // GET 요청 전송
      final response = await get(url);

      // 상태 코드 확인 (200~299은 성공)
      if (response.isOk && response.body != null) {
        final body = response.body;
        // print('Body Type: ${body.runtimeType}');
        // print('Body: $body');

        // 응답 데이터 구조 확인 및 파싱
        if (body is Map<String, dynamic> &&
            body['status'] == 'success' &&
            body['code'] == 200 &&
            body['data'] != null) {
          List<QuizCard> quizList = (body['data']['problems'] as List)
              .map((item) => QuizCard.fromJson(item))
              .toList();
          int timeLimit = body['data']['timeLimit'];
          DateTime dueTime = DateTime.parse(body['data']['dueTime']);
          // print(quizList);
          return {
            'dueTime': dueTime,
            'timeLimit': timeLimit,
            'quizList': quizList,
          };
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

  Future<void> submitQuiz(QuizSubmission submission) async {
    final String url = '/quizes/student';
    try {
      final response = await post(url, submission.toJson());

      if (response.isOk) {
        final body = response.body;

        // 응답 데이터 구조 확인
        if (body is Map<String, dynamic> &&
            body['status'] == 'success' &&
            body['code'] == 200) {
          return; // 성공적으로 제출됨
        }

        throw Exception('Invalid response format: ${response.bodyString}');
      }

      // 응답 실패 처리
      throw Exception(
          'Submit failed: [${response.statusCode}] ${response.bodyString}');
    } catch (e, stackTrace) {
      throw Exception('Error submitting quiz: $e');
    }
  }
}
