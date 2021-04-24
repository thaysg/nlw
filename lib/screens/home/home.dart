import 'package:DevQuiz/challenge/challenge_page.dart';
import 'package:DevQuiz/components/colors.dart';
import 'package:DevQuiz/screens/home/home_controller.dart/home_controller.dart';
import 'package:DevQuiz/screens/home/home_controller.dart/home_state.dart';
import 'package:DevQuiz/screens/home/widgets/app_bar/app_bar.dart';
import 'package:DevQuiz/screens/home/widgets/levels_button/level_button_widget.dart';
import 'package:DevQuiz/screens/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = HomeController();
  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
        appBar: MyAppBar(user: controller.user!),
        body: Column(
          children: [
            LevelButtonWidget(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: controller.quizzes!
                      .map((e) => QuizCardWidget(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChallengePage(
                                    questions: e.questions,
                                    title: e.title,
                                  ),
                                ),
                              );
                              print('object');
                            },
                            title: e.title,
                            progress:
                                '${e.questionAnswerd}/${e.questions.length}',
                            percent: e.questionAnswerd / e.questions.length,
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}
