import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

const kSecondaryColor = Color(0xFF8B94BC);
const kyellowOneColor = Color(0xFFfbb551);
const kAmberColor = Color(0xFFfaa54b);
const kpurpleOneColor = Color(0xffd382c7);
const kpurpleTwoColor = Color(0xffa54b85);
const kDarkPurple = Color(0xff080A1E);
const kDarkTwoPurple = Color(0xff333256);
const kGreenColor = Color(0xFF6AC259);
const kdarkGreen = Color(0xFF04D361);
const kDarkBlue = Color(0xff2748A0);
const kRed = Color(0xffC73442);
const kdarkRed = Color(0xFFCC3750);
const kPink = Color(0xffB038A0);
const kGrayColor = Color(0xFFC1C1C1);
const kBlackColor = Color(0xFF101010);
const kWhiteColor = Color(0xFFF1F1F1);
const kPrimaryGradient = LinearGradient(
  colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);
const kSecondaryGradient = LinearGradient(colors: [
  Color(0xffa54b85),
  Color(0xFF57B6E5),
], stops: [
  0.0,
  0.695
], transform: GradientRotation(2.13959913 * pi));

const double kDefaultPadding = 20.0;

const splashText = TextStyle(
  fontSize: 60,
  color: Color(0xff532c61),
  fontWeight: FontWeight.bold,
  fontFamily: 'Regular 400',
  shadows: [
    Shadow(blurRadius: 5.0, color: Color(0xfffaa54b), offset: Offset(3.0, 3.0)),
  ],
);

const levelText = TextStyle(
  color: kDarkPurple,
  fontFamily: 'Regular 400',
  letterSpacing: 2,
  fontSize: 25,
  fontWeight: FontWeight.w800,
);

const levelProgress = TextStyle(
  color: kDarkPurple,
  fontFamily: 'Regular 400',
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

const answerText = TextStyle(
  color: kDarkPurple,
  fontFamily: 'Regular 400',
  letterSpacing: 2,
  fontSize: 22,
  fontWeight: FontWeight.w800,
);

const rightText = TextStyle(
  color: kdarkGreen,
  fontFamily: 'Regular 400',
  letterSpacing: 2,
  fontSize: 22,
  fontWeight: FontWeight.w800,
);

const wrongText = TextStyle(
  color: kdarkRed,
  fontFamily: 'Regular 400',
  letterSpacing: 2,
  fontSize: 22,
  fontWeight: FontWeight.w800,
);

/* 
const kTimeWidget = CircularCountDownTimer(
  duration: 14,
  fillColor: kDarkBlue,
  color: Colors.white,
  backgroundColor: Colors.transparent,
  strokeWidth: 10.0,
  strokeCap: StrokeCap.round,
  isTimerTextShown: true,
  isReverse: false,
  textStyle: TextStyle(
    fontSize: 50.0,
    color: kWhiteColor,
  ),
); */
