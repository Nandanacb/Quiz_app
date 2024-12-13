import 'package:flutter/material.dart';
import 'package:quizapp_quizzapp/answercard.dart';
import 'package:quizapp_quizzapp/nextbutton.dart';
import 'package:quizapp_quizzapp/questions.dart';
import 'package:quizapp_quizzapp/resultscreen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;

  final List<Question> questions = [
    Question(correctAnswerIndex: 1, question: 'Q1. What is Flutter?', options: [
      'A)  Flutter is an open-source backend development framework ',
      'B)  Flutter is an open-source UI toolkit',
      'C)  Flutter is an open-source programming language for cross-platform applications',
      'D)  Flutters is a DBMS toolkit',
    ]),
    Question(
        correctAnswerIndex: 2,
        question:
            'Q2. Who developed the Flutter Framework and continues to maintain it today?',
        options: [
          'A)  Facebook ',
          'B)  Microsoft ',
          'C)  Google',
          'D)  Oracle',
        ]),
    Question(
        correctAnswerIndex: 1,
        question:
            'Q3. Which programming language is used to build Flutter applications?',
        options: [
          'A)  Kotlin ',
          'B)  Dart ',
          'C)  Java',
          'D)  Go',
        ]),
    Question(
        correctAnswerIndex: 0,
        question: 'Q4. How many types of widgets are there in Flutter?',
        options: [
          'A)  2',
          'B)  4',
          'C)  6',
          'D)  8+',
        ]),
    Question(
        correctAnswerIndex: 0,
        question:
            'Q5. When building for iOS, Flutter is restricted to an __ compilation strategy',
        options: [
          'A)  AOT (ahead-of-time)',
          'B)  JIT (Just-in-time)',
          'C)  Transcompilation',
          'D)  Recompilation',
        ]),
    Question(
        correctAnswerIndex: 0,
        question:
            'Q6. A sequence of asynchronous Flutter events is known as a:',
        options: [
          'A)  Flow',
          'B)  current',
          'C)  Stream',
          'D)  Series',
        ]),
    Question(
        correctAnswerIndex: 1,
        question:
            'Q7. What element is used as an identifier for components when programming in Flutter?',
        options: [
          'A)  Widgets',
          'B)  Keys',
          'C)  Elements',
          'D)  Serial',
        ]),
    Question(
        correctAnswerIndex: 2,
        question:
            'Q8. What type of test can examine your code as a complete system?',
        options: [
          'A)  Unit tests',
          'B)  Widget tests',
          'C)  Integration Tests',
          'D)  All of the above',
        ]),
    Question(
        correctAnswerIndex: 0,
        question:
            'Q9. What type of Flutter animation allows you to represent real-world behavior?',
        options: [
          'A)  Physics-based',
          'B)  Maths-based',
          'C)  Graph-based',
          'D)  Sim-based',
        ]),
    Question(
        correctAnswerIndex: 0,
        question:
            'Q10.  Flutter boasts improved runtime performance over most application frameworks.',
        options: [
          'A)  True',
          'B)  False',
        ]),
  ];

  void pickAnswer(int index) {
    if (selectedAnswerIndex == null) {
      setState(() {
        selectedAnswerIndex = index;
      });

      final question = questions[questionIndex];

      if (selectedAnswerIndex == question.correctAnswerIndex) {
        setState(() {
          score++;
        });
      }
    }
  }

  void goToNextQuestion() {
    setState(() {
      if (questionIndex < questions.length - 1) {
        questionIndex++;
        selectedAnswerIndex = null;
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => ResultScreen(score: score)));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];
    bool isLastQuestion = questionIndex == questions.length - 1;
    return Scaffold(
      backgroundColor: const Color.fromARGB(252, 123, 32, 139),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(252, 123, 32, 139),
        title: Padding(
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Quiz App',
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              question.question,
              style: const TextStyle(fontSize: 21, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: question.options.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: selectedAnswerIndex == null
                        ? () => pickAnswer(index)
                        : null,
                    child: AnswerCard(
                      currentIndex: index,
                      question: question.options[index],
                      isSelected: selectedAnswerIndex == index,
                      selectedAnswerIndex: selectedAnswerIndex,
                      correctAnswerIndex: question.correctAnswerIndex,
                      isAnswerCorrect: selectedAnswerIndex != null &&
                          selectedAnswerIndex == question.correctAnswerIndex,
                      isAnswerIncorrect: selectedAnswerIndex != null &&
                          selectedAnswerIndex != question.correctAnswerIndex,
                    ),
                  );
                },
              ),
            ),
            // Next Button
            isLastQuestion
                ? MyTextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => ResultScreen(
                            score: score,
                          ),
                        ),
                      );
                    },
                    label: 'Finish',
                  )
                : MyTextButton(
                    onPressed:
                        selectedAnswerIndex != null ? goToNextQuestion : null,
                    label: 'Next',
                  ),
          ],
        ),
      ),
    );
  }
}
