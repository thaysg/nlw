import 'dart:async';
import 'package:DevQuiz/components/colors.dart';
import 'package:DevQuiz/components/constants.dart';
import 'package:DevQuiz/models/question_model.dart';
import 'package:DevQuiz/screens/challenge_screen/widgets/challenge_controller.dart';
import 'package:DevQuiz/screens/challenge_screen/widgets/next_button.dart';
import 'package:DevQuiz/screens/challenge_screen/widgets/question_indicator_widget.dart';
import 'package:DevQuiz/screens/challenge_screen/widgets/quiz_widget.dart';
import 'package:DevQuiz/screens/challenge_screen/widgets/timer_widget.dart';
import 'package:DevQuiz/screens/result_screen/result_screen.dart';
import 'package:flutter/material.dart';

class ChallengeScreen extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;

  const ChallengeScreen(
      {Key? key, required this.questions, required this.title})
      : super(key: key);

  @override
  _ChallengeScreenState createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  final controller = ChallengeController();
  final pageController = PageController();

  int timer = 15;
  String showtimer = "15";
  bool canceltimer = false;

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextPage();
        } else if (canceltimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
    starttimer();
  }

  void nextPage() {
    canceltimer = false;
    timer = 15;
    starttimer();
    if (controller.currentPage < widget.questions.length)
      pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    //canceltimer = true;
  }

  void onSelectes(bool value) {
    if (value) {
      controller.rightAnswers++;
    }
    nextPage();
    canceltimer = false;
    timer = 15;
    starttimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(),
              ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                  currentPage: value,
                  length: widget.questions.length,
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map(
              (e) => QuizWidget(
                question: e,
                onSelected: onSelectes,
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ValueListenableBuilder<int>(
            valueListenable: controller.currentPageNotifier,
            builder: (context, value, _) => Row(
              children: [
                if (value < widget.questions.length)
                  Expanded(
                    child: TimerWidget(
                      text: showtimer,
                    ),
                  ),
                if (value == widget.questions.length)
                  Expanded(
                    child: NextButtonWidget(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultScreen(
                              title: widget.title,
                              lenght: widget.questions.length,
                              result: controller.rightAnswers,
                            ),
                          ),
                        );
                      },
                      colour: kdarkGreen,
                      fontColor: AppColors.white,
                      label: 'Confirmar',
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
