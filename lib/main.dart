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
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Green', 'score': 20},
        {'text': 'Blue', 'score': 30},
        {'text': 'Yellow', 'score': 40},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Tiger', 'score': 20},
        {'text': 'Elephant', 'score': 30},
        {'text': 'Lion', 'score': 40},
      ]
    },
    {
      'questionText': 'What\'s your favorite instrator?',
      'answers': [
        {'text': 'Maram1', 'score': 10},
        {'text': 'Maram2', 'score': 20},
        {'text': 'Maram3', 'score': 30},
        {'text': 'Maram4', 'score': 40},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App", style: TextStyle(color: w)),
          actions: <Widget>[
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  print(isSwitched);
                  if (isSwitched == true) {
                    b = Colors.white;
                    w = Colors.black;
                  }
                  if (isSwitched == false) {
                    b = Colors.black;
                    w = Colors.white;
                  }
                });
              },
              activeColor: Colors.white,
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.yellow,
            ),
          ],
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
