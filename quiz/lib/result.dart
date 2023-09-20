import 'package:flutter/material.dart';
import 'package:test/anmation.dart';
import 'package:test/main.dart';

class Result extends StatelessWidget {
  // final int resultScore;
  final VoidCallback resetHandler;
  final int correctAnswers;
  final int incorrectAnswers;

  const Result(this.resetHandler, this.correctAnswers, this.incorrectAnswers,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: [
        const AnimatedBackground(),
        Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '정답: $correctAnswers', // 정답 개수 표시
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  '오답: $incorrectAnswers', // 오답 개수 표시
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                TextButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.blue)),
                    onPressed: () => {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => const HomePage(), // 홈으로이동
                            ),
                          )
                        },
                    child: const Text('메인으로')),
                TextButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.blue)),
                    onPressed: resetHandler,
                    child: const Text('퀴즈다시풀기')),
              ]),
        ),
      ]),
    );
  }
}
