import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String _questionText;

  const Question(this._questionText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(30, 0, 30, 30),
      // margin: const EdgeInsets.all(30),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          _questionText,
          style: const TextStyle(fontSize: 28, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
