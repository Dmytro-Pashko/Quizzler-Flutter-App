import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'quizz.dart';

void main() => runApp(const Quizzler());

Quiz quiz = Quiz();

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: QuizPage(),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  void setAnswer(bool answer) {
    if (!quiz.isCompleted()) {
      setState(() {
        quiz.setAnswer(answer);
      });
    } else {
      Alert(
        context: context,
        type: AlertType.success,
        onWillPopActive: true,
        style: const AlertStyle(isCloseButton: false),
        title: "Quiz completed.",
        desc:
            "You score is ${quiz.correctAnswers} of ${quiz.getQuestionsCount()}",
        buttons: [
          DialogButton(
            onPressed: () => {
              Navigator.pop(context),
              setState(() {
                quiz.reset();
              })
            },
            width: 120,
            child: const Text(
              "Try again",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    var question = quiz.getNextQuestion();
    return Container(
      color: Colors.black54,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                '${quiz.currentQuestion + 1} of ${quiz.getQuestionsCount()}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              child: Text(
                question,
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    primary: Colors.white,
                    elevation: 3,
                    textStyle: const TextStyle(
                      fontSize: 20,
                    )),
                onPressed: () {
                  setAnswer(true);
                },
                child: const Text('True'),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                style: TextButton.styleFrom(
                    elevation: 3,
                    backgroundColor: Colors.red,
                    primary: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 20,
                    )),
                onPressed: () {
                  setAnswer(false);
                },
                child: const Text('False'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
