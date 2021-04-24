import 'package:flutter/material.dart';

import 'package:DevQuiz/components/colors.dart';
import 'package:DevQuiz/components/images.dart';
import 'package:DevQuiz/components/linear_progress.dart';
import 'package:DevQuiz/components/text_style.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String progress;
  final double percent;
  final VoidCallback onTap;

  const QuizCardWidget({
    Key? key,
    required this.title,
    required this.progress,
    required this.percent,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(
              color: AppColors.border,
            ),
          ),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 40,
                child: Image.asset(AppImages.blocks),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                title,
                style: AppTextStyles.heading15,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      progress,
                      style: AppTextStyles.body11,
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: ProgressIndicatorWidget(
                        value: percent,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}