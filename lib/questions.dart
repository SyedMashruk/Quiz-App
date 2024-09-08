import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions_data.dart';
import 'package:google_fonts/google_fonts.dart';

class Questions extends StatefulWidget {
  const Questions({
    super.key,
    required this.storedAnswer,
  });
  final void Function(String answer) storedAnswer;

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  var questionIndex = 0;

  void questionIndexIncrement(String answer) {
    widget.storedAnswer(answer);

    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionIndex];

    return Container(
      margin: const EdgeInsets.all(40),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontSize: 22,
                color: const Color.fromARGB(255, 220, 124, 240),
                fontWeight: FontWeight.bold,
              ),
              currentQuestion.text,
            ),
            const SizedBox(
              height: 20,
            ),
            ...currentQuestion.getSuffledAnswer().map(
              (optionText) {
                return StyledButton(
                  option: optionText,
                  click: () {
                    questionIndexIncrement(optionText);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
