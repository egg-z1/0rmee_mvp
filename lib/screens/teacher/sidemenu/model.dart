class LectureModel {
  final String id;
  final String? profileImage;
  final String name;
  final String title;

  LectureModel({
    required this.id,
    this.profileImage,
    required this.name,
    required this.title,
  });

  factory LectureModel.fromJson(Map<String, dynamic> json) {
    return LectureModel(
      id: json['id'],
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

class TeacherUser {
  final String name;
  final String email;
  final String phoneNumber;
  final String image;

  TeacherUser({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.image,
  });

  factory TeacherUser.fromJson(Map<String, dynamic> json) {
    return TeacherUser(
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      image: json['image'],
    );
  }
}
