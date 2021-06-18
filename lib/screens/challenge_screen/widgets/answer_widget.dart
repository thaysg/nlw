import 'package:DevQuiz/components/colors.dart';
import 'package:DevQuiz/components/constants.dart';
import 'package:DevQuiz/models/answers_model.dart';
import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final AnswerModel answer;
  final bool isSelected;
  final ValueChanged<bool> onTap;
  final bool disable;

  const Answer({
    Key? key,
    this.isSelected = false,
    required this.answer,
    required this.onTap,
    this.disable = false,
  }) : super(key: key);

  Color get _selectedColorRight =>
      answer.isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      answer.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      answer.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      answer.isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      answer.isRight ? rightText : wrongText;

  IconData get _selectedIconRight => answer.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: disable,
      child: GestureDetector(
        onTap: () {
          onTap(answer.isRight);
        },
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: isSelected ? _selectedColorCardRight : AppColors.black,
            borderRadius: BorderRadius.circular(10),
            border: Border.fromBorderSide(
              BorderSide(
                color: isSelected ? _selectedBorderCardRight : AppColors.border,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    answer.title,
                    style: isSelected ? _selectedTextStyleRight : answerText,
                  ),
                ),
                Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color:
                        isSelected ? _selectedColorRight : AppColors.darkGreen,
                    borderRadius: BorderRadius.circular(500),
                    border: Border.fromBorderSide(
                      BorderSide(
                        color: isSelected
                            ? _selectedBorderRight
                            : AppColors.border,
                      ),
                    ),
                  ),
                  child: isSelected
                      ? Icon(
                          _selectedIconRight,
                          size: 16,
                          color: AppColors.white,
                        )
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
