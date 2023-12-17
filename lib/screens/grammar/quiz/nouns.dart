import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class QuizNouns extends StatefulWidget {
  const QuizNouns({super.key});

  @override
  State<QuizNouns> createState() => _QuizTensesState();
}

class _QuizTensesState extends State<QuizNouns> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final List<Map<String, Object>> _questions = [
    {
      'questionText':
          'In object-oriented programming, a ____ is a blueprint for creating objects, providing initial values and behaviors.',
      'answers': [
        {'text': 'Class', 'score': 2},
        {'text': 'Function', 'score': -1},
        {'text': 'Interface', 'score': -1},
        {'text': 'Method', 'score': -1},
      ],
    },
    {
      'questionText':
          'When optimizing database performance, denormalization involves reducing the number of _____ in a relational database to improve query speed.',
      'answers': [
        {'text': 'Joins', 'score': 2},
        {'text': 'Indexes', 'score': -1},
        {'text': 'Triggers', 'score': -1},
        {'text': 'Views', 'score': -1},
      ],
    },
    {
      'questionText':
          'The term "Big ____" refers to the processing and analysis of large and complex datasets that traditional data processing applications cannot handle efficiently.',
      'answers': [
        {'text': 'Data', 'score': 2},
        {'text': 'Bytes', 'score': -1},
        {'text': 'Queries', 'score': -1},
        {'text': 'Tables', 'score': -1},
      ],
    },
    {
      'questionText':
          'To enhance the security of password storage, it is recommended to use a strong ____ function that transforms the password into a fixed-length string of characters.',
      'answers': [
        {'text': 'Hashing', 'score': 2},
        {'text': 'Salting', 'score': -1},
        {'text': 'Encryption', 'score': -1},
        {'text': 'Decryption', 'score': -1},
      ],
    },
    {
      'questionText':
          'The ____ key is a unique identifier for a record in a database table and is often used to establish relationships between tables.',
      'answers': [
        {'text': 'Primary', 'score': 2},
        {'text': 'Foreign', 'score': -1},
        {'text': 'Composite', 'score': -1},
        {'text': 'Super', 'score': -1},
      ],
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
  }

  void _resetQuiz() {
    _questionIndex = 0;
    _totalScore = 0;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[700],
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
            tooltip: "Volver",
          ),
          title: const Text("Reien"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (_questionIndex < _questions.length)
                Column(
                  children: [
                    Text(
                      _questions[_questionIndex]['questionText'] as String,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: (_questions[_questionIndex]['answers']
                              as List<Map<String, Object>>)
                          .map(
                            (answer) => ElevatedButton(
                              onPressed: () {
                                _answerQuestion(answer['score'] as int);
                              },
                              child: Text(answer['text'] as String),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                )
              else
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Quiz Completed!',
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      'Your Score: $_totalScore',
                      style: const TextStyle(fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Share.share(
                                'I scored $_totalScore on Verb Tenses!');
                          },
                          child: const Text('Share results'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: _resetQuiz,
                          child: const Text('Back'),
                        ),
                      ],
                    )
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
