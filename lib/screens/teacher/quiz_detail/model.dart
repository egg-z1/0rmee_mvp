class QuizDetail {
  DateTime dueTime;
  int timeLimit;
  List<ProblemDetail> problems;

  QuizDetail({
    required this.dueTime,
    required this.timeLimit,
    required this.problems
  });

  factory QuizDetail.fromJson(Map<String, dynamic> data) {
    return QuizDetail(
      dueTime: DateTime.parse(data['dueTime']),
      timeLimit: data['timeLimit'],
      problems: data['problems'] != null
          ? List<ProblemDetail>.from(
        data['problems'].map((problem) => ProblemDetail.fromJson(problem)),
      )
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dueTime': dueTime.toIso8601String(),
      'timeLimit': timeLimit,
      'problems': problems.map((problem) => problem.toJson()).toList(),
    };
  }
}

class ProblemDetail {
  int id;
  String content;
  String type;
  String answer;
  List<String> items;

  ProblemDetail({
    required this.id,
    required this.content,
    required this.type,
    required this.answer,
    required this.items,
  });

  factory ProblemDetail.fromJson(Map<String, dynamic> json) {
    return ProblemDetail(
      id: json['id'],
      content: json['content'],
      type: json['type'],
      answer: json['answer'],
      items: List<String>.from(json['items']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'type': type,
      'answer': answer,
      'items': items,
    };
  }
}