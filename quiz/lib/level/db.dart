import 'package:flutter/material.dart';
import 'package:test/main.dart';
import 'dart:math';
import '../quiz.dart';
import '../result.dart';

class QuizPageH3 extends StatefulWidget {
  const QuizPageH3({super.key});

  @override
  State<StatefulWidget> createState() => _QuizPageH3();
}

class _QuizPageH3 extends State<QuizPageH3> {
  final _usedQuestionIndices =
      Set<int>.from(List.generate(5, (index) => index));
  var _questionIndex = 0;
  // var _totalScore = 0;
  var _correctAnswers = 0; // 정답 개수를 저장하는 변수
  var _incorrectAnswers = 0; // 오답 개수를 저장하는 변수
  // int _currentProgress = 1;
  final _questions = const [
    {
      'questionText': '다음 중 반정규화 테이블 병합을 위한 테이블의 종류가 아닌 것은?',
      'answers': [
        {'text': '1:1 관계', 'correct': false},
        {'text': '1:M 관계', 'correct': false},
        {'text': 'N:M 관계', 'correct': true},
        {'text': '슈퍼/서브타입 관계', 'correct': false},
      ],
    },
    {
      'questionText': '다음 중 DML(Data Manipulation Language)가 아닌 것은?',
      'answers': [
        {'text': 'SELECT - 데이터 조회', 'correct': false},
        {'text': 'INSERT - 테이터 삽입', 'correct': false},
        {'text': 'DELETE - 데이터 삭제', 'correct': false},
        {'text': 'ALTER - 데이터 갱신', 'correct': true},
      ],
    },
    {
      'questionText':
          '튜플을 유일하게 식별할 수 있는 하나 또는 그 이상의 Attribute 집합으로 튜플에 대한 유일성은만족하나 최소성을 만족하지 못하는 키는?',
      'answers': [
        {'text': '슈퍼키', 'correct': true},
        {'text': '대체키', 'correct': false},
        {'text': '후보키', 'correct': false},
        {'text': '기본키', 'correct': false},
      ],
    },
    {
      'questionText': '다음 중 파티셔닝의 종류로 올바르지 않은 것은?',
      'answers': [
        {'text': 'Merge Partitioning', 'correct': true},
        {'text': 'Range Partitioning', 'correct': false},
        {'text': 'List Partitioning', 'correct': false},
        {'text': 'Composite Partitioning', 'correct': false},
      ],
    },
    {
      'questionText': '외래키(Foreign Key)와 가장 직접적으로 관련된 제약 조건은 어느 것인가?',
      'answers': [
        {'text': '개체 무결성', 'correct': false},
        {'text': '참조 무결성', 'correct': true},
        {'text': '속성 무결성', 'correct': false},
        {'text': '사용자 무결성', 'correct': false},
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
              '데이터베이스 구축',
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
