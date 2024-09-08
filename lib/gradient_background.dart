import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions_data.dart';
import 'package:quiz_app/homepage.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/result_screen.dart';

class GraidentBackground extends StatefulWidget {
  const GraidentBackground({super.key});

  @override
  State<GraidentBackground> createState() => _GraidentBackgroundState();
}

class _GraidentBackgroundState extends State<GraidentBackground> {
  Widget? currentPage;
  List<String> answerChoose = [];

  @override
  void initState() {
    currentPage = Homepage(switchPage);
    super.initState();
  }

  void storedAnswer(String answer) {
    answerChoose.add(answer);

    if (answerChoose.length == questions.length) {
      setState(() {
        currentPage = ResultScreen(
          choosenAnswer: answerChoose,
          onRestart: onRestart,
        );
      });
    }
  }

  void onRestart() {
    setState(() {
      currentPage = Homepage(switchPage);
      answerChoose = [];
    });
  }

  void switchPage() {
    setState(() {
      currentPage = Questions(
        storedAnswer: storedAnswer,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 72, 0, 119),
                Color.fromARGB(255, 85, 0, 182),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: currentPage,
        ),
      ),
    );
  }
}
