import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

class NoItemAnimation extends StatelessWidget {
  const NoItemAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/Animation.gif', // المسار
            width: 200,
            height: 200,
            // repeat: true, // التكرار
            // animate: true, // التشغيل التلقائي
          ),
          Text(
            'No Notes',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
