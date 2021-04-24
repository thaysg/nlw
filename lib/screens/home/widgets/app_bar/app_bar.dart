import 'package:DevQuiz/components/app_color.dart';
import 'package:DevQuiz/components/models/user_model.dart';
import 'package:DevQuiz/components/text_style.dart';
import 'package:DevQuiz/screens/home/widgets/app_bar/score_card.dart';
import 'package:flutter/material.dart';

class MyAppBar extends PreferredSize {
  final UserModel user;
  MyAppBar({required this.user})
      : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
            height: 250,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: AppGradients.linear,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 161,
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                            text: 'Olá, ',
                            style: AppTextStyles.title,
                            children: [
                              TextSpan(
                                text: user.name,
                                style: AppTextStyles.titleBold,
                              ),
                            ]),
                      ),
                      Container(
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(
                              user.photo,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(0, 1),
                  child: ScoreCard(
                    percent: user.score / 100,
                  ),
                ),
              ],
            ),
          ),
        );
}
