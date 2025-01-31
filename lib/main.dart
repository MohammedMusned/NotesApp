import 'package:comerce_app/views/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'MyFont',
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
