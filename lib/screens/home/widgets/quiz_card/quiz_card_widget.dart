import 'package:DevQuiz/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:DevQuiz/components/colors.dart';
import 'package:DevQuiz/components/linear_progress.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String progress;
  final double percent;
  final VoidCallback onTap;
  final String picture;

  const QuizCardWidget({
    Key? key,
    required this.title,
    required this.progress,
    required this.percent,
    required this.onTap,
    required this.picture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black,
                blurRadius: 15.0,
                offset: Offset(0.0, 0.75))
          ],
          border: Border.fromBorderSide(
            BorderSide(
              color: AppColors.border,
            ),
          ),
          color: Color(0xff383D6E),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 60,
                child: Image.asset(
                  picture,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: levelText,
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Text(
                    progress,
                    style: levelProgress,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ProgressIndicatorWidget(
                    value: percent,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
