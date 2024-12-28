class MemoData {
  final List<Memo> openMemos;
  final List<Memo> closeMemos;

  MemoData({required this.openMemos, required this.closeMemos});

  factory MemoData.fromJson(Map<String, dynamic> json) {
    return MemoData(
      openMemos: (json['data']['openMemos'] as List<dynamic>)
          .map((e) => Memo.fromJson(e))
          .toList(),
      closeMemos: (json['data']['closeMemos'] as List<dynamic>)
          .map((e) => Memo.fromJson(e))
          .toList(),
    );
  }
}

class Memo {
  final int id;
  final String title;
  final String? description;
  final DateTime dueTime;
  final bool isOpen;
  final int submitCount;

  Memo({
    required this.id,
    required this.title,
    this.description,
    required this.dueTime,
    required this.isOpen,
    required this.submitCount,
  });

  factory Memo.fromJson(Map<String, dynamic> json) {
    return Memo(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      dueTime: DateTime.parse(json['dueTime']),
      isOpen: json['isOpen'],
      submitCount: json['submitCount'],
    );
  }
}

class QuizData {
  final List<Quiz> openQuizzes;
  final List<Quiz> closedQuizzes;

  QuizData({required this.openQuizzes, required this.closedQuizzes});

  factory QuizData.fromJson(Map<String, dynamic> json) {
    return QuizData(
      openQuizzes: (json['data']['openQuizzes'] as List<dynamic>)
          .map((e) => Quiz.fromJson(e))
          .toList(),
      closedQuizzes: (json['data']['closedQuizzes'] as List<dynamic>)
          .map((e) => Quiz.fromJson(e))
          .toList(),
    );
  }
}

class Quiz {
  final String id;
  final String quizName;
  final String quizDate;
  final int timeLimit;
  final bool quizAvailable;
  final int submitCount;

  Quiz({
    required this.id,
    required this.quizName,
    required this.quizDate,
    required this.timeLimit,
    required this.quizAvailable,
    required this.submitCount,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['id'],
      quizName: json['quizName'],
      quizDate: json['quizDate'],
      timeLimit: json['timeLimit'],
      quizAvailable: json['quizAvailable'],
      submitCount: json['submitCount'],
    );
  }
}
