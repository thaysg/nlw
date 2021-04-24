import 'package:DevQuiz/challenge/widgets/challenge_controller.dart';
import 'package:DevQuiz/challenge/widgets/next_button.dart';
import 'package:DevQuiz/challenge/widgets/question_indicator_widget.dart';
import 'package:DevQuiz/challenge/widgets/quiz_widget.dart';
import 'package:DevQuiz/components/colors.dart';
import 'package:DevQuiz/components/models/question_model.dart';
import 'package:DevQuiz/screens/result_page/result_page.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;

  const ChallengePage({Key? key, required this.questions, required this.title})
      : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
  }

  void nextPage() {
    if (controller.currentPage < widget.questions.length)
      pageController.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.linear);
  }

  void onSelectes(bool value) {
    if (value) {
      controller.rightAnswers++;
    }
    nextPage();
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
                          child: NextButtonWidget(
                            onTap: nextPage,
                            colour: AppColors.white,
                            fontColor: AppColors.grey,
                            label: 'Pular',
                          ),
                        ),
                      if (value == widget.questions.length)
                        Expanded(
                          child: NextButtonWidget(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResultPage(
                                    title: widget.title,
                                    lenght: widget.questions.length,
                                    result: controller.rightAnswers,
                                  ),
                                ),
                              );
                            },
                            colour: AppColors.darkGreen,
                            fontColor: AppColors.white,
                            label: 'Confirmar',
                          ),
                        ),
                    ],
                  )),
        ),
      ),
    );
  }
}
