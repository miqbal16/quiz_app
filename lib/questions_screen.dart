import 'package:dev_basics/answer_button.dart';
import 'package:dev_basics/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String) onSelectAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  void aa() {
    currentQuestionIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            currentQuestion.text,
            style: GoogleFonts.lato(
              fontSize: 24.0,
              color: const Color.fromARGB(255, 175, 96, 255),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30.0),
          ...currentQuestion.getShuffleAnswer().map(
                (answer) => AnswerButton(
                  text: answer,
                  onTap: () => answerQuestion(answer),
                ),
              ),
        ],
      ),
    );
  }
}
