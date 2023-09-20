import 'package:flutter/material.dart';
import 'package:test/main.dart';
import 'dart:math';
import '../quiz.dart';
import '../result.dart';

class QuizPageH4 extends StatefulWidget {
  const QuizPageH4({super.key});

  @override
  State<StatefulWidget> createState() => _QuizPageH4();
}

class _QuizPageH4 extends State<QuizPageH4> {
  final _usedQuestionIndices =
      Set<int>.from(List.generate(5, (index) => index));
  var _questionIndex = 0;
  // var _totalScore = 0;
  var _correctAnswers = 0; // 정답 개수를 저장하는 변수
  var _incorrectAnswers = 0; // 오답 개수를 저장하는 변수
  // int _currentProgress = 1;
  final _questions = const [
    {
      'questionText': '교착상태 발생조건으로 가장 알맞지 않은 것은?',
      'answers': [
        {'text': 'Mutual Exclusion', 'correct': false},
        {'text': 'Hold and Wait', 'correct': false},
        {'text': 'Preemption', 'correct': true},
        {'text': 'Circular Wait', 'correct': false},
      ],
    },
    {
      'questionText': 'Java 프로그래밍 언어의 데이터 타입 중 ‘byte’의 크기는?',
      'answers': [
        {'text': '1byte', 'correct': true},
        {'text': '2byte', 'correct': false},
        {'text': '4byte', 'correct': false},
        {'text': '6byte', 'correct': false},
      ],
    },
    {
      'questionText': '다음 중 IPv4에서 IPv6로 전환 기법으로 올바르지 않은 것은?',
      'answers': [
        {'text': 'Routing Table', 'correct': true},
        {'text': 'Dual Stack', 'correct': false},
        {'text': 'Tunneling', 'correct': false},
        {'text': 'Address Translation', 'correct': false},
      ],
    },
    {
      'questionText': '다음 중 교착 상태 해결방안 중 Detection 기법에 해당되는 것은?',
      'answers': [
        {'text': 'Banker’s Algorithm', 'correct': false},
        {'text': 'Hold and Wait', 'correct': false},
        {'text': 'Resource Allocation Graph', 'correct': true},
        {'text': 'Process Kill', 'correct': false},
      ],
    },
    {
      'questionText':
          '다음 중 관계형 데이터베이스 관리 시스템(RDBMS)의 데이터를 관리하기 위해 설계된 특수 목적의 프로그래밍 언어는?',
      'answers': [
        {'text': 'Haskell', 'correct': false},
        {'text': 'LISP', 'correct': false},
        {'text': 'Prolog', 'correct': false},
        {'text': 'SQL', 'correct': true},
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
              '프로그래밍 언어 활용',
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
