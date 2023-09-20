import 'package:flutter/material.dart';
import 'package:test/main.dart';
import 'dart:math';
import '../quiz.dart';
import '../result.dart';

class QuizPageH5 extends StatefulWidget {
  const QuizPageH5({super.key});

  @override
  State<StatefulWidget> createState() => _QuizPageH5();
}

class _QuizPageH5 extends State<QuizPageH5> {
  final _usedQuestionIndices =
      Set<int>.from(List.generate(5, (index) => index));
  var _questionIndex = 0;
  // var _totalScore = 0;
  var _correctAnswers = 0; // 정답 개수를 저장하는 변수
  var _incorrectAnswers = 0; // 오답 개수를 저장하는 변수
  // int _currentProgress = 1;
  final _questions = const [
    {
      'questionText': '다음 중 시스템에 대한 접근을 사용자/그룹의 신분 기반으로 제한하는 방법으로 가장 알맞은 것은?',
      'answers': [
        {'text': 'MAC', 'correct': false},
        {'text': 'DAC', 'correct': true},
        {'text': 'RBAC', 'correct': false},
        {'text': 'ABAC', 'correct': false},
      ],
    },
    {
      'questionText': '다음 중 SPICE 프로세스 수행 능력 수준으로 가장 알맞지 않은 것은?',
      'answers': [
        {'text': '초기화 단계', 'correct': true},
        {'text': '관리 단계', 'correct': false},
        {'text': '예측 단계', 'correct': false},
        {'text': '최적화 단계', 'correct': false},
      ],
    },
    {
      'questionText': '다음 중 대칭 키 암호 방식이 아닌 것은?',
      'answers': [
        {'text': 'RC4', 'correct': false},
        {'text': 'AES', 'correct': false},
        {'text': 'ECC', 'correct': true},
        {'text': 'SEED', 'correct': false},
      ],
    },
    {
      'questionText': '다음 중 버퍼 오버플루우 공격에 대한 대응 방안으로 올바르지 않은 것은?',
      'answers': [
        {'text': '시스로그 활용', 'correct': true},
        {'text': '스택가드 활용', 'correct': false},
        {'text': '스택쉴드 활용', 'correct': false},
        {'text': 'ASLR 활용', 'correct': false},
      ],
    },
    {
      'questionText': '다음 중 유한체 위에서 정의된 타원곡선 군에서 이산대수의 문제에 기초한 공개키 암호화 알고리즘은?',
      'answers': [
        {'text': 'Diffie-Helllman', 'correct': false},
        {'text': 'RSA', 'correct': false},
        {'text': 'ElGamal', 'correct': false},
        {'text': 'ECC', 'correct': true},
      ],
    },
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      // _totalScore = 0;
      _correctAnswers = 0; // 퀴즈 재시작시 정답 개수 초기화
      _incorrectAnswers = 0; // 퀴즈 재시작시 오답 개수 초기화
      _usedQuestionIndices.clear();
      // _currentProgress = 1;
    });
  }

  // void _updateProgress() {
  //   setState(() {
  //     _currentProgress++;
  //   });
  // }

  void _answerQuestion(bool isCorrect) {
    setState(() {
      if (isCorrect) {
        _correctAnswers++;
      } else {
        _incorrectAnswers++;
      }

      // 사용하지 않은 문제들 중에서 랜덤으로 문제 선택
      int newIndex;
      do {
        newIndex = Random().nextInt(_questions.length);
      } while (!_usedQuestionIndices.contains(newIndex));

      // 선택된 문제를 사용한 문제들 집합에서 제거
      _usedQuestionIndices.remove(newIndex);

      // Update progress
      // _updateProgress();

      if (_usedQuestionIndices.isNotEmpty) {
        // 아직 사용하지 않은 문제가 있다면 퀴즈 계속 진행
        _questionIndex = newIndex; // 수정된 부분
      } else {
        // 퀴즈 종료 후 결과 페이지로 이동
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) =>
                Result(_resetQuiz, _correctAnswers, _incorrectAnswers),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Center(
            child: Text(
              '정보시스템 구축 관리',
              style: TextStyle(color: Colors.white),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => const HomePage(),
                  ),
                );
              },
              icon: const Icon(Icons.home),
            ),
          ],
        ),
        body: _usedQuestionIndices.isNotEmpty
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
                // totalQuestions: _questions.length,
                // progress: _currentProgress,
              )
            : Result(_resetQuiz, _correctAnswers, _incorrectAnswers),
        backgroundColor: Colors.black,
      ),
    );
  }
}

//   void _answerQuestion(bool isCorrect) {
//     setState(() {
//       if (isCorrect) {
//         _correctAnswers++;
//       } else {
//         _incorrectAnswers++;
//       }

//       // 사용하지 않은 문제들 중에서 랜덤으로 문제 선택
//       int newIndex;
//       do {
//         newIndex = Random().nextInt(_questions.length);
//       } while (!_usedQuestionIndices.contains(newIndex));

//       // 선택된 문제를 사용한 문제들 집합에서 제거
//       _usedQuestionIndices.remove(newIndex);

//       // 선택된 문제로 변경
//       _questionIndex = newIndex;

//       if (_usedQuestionIndices.isNotEmpty) {
//         // 아직 사용하지 않은 문제가 있다면 퀴즈 계속 진행
//         // 여기에 다음 문제로 넘어가는 로직을 추가할 수 있습니다.
//       } else {
//         // 퀴즈 종료 후 결과 페이지로 이동
//         Navigator.of(context).push(
//           MaterialPageRoute(
//             builder: (ctx) =>
//                 Result(_resetQuiz, _correctAnswers, _incorrectAnswers),
//           ),
//         );
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // theme: ThemeData(primarySwatch: Colors.blue),
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.black,
//           title: const Center(
//             child: Text(
//               '퀴즈퀴즈',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//           actions: [
//             IconButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (ctx) => const HomePage(),
//                   ),
//                 );
//               },
//               icon: const Icon(Icons.home),
//             ),
//           ],
//         ),
//         body: _questionIndex < _questions.length
//             ? Quiz(
//                 answerQuestion: _answerQuestion,
//                 questionIndex: _questionIndex,
//                 questions: _questions)
//             : Result(_resetQuiz, _correctAnswers, _incorrectAnswers),
//         backgroundColor: Colors.black,
//       ),
//     );
//   }
// }
