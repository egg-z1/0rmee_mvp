import 'package:ormee_mvp/screens/quiz/model.dart';

class QuizResultModel {
  final int correct;
  final List<QuizCard> problemDtos;

  QuizResultModel({
    required this.correct,
    required this.problemDtos,
  });

  factory QuizResultModel.fromJson(Map<String, dynamic> json) {
    return QuizResultModel(
      correct: json['correct'],
      problemDtos: (json['problemDtos'] as List<dynamic>)
          .map((item) => QuizCard.fromJson(item))
          .toList(),
    );
  }
}
