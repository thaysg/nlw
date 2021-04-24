import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonComponents extends StatelessWidget {
  final String label;
  final Color colour;
  final Color containerDec;
  final Color borderContainer;

  const LevelButtonComponents(
      {Key? key,
      required this.label,
      required this.colour,
      required this.containerDec,
      required this.borderContainer})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: containerDec,
        border: Border.fromBorderSide(
          BorderSide(color: borderContainer),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 6),
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            color: colour,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
