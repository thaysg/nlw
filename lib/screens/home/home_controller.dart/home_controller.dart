import 'package:DevQuiz/models/quiz_model.dart';
import 'package:DevQuiz/screens/home/home_controller.dart/home_state.dart';
import 'package:DevQuiz/screens/home/repository/home_repository.dart';
import 'package:flutter/widgets.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  void getQuizzes() async {
    state = HomeState.loading;

    quizzes = await repository.getQuizzes();
    state = HomeState.success;
  }
}
