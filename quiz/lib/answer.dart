// import 'package:flutter/material.dart';

// class Answer extends StatelessWidget {
//   final VoidCallback selectHandler;
//   final String answerText;

//   const Answer(this.selectHandler, this.answerText, {Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       margin: const EdgeInsets.symmetric(horizontal: 50),
//       child: ElevatedButton(
//         onPressed: selectHandler,
//         style: ElevatedButton.styleFrom(
//           foregroundColor: Colors.black,
//           backgroundColor: Colors.white54, // 텍스트 색상
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20.0), // 버튼의 모양을 변경
//           ),
//         ),
//         child: Text(
//           answerText,
//           style: const TextStyle(fontSize: 18, color: Colors.black),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class Answer extends StatefulWidget {
  final VoidCallback selectHandler;
  final String answerText;

  const Answer(this.selectHandler, this.answerText, {Key? key})
      : super(key: key);

  @override
  _AnswerState createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  bool hovered = false; // 마우스 호버 여부를 저장하는 변수

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 50),
      child: InkWell(
        onTap: widget.selectHandler,
        onHover: (isHovered) {
          setState(() {
            hovered = isHovered; // 마우스 호버 여부 업데이트
          });
        },
        child: ElevatedButton(
          onPressed: widget.selectHandler,
          style: ElevatedButton.styleFrom(
            foregroundColor: hovered ? Colors.white : Colors.black,
            backgroundColor:
                hovered ? Colors.black : Colors.white54, // 텍스트 색상 변경
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          child: Text(
            widget.answerText,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
