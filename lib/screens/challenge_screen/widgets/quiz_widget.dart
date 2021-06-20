import 'package:DevQuiz/components/colors.dart';
import 'package:DevQuiz/components/constants.dart';
import 'package:DevQuiz/models/answers_model.dart';
import 'package:DevQuiz/models/question_model.dart';
import 'package:flutter/material.dart';
import 'answer_widget.dart';

class QuizWidget extends StatefulWidget {
  //final String title;
  final QuestionModel question;
  final ValueChanged<bool> onSelected;

  const QuizWidget({Key? key, required this.question, required this.onSelected})
      : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;
  AnswerModel answers(int index) => widget.question.answers[index];
  @override
  Widget build(BuildContext context) {
    return Container(
      /* margin: EdgeInsets.symmetric(
        horizontal: 16,
      ), */
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.greyTwo,
                border: Border.fromBorderSide(
                  BorderSide(
                    color: AppColors.border,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Text(
                  widget.question.title,
                  style: quizText,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          for (var i = 0; i < widget.question.answers.length; i++)
            Answer(
              answer: answers(i),
              disable: indexSelected != -1,
              isSelected: indexSelected == i,
              onTap: (value) {
                indexSelected = i;
                setState(() {});
                Future.delayed(Duration(seconds: 1))
                    .then((_) => widget.onSelected(value));
              },
            )
        ],
      ),
    );
  }
}
