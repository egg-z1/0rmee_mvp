import 'package:get/get.dart';
import 'package:ormee_mvp/api/OrmeeApi.dart';
import 'package:ormee_mvp/screens/teacher/quiz_create/model.dart';

class QuizCreateService extends GetConnect {
  QuizCreateService() {
    httpClient.baseUrl = API.hostConnect;
    httpClient.timeout = const Duration(seconds: 10);

    httpClient.addRequestModifier<dynamic>((request) async {
      request.headers['Accept'] = 'application/json';
      request.headers['Content-Type'] = 'application/json; charset=utf-8';
      return request;
    });
  }

  Future<void> createQuiz(Map<String, dynamic> quizData, String lectureId) async {
    final String url = '/quizes/teacher/$lectureId';
    try {
      final response = await post(url, quizData);

      if(response.isOk && response.body != null) {
        final body = response.body;

        if (body['status'] == 'success') {
          print('퀴즈 생성 성공');
        } else {
          throw Exception('퀴즈 생성 실패: ${body['message']}');
        }
      } else {
        throw Exception('API 요청 실패: ${response.statusText}');
      }
    } catch (e) {
      throw Exception('퀴즈 생성 중 오류 발생: $e');
    }
  }

  Future<void> updateQuiz(Map<String, dynamic> quizData, String quizId) async {
    final String url = '/quizes/teacher/$quizId';
    try {
      final response = await put(url, quizData);

      if(response.isOk && response.body != null) {
        final body = response.body;

        if (body['status'] == 'success') {
          print('퀴즈 수정 성공');
        } else {
          throw Exception('퀴즈 수정 실패: ${body['message']}');
        }
      } else {
        throw Exception('API 요청 실패: ${response.statusText}');
      }
    } catch (e) {
      throw Exception('퀴즈 수정 중 오류 발생: $e');
    }
  }

  Future<Quiz> getQuiz(String quizId) async {
    final String url = '/quizes/$quizId';

    try {
      final response = await get(url);

      if(response.isOk && response.body != null) {
        final body = response.body;

        if (body['status'] == 'success') {
          print('퀴즈 읽기 성공');
          print(body['data']['title']);
          return Quiz.fromJson(body['data']);
        } else {
          throw Exception('퀴즈 읽기 실패: ${body['message']}');
        }
      } else {
        throw Exception('API 요청 실패: ${response.statusText}');
      }
    } catch (e) {
      throw Exception('퀴즈 읽기 중 오류 발생: $e');
    }
  }
}