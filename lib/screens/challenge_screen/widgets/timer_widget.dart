import 'package:DevQuiz/components/constants.dart';
import 'package:flutter/material.dart';

class TimerWidget extends StatelessWidget {
  final String text;
  const TimerWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundColor: kpurpleOneColor,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 35.0,
          fontWeight: FontWeight.w700,
          fontFamily: 'Times New Roman',
        ),
      ),
    );
  }
}
