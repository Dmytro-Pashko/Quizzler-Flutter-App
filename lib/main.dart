import 'package:flutter/material.dart';

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Container(
              alignment: Alignment.center,
              child: const Text(
                "Test question",
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
                onPressed: () {},
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
                onPressed: () {},
                child: const Text('False'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
