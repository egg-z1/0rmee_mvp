class Quiz {
  final String id;
  final String quizName;
  final String quizDate;
  final bool quizAvailable;

  Quiz({
    required this.id,
    required this.quizName,
    required this.quizDate,
    required this.quizAvailable,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['id'],
      quizName: json['quizName'],
      quizDate: json['quizDate'],
      quizAvailable: json['quizAvailable'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'quizName': quizName,
        'quizDate': quizDate,
        'quizAvailable': quizAvailable,
      };
}

class LectureDetailModel {
  final String id;
  final String? profileImage;
  final String name;
  final String title;
  final bool isAvailable;
  final List<Quiz>? quizList;

  LectureDetailModel({
    required this.id,
    this.profileImage,
    required this.name,
    required this.title,
    required this.isAvailable,
    this.quizList,
  });

  factory LectureDetailModel.fromJson(Map<String, dynamic> json) {
    return LectureDetailModel(
      id: json['id'],
      name: json['name'],
      profileImage: json['profileImage'],
      title: json['title'],
      isAvailable: json['isAvailable'],
      quizList: json['quizList'] != null
          ? (json['quizList'] as List)
              .map((quiz) => Quiz.fromJson(quiz))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'title': title,
        'isAvailable': isAvailable,
        'quizList': quizList?.map((quiz) => quiz.toJson()).toList(),
      };
}
