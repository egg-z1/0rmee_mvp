import 'dart:convert';
import 'package:get/get.dart';
import 'package:ormee_mvp/api/OrmeeApi.dart';
import 'package:ormee_mvp/screens/teacher/quiz/model.dart';

class TeacherQuizService extends GetConnect {
  TeacherQuizService() {
    httpClient.baseUrl = '${API.hostConnect}';
    httpClient.timeout = const Duration(seconds: 10);

    httpClient.addRequestModifier<dynamic>((request) async {
      request.headers['Accept'] = 'application/json';
      request.headers['Content-Type'] = 'application/json; charset=utf-8';
      return request;
    });
  }

  Future<QuizzesResponse> fetchQuizzes(String teacherId) async {
    final String url = '/quizes/teacher/$teacherId';

    try {
      final response = await get(url);

      if (response.isOk) {
        return QuizzesResponse.fromJson(response.body);
      } else {
        throw Exception('Failed to load quizzes');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }
}
