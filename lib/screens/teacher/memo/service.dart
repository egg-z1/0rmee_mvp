import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ormee_mvp/api/OrmeeApi.dart';
import 'package:ormee_mvp/screens/teacher/memo/model.dart';

class TeacherMemoService extends GetConnect {
  TeacherMemoService() {
    httpClient.baseUrl = '${API.hostConnect}';
    httpClient.timeout = const Duration(seconds: 10);

    httpClient.addRequestModifier<dynamic>((request) async {
      request.headers['Accept'] = 'application/json';
      request.headers['Content-Type'] = 'application/json; charset=utf-8';
      return request;
    });
  }

  Future<MemosResponse> fetchMemos(String teacherId) async {
    final String url = '/teacher/$teacherId/memos';
    try {
      final response = await get(url);
      if (response.isOk) {
        return MemosResponse.fromJson(response.body);
      } else {
        throw Exception('Failed to load memos');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }

  Future<void> fetchCreateMemo(String teacherId, MemoCreateModel title) async {
    final String url = '/teacher/$teacherId/memos';
    try {
      final response = await post(url, title.toJson());
      if (response.isOk) {
      } else {
        throw Exception('Failed to load memos');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }

  Future<MemosResponse> fetchCloseMemos(String teacherId, int memoId) async {
    final String url =
        '/teacher/$teacherId/memos/$memoId/toggleIsOpen?isOpen=false';
    try {
      final response = await put(url, memoId);
      if (response.isOk) {
        return MemosResponse.fromJson(response.body);
      } else {
        throw Exception('Failed to load memos');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }
}

class MessageStatisticsService extends GetConnect {
  MessageStatisticsService() {
    httpClient.baseUrl = '${API.hostConnect}';
    httpClient.timeout = const Duration(seconds: 10);

    httpClient.addRequestModifier<dynamic>((request) async {
      request.headers['Accept'] = 'application/json';
      request.headers['Content-Type'] = 'application/json; charset=utf-8';
      return request;
    });
  }

  Future<List<MessageStatistics>> fetchMessageStatistics(int memoId) async {
    final url = '/teacher/$memoId/messages';
    final response = await get(url);

    try {
      if (response.isOk && response.body['data'] != null) {
        final List<dynamic> data = response.body['data'];
        return data
            .map((item) =>
                MessageStatistics.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception(
            'Failed to fetch message statistics: ${response.statusText}');
      }
    } catch (e) {
      throw Exception('Error occurred while fetching message statistics: $e');
    }
  }
}
