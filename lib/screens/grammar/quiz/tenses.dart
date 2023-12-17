import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class QuizTenses extends StatefulWidget {
  const QuizTenses({super.key});

  @override
  State<QuizTenses> createState() => _QuizTensesState();
}

class _QuizTensesState extends State<QuizTenses> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final List<Map<String, Object>> _questions = [
    {
      'questionText':
          'In JavaScript, the forEach method _____ an iterative process over each element in an array.',
      'answers': [
        {'text': 'performs', 'score': 2},
        {'text': 'performed', 'score': -1},
        {'text': 'performing', 'score': -1},
        {'text': 'perform', 'score': -1},
      ],
    },
    {
      'questionText':
          'When optimizing database queries, denormalization _____ always the recommended approach; normalization, however, _____ ignored.',
      'answers': [
        {'text': 'is not / is', 'score': 2},
        {'text': 'are not / are', 'score': -1},
        {'text': 'is not / are not', 'score': -1},
        {'text': 'are not / is', 'score': -1},
      ],
    },
    {
      'questionText':
          'While the team members ____ on the project, one of them suddenly _____ a more efficient way to implement the feature.',
      'answers': [
        {'text': 'were collaborating / realized', 'score': 2},
        {'text': 'collaborated / realizes', 'score': -1},
        {'text': 'were collaborating / realize', 'score': -1},
        {'text': 'collaborate / has realized', 'score': -1},
      ],
    },
    {
      'questionText':
          'As the debugging process progresses, the team members are actively ____ and ____ errors.',
      'answers': [
        {'text': 'identifying / fixing', 'score': 2},
        {'text': 'identify / fix', 'score': -1},
        {'text': 'identifies / fixes', 'score': -1},
        {'text': 'identified / fixed', 'score': -1},
      ],
    },
    {
      'questionText':
          'The software update _____ several critical security vulnerabilities last month.',
      'answers': [
        {'text': 'addressed', 'score': 2},
        {'text': 'addresses', 'score': -1},
        {'text': 'addressing', 'score': -1},
        {'text': 'will address', 'score': -1},
      ],
    },
    {
      'questionText':
          'Last night, the team lead ____ the latest code changes to the version control system, ensuring a synchronized development environment.',
      'answers': [
        {'text': 'pushed', 'score': 2},
        {'text': 'push', 'score': -1},
        {'text': 'pushing', 'score': -1},
        {'text': 'pushes', 'score': -1},
      ],
    },
    {
      'questionText':
          'While Italo ______ the critical code section, a sudden power outage disrupted the entire development process.',
      'answers': [
        {'text': 'was debugging', 'score': 2},
        {'text': 'debugs', 'score': -1},
        {'text': 'is debugging', 'score': -1},
        {'text': 'debug', 'score': -1},
      ],
    },
    {
      'questionText':
          'The API documentation clearly states that the function _____ the authentication process before granting access to sensitive data.',
      'answers': [
        {'text': 'has completed', 'score': 2},
        {'text': 'has completes', 'score': -1},
        {'text': 'will completed', 'score': -1},
        {'text': 'completing', 'score': -1},
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
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        _questions[_questionIndex]['questionText'] as String,
                        style: const TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
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
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple[700],
                              ),
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
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple[700],
                          ),
                          child: const Text('Share results'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: _resetQuiz,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple[700],
                          ),
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
