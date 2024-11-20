import 'package:get/get.dart';
import 'package:ormee_mvp/api/OrmeeApi.dart';
import 'package:ormee_mvp/screens/lecture_detail/model.dart';

class LectureService extends GetConnect {
  final String baseUrl = '${API.hostConnect}'; // Replace with your API URL

  LectureService() {
    httpClient.baseUrl = baseUrl;
    httpClient.timeout = Duration(seconds: 10); // 요청 타임아웃 설정
  }

  // LectureDetailModel 한 번에 가져오기
  Future<LectureDetailModel> fetchLectureDetail(String lectureId) async {
    final response = await get('/lectures/$lectureId');

    if (response.isOk) {
      return LectureDetailModel.fromJson(response.body);
    } else {
      throw Exception('Failed to load lecture details: ${response.statusText}');
    }
  }
}
