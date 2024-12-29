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

  Future<QuizzesResponse> fetchOpenQuiz(String quizId) async {
    final String url = '/quizes/teacher/$quizId/open';

    try {
      final response = await put(url, quizId);

      if (response.isOk) {
        return QuizzesResponse.fromJson(response.body);
      } else {
        throw Exception('Failed to load quizzes');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }

  Future<QuizzesResponse> fetchCloseQuiz(String quizId) async {
    final String url = '/quizes/teacher/$quizId/close';

    try {
      final response = await put(url, quizId);

      if (response.isOk) {
        return QuizzesResponse.fromJson(response.body);
      } else {
        throw Exception('Failed to load quizzes');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }

  Future<QuizzesDraft> fetchDraftQuizzes(String teacherId) async {
    final String url = '/quizes/teacher/$teacherId/draft';

    try {
      final response = await get(url);

      if (response.isOk) {
        return QuizzesDraft.fromJson(response.body);
      } else {
        throw Exception('Failed to load quizzes');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }
}

class ProblemStatisticsService extends GetConnect {
  ProblemStatisticsService() {
    httpClient.baseUrl = '${API.hostConnect}';
    httpClient.timeout = const Duration(seconds: 10);

    httpClient.addRequestModifier<dynamic>((request) async {
      request.headers['Accept'] = 'application/json';
      request.headers['Content-Type'] = 'application/json; charset=utf-8';
      return request;
    });
  }

  Future<List<QuizStatistics>> fetchQuizStatistics(String quizId) async {
    final url = '/quizes/$quizId/teacher/statistics';
    final response = await get(url);

    if (response.isOk && response.body['data'] != null) {
      final List<dynamic> data = response.body['data'];
      if (data.isEmpty) return [];
      return data
          .map((item) => QuizStatistics.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to fetch problem statistics: ${response.body}');
    }
  }

  Future<ProblemStatistics> fetchProblemStatistics(int problemId) async {
    final url = '/quizes/teacher/statistics/$problemId';
    final response = await get(url);
    if (response.isOk) {
      try {
        return ProblemStatistics.fromJson(response.body['data']);
      } catch (e) {
        print('JSON 파싱 에러: $e');
        throw Exception('데이터 파싱 실패: ${e.toString()}');
      }
    } else {
      throw Exception('API 호출 실패: ${response.statusText}');
    }
  }
}
