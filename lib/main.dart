import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': '私の好きな食べ物は何でしょうか？',
      'answers': ['焼き肉', 'ごはん', 'さしみ', '漬物', '吉牛']
    },
    {
      'questionText': '私の好きな動物は何でしょうか？',
      'answers': ['ねこ', 'いぬ', 'さる', 'ライオン']
    },
    {
      'questionText': '私の好きな色は何でしょうか？',
      'answers': ['赤', '青', '黄色', '白', '黒']
    },
  ];

  var _questionIndex = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
    });
  }

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('クイズ')),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_resetQuiz),
      ),
    );
  }
}
