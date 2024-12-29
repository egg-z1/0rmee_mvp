class Quiz {
  final String id;
  final String quizName;
  final String quizDate;
  final int timeLimit;
  late final bool quizAvailable;
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

class QuizzesDraft {
  final List<Quiz> draftQuizzes;

  QuizzesDraft({required this.draftQuizzes});

  factory QuizzesDraft.fromJson(Map<String, dynamic> json) {
    return QuizzesDraft(
        draftQuizzes:
            (json['data'] as List).map((quiz) => Quiz.fromJson(quiz)).toList());
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

class QuizStatistics {
  final int rank;
  final int problemId;
  final int problemNum;
  final int incorrectRate;
  final int incorrectCount;

  QuizStatistics({
    required this.rank,
    required this.problemId,
    required this.problemNum,
    required this.incorrectRate,
    required this.incorrectCount,
  });

  factory QuizStatistics.fromJson(Map<String, dynamic> json) {
    return QuizStatistics(
      rank: json['rank'],
      problemId: json['problemId'],
      problemNum: json['problemNum'],
      incorrectRate: json['incorrectRate'],
      incorrectCount: json['incorrectCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rank': rank,
      'problemId': problemId,
      'problemNum': problemNum,
      'incorrectRate': incorrectRate,
      'incorrectCount': incorrectCount,
    };
  }
}

class ProblemStatistics {
  final String content;
  final String type;
  final String answer;
  final List<Result> results;

  ProblemStatistics({
    required this.content,
    required this.type,
    required this.answer,
    required this.results,
  });

  factory ProblemStatistics.fromJson(Map<String, dynamic> json) {
    return ProblemStatistics(
      content: json['content'] as String? ?? '',
      type: json['type'] as String? ?? '',
      answer: json['answer'] as String? ?? '',
      results: (json['results'] as List?)
              ?.map((result) => Result.fromJson(result as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}

class Result {
  final int rank;
  final String? content;
  final int count;
  final String option;

  Result({
    required this.rank,
    required this.content,
    required this.count,
    required this.option,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      rank: json['rank'] as int? ?? 0,
      content: json['content'] as String? ?? '',
      count: json['count'] as int? ?? 0,
      option: json['option'] as String? ?? '',
    );
  }
}
