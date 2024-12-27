class Quiz {
  final String id;
  final String quizName;
  final String quizDate;
  final int timeLimit;
  late final bool quizAvailable;

  Quiz({
    required this.id,
    required this.quizName,
    required this.quizDate,
    required this.timeLimit,
    required this.quizAvailable,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['id'],
      quizName: json['quizName'],
      quizDate: json['quizDate'],
      timeLimit: json['timeLimit'],
      quizAvailable: json['quizAvailable'],
    );
  }
}

class QuizzesResponse {
  final List<Quiz> openQuizzes;
  final List<Quiz> closedQuizzes;

  QuizzesResponse({
    required this.openQuizzes,
    required this.closedQuizzes,
  });

  factory QuizzesResponse.fromJson(Map<String, dynamic> json) {
    return QuizzesResponse(
      openQuizzes: (json['data']['openQuizzes'] as List)
          .map((quiz) => Quiz.fromJson(quiz))
          .toList(),
      closedQuizzes: (json['data']['closedQuizzes'] as List)
          .map((quiz) => Quiz.fromJson(quiz))
          .toList(),
    );
  }
}
