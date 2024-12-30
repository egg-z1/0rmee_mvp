import 'dart:convert';

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

  Future<void> fetchCreateLecture(
      String teacherCode, LectureCreateModel lecture) async {
    final String url = '/lectures/$teacherCode';
    try {
      final response = await post(url, lecture.toJson());

      if (response.isOk) {
      } else {
        throw Exception(
            'Request failed: [${response.statusCode}] ${response.bodyString}');
      }
    } catch (e, stackTrace) {
      print('Error creating lecture: $e');
      rethrow;
    }
  }

  Future<LectureResponse> fetchLectures(String teacherCode) async {
    final String url = '/lectures/teacher/$teacherCode';
    try {
      final response = await get(url);

      if (response.isOk) {
        return LectureResponse.fromJson(response.body);
      } else {
        throw Exception(
            'Request failed: [${response.statusCode}] ${response.bodyString}');
      }
    } catch (e, stackTrace) {
      print('Error fetching lectures: $e');
      rethrow;
    }
  }

  Future<void> fetchDeleteLecture(int lectureCode) async {
    final String url = '/lectures/$lectureCode';
    try {
      final response = await delete(url);

      if (response.isOk) {
      } else {
        throw Exception(
            'Request failed: [${response.statusCode}] ${response.bodyString}');
      }
    } catch (e, stackTrace) {
      print('Error deleting lecture: $e');
      rethrow;
    }
  }
}
