import 'package:DevQuiz/challenge/widgets/answer_widget.dart';
import 'package:DevQuiz/components/models/answers_model.dart';
import 'package:DevQuiz/components/models/question_model.dart';
import 'package:DevQuiz/components/text_style.dart';
import 'package:flutter/material.dart';

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
        children: [
          Text(
            widget.question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
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
