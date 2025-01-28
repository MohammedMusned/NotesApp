import 'package:flutter/material.dart';

void main() {
  runApp(EncommeApp());
}

class EncommeApp extends StatelessWidget {
  const EncommeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 44, 44, 116),
      ),
    );
  }
}
