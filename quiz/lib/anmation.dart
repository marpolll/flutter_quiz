import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // 애니메이션 지속 시간 설정
    );

    _animation = Tween(begin: 0.0, end: 200.0).animate(_controller)
      ..addListener(() {
        setState(() {
          // 애니메이션이 실행될 때마다 화면을 다시 그리도록 갱신
        });
      });

    // 애니메이션을 반복하도록 설정
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose(); // 페이지가 종료될 때 AnimationController 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 배경 이미지
        Image.asset(
          'images/ani.gif',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Container(
          color: Colors.black.withOpacity(0.4),
          width: double.infinity,
          height: double.infinity,
        ),
      ],
    );
  }
}
