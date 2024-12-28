import 'dart:convert';
import 'package:get/get.dart';
import 'package:ormee_mvp/api/OrmeeApi.dart';
import 'package:ormee_mvp/screens/teacher/lecture/model.dart';

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

  Future<MemoData> fetchMemos(String teacherId) async {
    final String url = '/teacher/$teacherId/memos';
    final response = await get(url);

    if (response.statusCode == 200) {
      return MemoData.fromJson(response.body);
    } else {
      throw Exception('Failed to fetch memos');
    }
  }

  Future<QuizData> fetchQuizzes(String teacherId) async {
    final String url = '/quizes/teacher/$teacherId';
    final response = await get(url);

    if (response.statusCode == 200) {
      return QuizData.fromJson(response.body);
    } else {
      throw Exception('Failed to fetch quizzes');
    }
  }
}
