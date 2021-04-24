import 'package:DevQuiz/components/colors.dart';
import 'package:DevQuiz/components/images.dart';
import 'package:DevQuiz/components/text_style.dart';
import 'package:flutter/material.dart';

class QuizCardComponents extends StatelessWidget {
  final String title;
  final String progress;
  final AssetImage picture;

  const QuizCardComponents(
      {Key? key,
      required this.title,
      required this.progress,
      required this.picture})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: 24),
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
                'Gerenciamento de Estados',
                style: AppTextStyles.heading15,
              ),
              SizedBox(
                height: 20,
              ),
              /* Row(
                children: [
                  Expanded(
                    child: Text(
                      '3/10',
                      style: AppTextStyles.body11,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: LinearProgressIndicator(
                      value: .3,
                      backgroundColor: AppColors.chartSecondary,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.chartPrimary,
                      ),
                    ),
                  )
                ],
              ) */
            ],
          ),
        ),
      ),
    );
  }
}
