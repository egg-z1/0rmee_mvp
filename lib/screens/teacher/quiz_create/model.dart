class Quiz {
  String title;
  String description;
  DateTime openTime;
  DateTime dueTime;
  int timeLimit;
  bool isDraft;
  List<Problem> problems;

  Quiz({
    required this.title,
    required this.description,
    required this.openTime,
    required this.dueTime,
    required this.timeLimit,
    required this.isDraft,
    required this.problems
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      title: json['title'],
      description: json['description'],
      openTime: DateTime.parse(json['openTime']),
      dueTime: DateTime.parse(json['dueTime']),
      timeLimit: json['timeLimit'],
      isDraft: json['isDraft'],
      problems: List<Problem>.from(
        json['problems'].map((problem) => Problem.fromJson(problem)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'openTime': openTime.toIso8601String(),
      'dueTime': dueTime.toIso8601String(),
      'timeLimit': timeLimit,
      'isDraft': isDraft,
      'problems': problems.map((problem) => problem.toJson()).toList(),
    };
  }
}

class Problem {
  String content;
  String type;
  String answer;
  List<String> items;

  Problem({
    required this.content,
    required this.type,
    required this.answer,
    required this.items,
  });

  factory Problem.fromJson(Map<String, dynamic> json) {
    return Problem(
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