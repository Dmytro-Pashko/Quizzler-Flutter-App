import 'package:quizzler/question.dart';

class Quiz {
  List<Question> questions = [
    Question("The blue whale is the biggest animal to have ever lived.", true),
    Question("Bats are blind.", false),
    Question("An ant can lift 1,000 times its body weight.", false),
    Question("The goat is the national animal of Scotland.", false),
    Question("New York City is composed of between 36 and 42 islands.", true),
    Question("South Africa has one capital.", false),
    Question("The Atlantic Ocean is the biggest ocean on Earth.", false),
    Question("Mount Everest is the tallest mountain in the world.", true),
    Question(
        "The two longest rivers in the world are the Mississippi and the Nile.",
        false),
    Question("Greenland is the largest island in the world.", true),
    Question("There are more countries in South America than Africa.", false),
    Question(
        "Alaska has the most active volcanoes of any state in the United States.",
        true),
    Question("The most common blood type is 0- negative.", true),
  ];

  int currentQuestion = -1;
  int correctAnswers = 0;

  String getNextQuestion() {
    if (currentQuestion < getQuestionsCount() - 1) {
      currentQuestion++;
    }
    return questions[currentQuestion].question;
  }

  String getCurrentQuestion() {
    return questions[currentQuestion].question;
  }

  int getQuestionsCount() {
    return questions.length;
  }

  bool setAnswer(bool answer) {
    if (questions[currentQuestion].answer == answer) {
      correctAnswers++;
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    currentQuestion = -1;
    correctAnswers = 0;
  }

  bool isCompleted() {
    return currentQuestion >= getQuestionsCount() - 1;
  }
}
