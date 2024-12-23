class QuizCard {
  final String id;
  final String content;
  final String type;
  final String answer;
  final List<String?> items;
  final bool? submission;
  final bool? isCorrect;

  QuizCard({
    required this.id,
    required this.content,
    required this.type,
    required this.answer,
    required this.items,
    this.submission,
    this.isCorrect,
  });

  factory QuizCard.fromJson(Map<String, dynamic> json) {
    return QuizCard(
      id: json['id'].toString(),
      content: json['content'],
      type: json['type'],
      answer: json['answer'],
      items: List<String>.from(json['items'] ?? []),
      submission: json['submission'],
      isCorrect: json['isCorrect'],
    );
  }
}

class QuizSubmission {
  final String author;
  final String password;
  final List<Map<String, dynamic>> submissions;

  QuizSubmission({
    required this.author,
    required this.password,
    required this.submissions,
  });

  Map<String, dynamic> toJson() => {
        'author': author,
        'password': password,
        'submissions': submissions,
      };
}
