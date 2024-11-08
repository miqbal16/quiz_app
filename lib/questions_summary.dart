import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 30.0,
                  height: 30.0,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(right: 20.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: data['correct_answer'] == data['user_answer'] ? Colors.blue : const Color.fromARGB(255, 212, 156, 255),
                  ),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: GoogleFonts.lato(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        data['question'] as String,
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 231, 201, 255),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        data['user_answer'] as String,
                        style: GoogleFonts.lato(
                          fontSize: 14.0,
                          color: Colors.purple[300],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        data['correct_answer'] as String,
                        style: GoogleFonts.lato(
                          fontSize: 14.0,
                          color: const Color.fromARGB(255, 142, 200, 255),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
