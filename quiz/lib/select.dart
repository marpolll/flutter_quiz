import 'package:flutter/material.dart';

class SelectQuestionCountPage extends StatefulWidget {
  const SelectQuestionCountPage({super.key});

  @override
  _SelectQuestionCountPageState createState() =>
      _SelectQuestionCountPageState();
}

class _SelectQuestionCountPageState extends State<SelectQuestionCountPage> {
  int selectedQuestionCount = 10; // 초기값: 10문제

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('문제 수 선택'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('문제 수를 선택하세요: $selectedQuestionCount 문제'),
            Slider(
              value: selectedQuestionCount.toDouble(),
              min: 5,
              max: 30,
              onChanged: (value) {
                setState(() {
                  selectedQuestionCount = value.round();
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                // 선택한 문제 수와 난이도 정보를 이용하여 퀴즈 페이지로 이동
                // Navigator.push(
                //   // context,
                //   // MaterialPageRoute(
                //   //   builder: (context) => Quiz(
                //   //     selectedQuestionCount: selectedQuestionCount,
                //   //     difficulty: '상', // 여기서 사용자가 선택한 난이도 정보를 가져와야 합니다.
                //   //   ),
                //   // ),
                // );
              },
              child: const Text('퀴즈 풀기'),
            ),
          ],
        ),
      ),
    );
  }
}
