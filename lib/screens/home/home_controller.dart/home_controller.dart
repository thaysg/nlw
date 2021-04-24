import 'package:DevQuiz/components/models/quiz_model.dart';
import 'package:DevQuiz/components/models/user_model.dart';
import 'package:DevQuiz/screens/home/home_controller.dart/home_state.dart';
import 'package:DevQuiz/screens/home/repository/home_repository.dart';
import 'package:flutter/widgets.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  void getUser() async {
    state = HomeState.loading;
    user = await repository.getUser();
    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;

    quizzes = await repository.getQuizzes();
    state = HomeState.success;
  }
}
