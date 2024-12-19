class LectureCreateModel {
  final String title;
  final String description;
  final List<String> lectureDays;
  final String startTime;
  final String endTime;
  final String dueTime;

  LectureCreateModel({
    required this.title,
    required this.description,
    required this.lectureDays,
    required this.startTime,
    required this.endTime,
    required this.dueTime,
  });

  factory LectureCreateModel.fromJson(Map<String, dynamic> json) {
    return LectureCreateModel(
      title: json['title'],
      description: json['description'],
      lectureDays: List<String>.from(json['lectureDays']),
      startTime: json['startTime'],
      endTime: json['endTime'],
      dueTime: json['dueTime'],
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'lectureDays': lectureDays,
        'startTime': startTime,
        'endTime': endTime,
        'dueTime': dueTime,
      };
}
