import 'package:flutter/material.dart';
import 'package:test/main.dart';
import 'dart:math';
import '../quiz.dart';
import '../result.dart';

class QuizPageH2 extends StatefulWidget {
  const QuizPageH2({super.key});

  @override
  State<StatefulWidget> createState() => _QuizPageH2();
}

class _QuizPageH2 extends State<QuizPageH2> {
  final _usedQuestionIndices =
      Set<int>.from(List.generate(5, (index) => index));
  var _questionIndex = 0;
  // var _totalScore = 0;
  var _correctAnswers = 0; // 정답 개수를 저장하는 변수
  var _incorrectAnswers = 0; // 오답 개수를 저장하는 변수
  // int _currentProgress = 1;
  final _questions = const [
    {
      'questionText': 'n개의 노드로 구성된 방향 그래프와 최대 간선 수는?',
      'answers': [
        {'text': 'n-1', 'correct': false},
        {'text': 'n/2', 'correct': false},
        {'text': 'n(n-1)/2', 'correct': false},
        {'text': 'n(n-1)', 'correct': true},
      ],
    },
    {
      'questionText': '문제를 나눌 수 없을 때까지 나누고, 각각을 풀면서 다시 병합하여 문제의 답을 얻는 알고리즘은?',
      'answers': [
        {'text': '탐욕법(Greedy)', 'correct': false},
        {'text': '동적계획법(Dynamic Programming)', 'correct': false},
        {'text': '분할과 정복(Divide and Conquer)', 'correct': true},
        {'text': '백트래킹(Backtracking)', 'correct': false},
      ],
    },
    {
      'questionText': ' 다음 중 결함 조치 상태(=오류 목록 상태) 중오류가 보고되었지만 아직 분석되지 않은 상태는?',
      'answers': [
        {'text': 'Open', 'correct': true},
        {'text': 'Assigned', 'correct': false},
        {'text': 'Deferred', 'correct': false},
        {'text': 'Classified', 'correct': false},
      ],
    },
    {
      'questionText': '다음 중 기본 테이블의 존재 여부에 관계 없이 뷰 생성 속성은?',
      'answers': [
        {'text': 'REPLACE', 'correct': false},
        {'text': 'FORCE', 'correct': true},
        {'text': 'NOFORCE', 'correct': false},
        {'text': 'WITH CHECK OPTION', 'correct': false},
      ],
    },
    {
      'questionText': '다음 중 DRM의 구성요소로 올바르지 않은 것은?',
      'answers': [
        {'text': '패키저(Packager)', 'correct': false},
        {'text': 'DRM 콘텐츠', 'correct': false},
        {'text': '클리어링 하우스', 'correct': false},
        {'text': '젠킨스(Jenkins)', 'correct': true},
      ],
    },
    {
      'questionText': '',
      'answers': [
        {'text': '', 'correct': false},
        {'text': '', 'correct': false},
        {'text': '', 'correct': false},
        {'text': '', 'correct': false},
      ],
    },
    {
      'questionText': '',
      'answers': [
        {'text': '', 'correct': false},
        {'text': '', 'correct': false},
        {'text': '', 'correct': false},
        {'text': '', 'correct': false},
      ],
    },
    {
      'questionText': '',
      'answers': [
        {'text': '', 'correct': false},
        {'text': '', 'correct': false},
        {'text': '', 'correct': false},
        {'text': '', 'correct': false},
      ],
    },
    {
      'questionText': '',
      'answers': [
        {'text': '', 'correct': false},
        {'text': '', 'correct': false},
        {'text': '', 'correct': false},
        {'text': '', 'correct': false},
      ],
    },
    {
      'questionText': '',
      'answers': [
        {'text': '', 'correct': false},
        {'text': '', 'correct': false},
        {'text': '', 'correct': false},
        {'text': '', 'correct': false},
      ],
    },
    {
      'questionText': '',
      'answers': [
        {'text': '', 'correct': false},
        {'text': '', 'correct': false},
        {'text': '', 'correct': false},
        {'text': '', 'correct': false},
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
              '소프트웨어 개발',
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
