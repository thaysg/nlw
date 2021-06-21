import 'package:flutter/material.dart';

class AddsWidgets extends StatelessWidget {
  const AddsWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 50,
        width: double.infinity,
        color: Colors.white,
        child: Center(
          child: Text(
            'Anuncios',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
