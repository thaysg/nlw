import 'package:DevQuiz/challenge/widgets/next_button.dart';
import 'package:DevQuiz/components/colors.dart';
import 'package:DevQuiz/components/images.dart';
import 'package:DevQuiz/components/text_style.dart';
import 'package:DevQuiz/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int lenght;
  final int result;

  const ResultPage(
      {Key? key,
      required this.title,
      required this.lenght,
      required this.result})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.only(top: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 4,
              child: Image.asset(
                AppImages.trophy,
              ),
            ),
            Expanded(
              child: Text(
                'Parabéns!',
                style: AppTextStyles.heading40,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: Text.rich(
                TextSpan(
                  text: 'Você concluiu',
                  style: AppTextStyles.body,
                  children: [
                    TextSpan(
                      text: '\n$title',
                      style: AppTextStyles.bodyBold,
                      children: [
                        TextSpan(
                            text: '\ncom $result de $lenght acertos',
                            style: AppTextStyles.body),
                      ],
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: NextButtonWidget(
                label: 'Compartilhar',
                colour: AppColors.purple,
                fontColor: AppColors.white,
                onTap: () {
                  Share.share('text');
                },
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: NextButtonWidget(
                label: 'Voltar ao inicio',
                colour: Colors.transparent,
                fontColor: AppColors.grey,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
