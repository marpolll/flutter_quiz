import 'package:flutter/material.dart';
import 'package:test/main.dart';
// import 'package:test/main.dart';
// import 'dart:math';
import '../quiz.dart';
import '../result.dart';

class QuizPageL extends StatefulWidget {
  const QuizPageL({super.key});

  @override
  State<StatefulWidget> createState() => _QuizPageL();
}

class _QuizPageL extends State<QuizPageL> {
  // final _usedQuestionIndices =
  //     Set<int>.from(List.generate(5, (index) => index));
  var _questionIndex = 0;
  // var _totalScore = 0;
  var _correctAnswers = 0; // 정답 개수를 저장하는 변수
  var _incorrectAnswers = 0; // 오답 개수를 저장하는 변수
  var _progress = 0.0;
// class _QuizPageL extends State<QuizPageL> {
  // final _usedQuestionIndices =
  //     Set<int>.from(List.generate(20, (index) => index));
//   var _questionIndex = 0;
//   // var _totalScore = 0;
//   var _correctAnswers = 0; // 정답 개수를 저장하는 변수
//   var _incorrectAnswers = 0; // 오답 개수를 저장하는 변수
//   // int _currentProgress = 1;
  final _questions = const [
    {
      'questionText': '태양계에서 몇 개의 행성이 태양 주변을 공전하고 있을까요?',
      'answers': [
        {'text': '6개', 'correct': false},
        {'text': '7개', 'correct': false},
        {'text': '8개', 'correct': true},
        {'text': '9개', 'correct': false},
      ],
    },
    {
      'questionText': '세계에서 가장 큰 대륙은?',
      'answers': [
        {'text': '아시아', 'correct': true},
        {'text': '아프리카', 'correct': false},
        {'text': '유럽', 'correct': false},
        {'text': '남아메리카', 'correct': false},
      ],
    },
    {
      'questionText': '인류 역사상 가장 오래된 문명은?',
      'answers': [
        {'text': '이집트 문명', 'correct': false},
        {'text': '메소포타미아 문명', 'correct': true},
        {'text': '인도 문명', 'correct': false},
        {'text': '중국 문명', 'correct': false},
      ],
    },
    {
      'questionText': '가장 많이 사용되는 웹 브라우저는?',
      'answers': [
        {'text': '크롬', 'correct': true},
        {'text': '사파리', 'correct': false},
        {'text': '앳지', 'correct': false},
        {'text': '파이어폭스', 'correct': false},
      ],
    },
    {
      'questionText': '인간 신체에서 가장 큰 내장기관은?',
      'answers': [
        {'text': '심장', 'correct': false},
        {'text': '폐', 'correct': false},
        {'text': '간', 'correct': true},
        {'text': '뇌', 'correct': false},
      ],
    },
    {
      'questionText': '바이올린은 몇 개의 줄로 되어있을까?',
      'answers': [
        {'text': '4줄', 'correct': true},
        {'text': '5줄', 'correct': false},
        {'text': '6줄', 'correct': false},
        {'text': '7줄', 'correct': false},
      ],
    },
    {
      'questionText': '인터넷에서 사용되는 HTTP의 약자는?',
      'answers': [
        {'text': 'Hypertext Transfer Protocol', 'correct': true},
        {'text': 'Hypertrophic Transfer Progress', 'correct': false},
        {'text': 'Hyperlink Transfer Progress', 'correct': false},
        {'text': 'Hyperledger Transfer Protocol', 'correct': false},
      ],
    },
    {
      'questionText': '미국의 대통령 직을 가장 오랫동안 역임한 사람은?',
      'answers': [
        {'text': '조지 워싱턴', 'correct': false},
        {'text': '프랭클린 D. 루스벨트', 'correct': true},
        {'text': '아브라함 링컨', 'correct': false},
        {'text': '프랭클린 Pierce', 'correct': false},
      ],
    },
    {
      'questionText': '망아지를 낳은 암말을 무슨 용어로 부를까요?',
      'answers': [
        {'text': '암망', 'correct': false},
        {'text': '수달', 'correct': false},
        {'text': '암매', 'correct': true},
        {'text': '수달매', 'correct': false},
      ],
    },
    {
      'questionText': '우리나라에서 가장 높은 산은??',
      'answers': [
        {'text': '한라산', 'correct': true},
        {'text': '지리산', 'correct': false},
        {'text': '설악산', 'correct': false},
        {'text': '무등산', 'correct': false},
      ],
    },
    {
      'questionText': '앵무새가 말을 잘 따라하는 것은 무슨 이유 때문일까요?',
      'answers': [
        {'text': '귀가 좋아서', 'correct': false},
        {'text': '목소리를 인식할수 있어서', 'correct': false},
        {'text': '기억력이 좋아서', 'correct': true},
        {'text': '말하는 능력이 있어서', 'correct': false},
      ],
    },
    {
      'questionText': '유럽에서 가장 긴 강은??',
      'answers': [
        {'text': '세네갈 강', 'correct': false},
        {'text': '라인 강', 'correct': true},
        {'text': '보르네오 강', 'correct': false},
        {'text': '볼가 강', 'correct': false},
      ],
    },
    {
      'questionText': '유명한 미술관 루브르 박물관이 있는 도시는?',
      'answers': [
        {'text': '베를린', 'correct': false},
        {'text': '런던', 'correct': false},
        {'text': '파리', 'correct': true},
        {'text': '뉴욕', 'correct': false},
      ],
    },
    {
      'questionText': '새끼 고양이를 무슨 용어로 부를까요?',
      'answers': [
        {'text': '새끼고양이', 'correct': true},
        {'text': '고양이새끼', 'correct': false},
        {'text': '야옹이', 'correct': false},
        {'text': '냥이', 'correct': false},
      ],
    },
    {
      'questionText': '대한민국의 국기는 어떤 색깔로 이루어져 있나요?',
      'answers': [
        {'text': '검은색, 빨간색, 노란색', 'correct': false},
        {'text': '흰색, 빨간색, 파란색', 'correct': true},
        {'text': '검은색, 빨간색, 하얀색', 'correct': false},
        {'text': '검은색, 빨간색, 파란색', 'correct': false},
      ],
    },
    {
      'questionText': '영국의 수도는 어디일까요?',
      'answers': [
        {'text': '파리', 'correct': false},
        {'text': '뉴욕', 'correct': false},
        {'text': '베를린', 'correct': false},
        {'text': '런던', 'correct': true},
      ],
    },
    {
      'questionText': '세계에서 가장 큰 도시는?',
      'answers': [
        {'text': '상하이', 'correct': true},
        {'text': '도쿄', 'correct': false},
        {'text': '뉴욕', 'correct': false},
        {'text': '모스크바', 'correct': false},
      ],
    },
    {
      'questionText': '무엇이 유기농 작물을 구별하는 가장 중요한 요소일까요?',
      'answers': [
        {'text': '가격', 'correct': false},
        {'text': '색깔', 'correct': false},
        {'text': '크기', 'correct': false},
        {'text': '비료 및 농약 사용 유무', 'correct': true},
      ],
    },
    {
      'questionText': '',
      'answers': [
        {'text': '', 'correct': false},
        {'text': '', 'correct': false},
        {'text': '', 'correct': true},
        {'text': '', 'correct': false},
      ],
    },
    {
      'questionText': '',
      'answers': [
        {'text': '', 'correct': false},
        {'text': '', 'correct': false},
        {'text': '', 'correct': true},
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
      // _usedQuestionIndices.clear();
      // _currentProgress = 1;
      _progress = 0.0;
    });
  }

