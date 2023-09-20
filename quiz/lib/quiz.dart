import 'package:flutter/material.dart';
import 'package:test/anmation.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;
  // final int totalQuestions;
  // final int progress;

  const Quiz({
    Key? key,
    required this.answerQuestion,
    required this.questions,
    required this.questionIndex,
    // required this.totalQuestions,
    // required this.progress, // 수정된 부분
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const AnimatedBackground(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Question(
                  questions[questionIndex]["questionText"] as String,
                ),
                ...(questions[questionIndex]["answers"]
                        as List<Map<String, Object>>)
                    .map((answer) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Answer(
                        () => answerQuestion(answer['correct'] as bool),
                        answer['text'] as String),
                  );
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
