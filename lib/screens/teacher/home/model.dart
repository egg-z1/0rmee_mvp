class LectureCreateModel {
  final String title;
  final DateTime openTime;
  final DateTime dueTime;

  LectureCreateModel({
    required this.title,
    required this.openTime,
    required this.dueTime,
  });

  factory LectureCreateModel.fromJson(Map<String, dynamic> json) {
    return LectureCreateModel(
      title: json['title'] ?? '',
      openTime: DateTime.parse(
          json['startMonth'] ?? DateTime.now().toIso8601String()),
      dueTime:
          DateTime.parse(json['endMonth'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'openTime': openTime.toIso8601String(),
        'dueTime': dueTime.toIso8601String(),
      };
}

class Lecture {
  final String id;
  final int code;
  final String title;
  final String? openTime;
  final String dueTime;

  Lecture({
    required this.id,
    required this.code,
    required this.title,
    required this.openTime,
    required this.dueTime,
  });

  factory Lecture.fromJson(Map<String, dynamic> json) {
    return Lecture(
      id: json['id'],
      code: json['code'],
      title: json['title'],
      openTime: json['openTime'],
      dueTime: json['dueTime'],
    );
  }
}

class LectureResponse {
  final List<Lecture> openLectures;
  final List<Lecture> closedLectures;

  LectureResponse({
    required this.openLectures,
    required this.closedLectures,
  });

  factory LectureResponse.fromJson(Map<String, dynamic> json) {
    return LectureResponse(
      openLectures: (json['data']['openLectures'] as List)
          .map((lecture) => Lecture.fromJson(lecture))
          .toList(),
      closedLectures: (json['data']['closedLectures'] as List)
          .map((lecture) => Lecture.fromJson(lecture))
          .toList(),
    );
  }
}
