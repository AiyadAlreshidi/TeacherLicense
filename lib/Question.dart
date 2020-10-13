import 'package:flutter/cupertino.dart';

class Question {
  int testNum;
  int questionNumber;
  String question;
  List<String> answers;
  String image = '';
  String explain;
  Question(
      {@required this.answers,
      @required this.question,
      @required this.image,
      @required this.questionNumber,
      @required this.testNum,
      @required this.explain});

  List<String> get getSuffiledanswers {
    List<String> a = [...answers];
    a.shuffle();
    return a;
  }
}

class QFinal {
  static List<Question> questions = [
    Question(
        answers: ["amr", "khaled", "eslam"],
        question: "what is your name",
        image: null,
        questionNumber: 9,
        testNum: 9,
        explain: "o_eVKOqY48Q"),Question(
        answers: ["amasdasr", "khasdaaled", "esasdalam"],
        question: "what is your name",
        image: null,
        questionNumber: 9,
        testNum: 9,
        explain: "o_eVKOqY48Q"),
    Question(
        answers: ["soha", "omar", "tarek"],
        question: "what is your name2",
        image: null,
        questionNumber: 2,
        testNum: 1,
        explain: "o_eVKOqY48Q"),
    Question(
        answers: ["soha", "omar", "tarek"],
        question: "احا يا بتاع",
        image: null,
        questionNumber:3,
        testNum: 1,
        explain: "tez")
  ];
}
