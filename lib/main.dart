import 'package:flutter/material.dart';
import 'package:quiz_app/result.dart';
import 'quiz.dart';
import 'result.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

Color w = Colors.white;
Color b = Colors.black;

class _MyAppState extends State<MyApp> {
  bool isSwitched = false;

  int _totalScore = 0;
  int _questionIndex = 0;

  int num0 = 0, num1 = 0, num2 = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      num0 = 0;
      num1 = 0;
      num2 = 0;
    });
  }

  void answerQuestion(score) {
    if (_questionIndex == 0)
      num0 = score;
    else if (_questionIndex == 1)
      num1 = score;
    else if (_questionIndex == 2) num2 = score;

    _totalScore += score; // 60 //30 //10 //10

    setState(() {
      _questionIndex += 1;
    });
    print(" _questionIndex=$_questionIndex");
    print("num0=$num0");
    print("num1=$num1");
    print("num2=$num2");
    print(" _totalScore=$_totalScore");
  }

  final List<Map<String, Object>> _question = [
    {
      'questionText': 'Choose the correct HTML tag to make a text bold',
      'answers': [
        {'text': '<bold>', 'score': 0},
        {'text': '<b>', 'score': 40},
        {'text': '<bb>', 'score': 0},
        {'text': '<bld>', 'score': 0},
      ]
    },
    {
      'questionText': 'What is the correct HTML tag for inserting a line break?',
      'answers': [
        {'text': '<br>', 'score': 40},
        {'text': '<lb>', 'score': 0},
        {'text': '<break>', 'score': 0},
        {'text': '<newline>', 'score': 0},
      ]
    },
    {
      'questionText': 'What is the correct HTML tag to make a text italic?',
      'answers': [
        {'text': '<ii>', 'score': 0},
        {'text': '<italics>', 'score': 0},
        {'text': '<italic>', 'score': 0},
        {'text': '<i>', 'score': 40},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz", style: TextStyle(color: w)),

        ),
        body: Container(
          color: w,
          width: double.infinity,
          child: _questionIndex < _question.length
              ? Quiz(_question, _questionIndex, answerQuestion)
              : Result(_resetQuiz, _totalScore),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back, color: w, size: 40),
          onPressed: () {
            if (_questionIndex == 1) _totalScore -= num0;
            if (_questionIndex == 2) _totalScore -= num1;
            if (_questionIndex == 3) _totalScore -= num2;

            setState(() {
              if (_questionIndex > 0) {
                _questionIndex--;
              }
            });
            print(" _questionIndex=$_questionIndex");
            print("num=$num");
            print(" _totalScore=$_totalScore");
          },
        ),
      ),
    );
  }
}
