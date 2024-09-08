import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Summary extends StatelessWidget {
  const Summary(this.resultSummary, {super.key});

  final List<Map<String, Object>> resultSummary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: resultSummary.map(
            (data) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: data['correctAnswer'] == data['userAnswer']
                            ? const Color.fromARGB(255, 150, 198, 241)
                            : const Color.fromARGB(255, 249, 133, 241),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        ((data['questionIndex'] as int) + 1).toString(),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 22, 2, 56),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['question'] as String,
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            data['userAnswer'] as String,
                            style: GoogleFonts.lato(
                              color: const Color.fromARGB(255, 202, 171, 252),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            data['correctAnswer'] as String,
                            style: GoogleFonts.lato(
                              color: const Color.fromARGB(255, 181, 254, 246),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
