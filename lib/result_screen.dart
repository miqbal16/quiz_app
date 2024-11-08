import 'package:dev_basics/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:dev_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.choseAnswer,
    required this.restartQuiz,
  });

  final List<String> choseAnswer;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final summary = <Map<String, Object>>[];
    for (int i = 0; i < choseAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choseAnswer[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestion = questions.length;
    final numCorrectQuestion = summaryData
        .where((data) => data['correct_answer'] == data['user_answer']);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Your answered ${numCorrectQuestion.length} out of '
            '$numTotalQuestion questions correctly!',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 212, 156, 255),
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30.0),
          QuestionsSummary(summaryData),
          const SizedBox(height: 30.0),
          TextButton.icon(
            onPressed: restartQuiz,
            style: TextButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 212, 156, 255),
              textStyle: GoogleFonts.lato(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            label: const Text(
              'Restart Quiz!',
            ),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
