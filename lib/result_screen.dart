import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions_data.dart';
import 'package:quiz_app/summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.choosenAnswer, required this.onRestart});

  final List<String> choosenAnswer;
  final void Function() onRestart;

  List<Map<String, Object>> resultSummary() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add(
        {
          'questionIndex': i,
          'question': questions[i].text,
          'correctAnswer': questions[i].questionOption[0],
          'userAnswer': choosenAnswer[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summary = resultSummary();
    final totalQuestions = questions.length;
    final totalCorrentAnswers = summary.where(
      (data) {
        return data['correctAnswer'] == data['userAnswer'];
      },
    ).length;

    return Container(
      margin: const EdgeInsets.all(40),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You have answered $totalCorrentAnswers out of $totalQuestions questions correctly!!',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 221, 111, 255),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          Summary(summary),
          const SizedBox(
            height: 30,
          ),
          TextButton.icon(
            onPressed: onRestart,
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.refresh),
            label: const Text('Restart Quiz!'),
          ),
        ],
      ),
    );
  }
}
