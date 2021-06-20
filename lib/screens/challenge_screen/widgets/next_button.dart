import 'package:flutter/material.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color colour;
  final Color fontColor;
  final VoidCallback onTap;

  const NextButtonWidget({
    Key? key,
    required this.label,
    required this.colour,
    required this.fontColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              colour,
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            )),
        onPressed: onTap,
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Regular 400',
            letterSpacing: 2,
            fontWeight: FontWeight.w400,
            fontSize: 27,
            color: fontColor,
          ),
        ),
      ),
    );
  }
}
