import 'package:DevQuiz/components/colors.dart';
import 'package:DevQuiz/models/levels_color.dart';
import 'package:DevQuiz/screens/challenge_screen/challenge_screen.dart';
import 'package:DevQuiz/screens/home/home_controller.dart/home_controller.dart';
import 'package:DevQuiz/screens/home/home_controller.dart/home_state.dart';
import 'package:DevQuiz/screens/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = HomeController();

  /* Color? easy;
  Color? medium;
  Color? hard;
  Color? expert;
  Color? colour; */

  /* getColor() {
    if (color == 1) {
      return Color(0xff28b851);
    } else if (color == 2) {
      return Color(0xffe7f525);
    } else if (color == 3) {
      return Color(0xfff59d05);
    } else if (color == 4) {
      return Color(0xffd90936);
    } else {}
  } */

  Color colorRule(String color) {
    if (color == 'Easy') {
      return LevelColor.Easy;
    } else if (color == 'Medium') {
      return LevelColor.Medium;
    } else if (color == 'Hard') {
      return LevelColor.Hard;
    } else if (color == 'Expert') {
      return LevelColor.Expert;
    } else {
      return LevelColor.NoColor;
    }
  }

  @override
  void initState() {
    super.initState();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Bible Quiz',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
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
                                  builder: (context) => ChallengeScreen(
                                    questions: e.questions,
                                    title: e.title,
                                  ),
                                ),
                              );
                              print('object');
                            },
                            title: e.title,
                            picture: e.image,
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
