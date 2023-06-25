import 'package:flutter/material.dart';
import 'package:quizzler_app/quizbrain.dart';

QuizBrain quizBrain = QuizBrain();
void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'MyQuizApp',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          backgroundColor: Colors.blueGrey,
        ),
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int i = 1;
  List<bool> myanswer = [];
  List<Icon> scoreKeeper = [];
  String displayquesNo(i) {
    if (i < quizBrain.getlength()) {
      return "Q.No $i ";
    } else
      return "";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Center(
            child: Text(
              displayquesNo(i) + quizBrain.getQuestionText(i - 1),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  myanswer.add(true);
                  if (quizBrain.getQuestionAnswer(i - 1) == myanswer[i - 1]) {
                    scoreKeeper.add(const Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  } else {
                    scoreKeeper.add(const Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                  }
                  i = i + 1;
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  myanswer.add(false);
                  if (quizBrain.getQuestionAnswer(i - 1) == myanswer[i - 1]) {
                    scoreKeeper.add(const Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  } else {
                    scoreKeeper.add(const Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                  }
                  i = i + 1;
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