  // void _updateProgress() {
  //   setState(() {
  //     _currentProgress++;
  //   });
  // }

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

//       // Update progress
//       // _updateProgress();

//       if (_usedQuestionIndices.isNotEmpty) {
//         // 아직 사용하지 않은 문제가 있다면 퀴즈 계속 진행
//         _questionIndex = newIndex; // 수정된 부분
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
//         body: _usedQuestionIndices.isNotEmpty
//             ? Quiz(
//                 answerQuestion: _answerQuestion,
//                 questionIndex: _questionIndex,
//                 questions: _questions,
//                 totalQuestions: _questions.length,
//                 // progress: _currentProgress,
//               )
//             : Result(_resetQuiz, _correctAnswers, _incorrectAnswers),
//         backgroundColor: Colors.black,
//       ),
//     );
//   }
// }

  void _updateProgress() {
    setState(() {
      _progress = (_questionIndex + 1) / _questions.length;
    });
  }

  void _answerQuestion(bool isCorrect) {
    setState(() {
      if (isCorrect) {
        _correctAnswers++;
      } else {
        _incorrectAnswers++;
      }

      if (_questionIndex < _questions.length - 1) {
        _updateProgress();
        _questionIndex++;
      } else {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) =>
                Result(_resetQuiz, _correctAnswers, _incorrectAnswers),
          ),
        );
      }
    });
  }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // theme: ThemeData(primarySwatch: Colors.blue),
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         // appBar: AppBar(
//         //   backgroundColor: Colors.red,
//         //   title: const Center(
//         //     child: Text(
//         //       '퀴즈퀴즈',
//         //       style: TextStyle(color: Colors.white),
//         //     ),
//         //   ),
//         // ),
//         body: _questionIndex < _questions.length
//             ? Quiz(
//                 answerQuestion: _answerQuestion,
//                 questionIndex: _questionIndex,
//                 questions: _questions)
//             : Result(_resetQuiz, _correctAnswers, _incorrectAnswers),
//         backgroundColor: Colors.black,
//         // persistentFooterButtons: [
//         //   ElevatedButton.icon(
//         //     onPressed: () => {
//         //       Navigator.of(context).push(
//         //         MaterialPageRoute(
//         //           builder: (ctx) => const HomePage(), // 홈으로이동
//         //         ),
//         //       )
//         //     },
//         //     icon: const Icon(Icons.home),
//         //     label: const Text("메인으로"),
//         //   )
//         // ],
//       ),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Column(
            children: [
              const Text(
                '일반상식',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 5.0), // Adjust the spacing
              Text(
                '문제 ${_questionIndex + 1} / ${_questions.length}',
                style: const TextStyle(color: Colors.white, fontSize: 14.0),
              ),
            ],
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
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_resetQuiz, _correctAnswers, _incorrectAnswers),
        backgroundColor: Colors.black,
      ),
    );
  }
}
