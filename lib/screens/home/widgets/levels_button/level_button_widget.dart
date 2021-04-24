import 'package:DevQuiz/components/colors.dart';
import 'package:DevQuiz/screens/home/widgets/levels_button/components.dart';
import 'package:flutter/material.dart';

class LevelButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          LevelButtonComponents(
            label: 'Fácil',
            colour: AppColors.levelButtonTextFacil,
            containerDec: AppColors.levelButtonFacil,
            borderContainer: AppColors.levelButtonBorderFacil,
          ),
          LevelButtonComponents(
            label: 'Médio',
            colour: AppColors.levelButtonTextMedio,
            containerDec: AppColors.levelButtonMedio,
            borderContainer: AppColors.levelButtonBorderMedio,
          ),
          LevelButtonComponents(
            label: 'Dificil',
            colour: AppColors.levelButtonTextDificil,
            containerDec: AppColors.levelButtonDificil,
            borderContainer: AppColors.levelButtonBorderDificil,
          ),
          LevelButtonComponents(
            label: 'Perito',
            colour: AppColors.levelButtonTextPerito,
            containerDec: AppColors.levelButtonPerito,
            borderContainer: AppColors.levelButtonBorderPerito,
          ),
        ],
      ),
    );
  }
}
