class LectureModel {
  final String? profileImage;
  final String name;
  final String title;

  LectureModel({
    this.profileImage,
    required this.name,
    required this.title,
  });

  factory LectureModel.fromJson(Map<String, dynamic> json) {
    return LectureModel(
      profileImage: json['profileImage'],
      name: json['name'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() => {
        'profileImage': profileImage,
        'name': name,
        'title': title,
      };
}

class TeacherSideMenuModel {
  final List<LectureModel> openLectures;
  final List<LectureModel> closedLectures;

  TeacherSideMenuModel({
    required this.openLectures,
    required this.closedLectures,
  });

  factory TeacherSideMenuModel.fromJson(Map<String, dynamic> json) {
    return TeacherSideMenuModel(
      openLectures: (json['openLectures'] as List)
          .map((lecture) => LectureModel.fromJson(lecture))
          .toList(),
      closedLectures: (json['closedLectures'] as List)
          .map((lecture) => LectureModel.fromJson(lecture))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'openLectures':
            openLectures.map((lecture) => lecture.toJson()).toList(),
        'closedLectures':
            closedLectures.map((lecture) => lecture.toJson()).toList(),
      };
}
