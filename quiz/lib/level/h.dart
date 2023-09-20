import 'package:flutter/material.dart';
import 'package:test/main.dart';
import 'dart:math';
import '../quiz.dart';
import '../result.dart';

class QuizPageH extends StatefulWidget {
  const QuizPageH({super.key});

  @override
  State<StatefulWidget> createState() => _QuizPageH();
}

class _QuizPageH extends State<QuizPageH> {
  final _usedQuestionIndices =
      Set<int>.from(List.generate(10, (index) => index));
  var _questionIndex = 0;
  // var _totalScore = 0;
  var _correctAnswers = 0; // 정답 개수를 저장하는 변수
  var _incorrectAnswers = 0; // 오답 개수를 저장하는 변수
  // int _currentProgress = 1;
  final _questions = const [
    {
      'questionText': 'XP 개발 방법론과 관련이 없는 것은?',
      'answers': [
        {'text': '짝 프로그래밍(Pair Programming)', 'correct': false},
        {'text': '번 다운 차트(Burn Down Chart)', 'correct': true},
        {'text': '테스트 기반 개발(Test-Driven Development)', 'correct': false},
        {'text': '작은 릴리즈(Small Release)', 'correct': false},
      ],
    },
    {
      'questionText': '다음 중 디자인 패턴의 생성 패턴으로 올바른 것은?',
      'answers': [
        {'text': 'Singleton Pattern', 'correct': true},
        {'text': 'Observer Pattern', 'correct': false},
        {'text': 'Proxy Pattern', 'correct': false},
        {'text': 'Template Pattern', 'correct': false},
      ],
    },
    {
      'questionText': '소프트웨어 아키텍처 4+1 뷰 구성 요소로 올바르지 않은 것은? ',
      'answers': [
        {'text': '논리 뷰', 'correct': false},
        {'text': '프로세스 뷰', 'correct': false},
        {'text': '구현 뷰', 'correct': false},
        {'text': '인터페이스 뷰', 'correct': true},
      ],
    },
    {
      'questionText': '요구사항 분석 기법 중 형식적으로 정의된 의미를 지닌 언어로 요구 사항을 표현하는 기법은?',
      'answers': [
        {'text': '정형 분석', 'correct': true},
        {'text': '개념 모델링', 'correct': false},
        {'text': '요구사항 할당', 'correct': false},
        {'text': '요구사항 협상', 'correct': false},
      ],
    },
    {
      'questionText':
          '다음 중 UI 화면 설계에서 이해관계자들과의 화면구성을 협의하거나 서비스의 간략한 흐름을 공유하기 위해 화면 단위의 레이아웃을 설계하는 작업은?',
      'answers': [
        {'text': '와이어 프레임(Wireframe)', 'correct': true},
        {'text': '스토리보드(Storyboard)', 'correct': false},
        {'text': '종이 기반 프로토타입(Prototype)', 'correct': false},
        {'text': '디지털 기반 프로토타입(Prototype)', 'correct': false},
      ],
    },
    {
      'questionText':
          '객체의 상태가 변하면 의존성에 의해 이 객체에 연결된 모든 다른 객체들에 알림이 가고 업데이트 할 수 있는 디자인 패턴은?',
      'answers': [
        {'text': 'Observer Pattern', 'correct': true},
        {'text': 'Bridge Pattern', 'correct': false},
        {'text': 'Factory Method Pattern', 'correct': false},
        {'text': 'Adapter Pattern', 'correct': false},
      ],
    },
    {
      'questionText':
          '수신 시스템의 WAS에서 송신 시스템 DB로 연결하는 DB 커넥션 풀(DB Connection Pool)을생성하고 연계 프로그램에서 해당 DB 커넥션풀 명을 이용하는 방식 연계 기술은?',
      'answers': [
        {'text': 'DB 링크 기술', 'correct': false},
        {'text': 'DB 연결 기술', 'correct': true},
        {'text': 'JDBC 기술', 'correct': false},
        {'text': '소켓(Socket) 기술', 'correct': false},
      ],
    },
    {
      'questionText':
          '소프트웨어 개발에 국한되지 않고 조직과 사업 등 기업경영 전반으로 사용 범위가 확산되고 있는 개발 방법론은?',
      'answers': [
        {'text': 'CBD 개발방법론', 'correct': false},
        {'text': '애자일 개발방법론', 'correct': true},
        {'text': '구조적 개발방법론', 'correct': false},
        {'text': '워터폴 개발방법론', 'correct': false},
      ],
    },
    {
      'questionText':
          '- 아키텍처 품질 속성을 만족시키는지 판단 및 품질 속성들의 이해 상충 관계까지 평가하는 비용 평가 모델은?',
      'answers': [
        {'text': 'SAAM', 'correct': false},
        {'text': 'ADR', 'correct': false},
        {'text': 'CBAM', 'correct': false},
        {'text': 'ATAM', 'correct': true},
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
              '소프트웨어 설계',
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
