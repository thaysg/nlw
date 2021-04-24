import 'package:DevQuiz/components/colors.dart';
import 'package:DevQuiz/components/text_style.dart';
import 'package:DevQuiz/screens/home/widgets/app_bar/chart_widget.dart';
import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  final double percent;

  const ScoreCard({Key? key, required this.percent}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 136,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ChartWidget(
                  percent: percent,
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Vamos Começar',
                        style: AppTextStyles.heading,
                      ),
                      Text(
                        'Conquiste ',
                        style: AppTextStyles.body,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
