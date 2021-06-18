import 'dart:convert';
import 'package:DevQuiz/models/quiz_model.dart';
import 'package:flutter/services.dart';

class HomeRepository {
  Future<List<QuizModel>> getQuizzes() async {
    final response =
        await rootBundle.loadString("assets/database/quizzes.json");
    final list = jsonDecode(response) as List;
    final quizzes = list.map((e) => QuizModel.fromMap(e)).toList();
    return quizzes;
  }
}
