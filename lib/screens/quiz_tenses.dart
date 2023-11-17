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
      'questionText': 'Water ___ of hydrogen and oxygen.',
      'answers': [
        {'text': 'consist', 'score': -1},
        {'text': 'has consisted', 'score': -1},
        {'text': 'is consisting', 'score': -1},
        {'text': 'consists', 'score': 2},
      ],
    },
    {
      'questionText': 'I ___ five courses this semester.',
      'answers': [
        {'text': 'taken', 'score': -1},
        {'text': 'am took', 'score': -1},
        {'text': 'am taking', 'score': 2},
        {'text': 'takes', 'score': -1},
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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: CustomAppBar(
            title: Text(
              "Reien",
              style: Theme.of(context).primaryTextTheme.titleLarge,
            ),
          ),
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

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({required this.title, super.key});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(color: Colors.purple[700]),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
            tooltip: "Volver",
          ),
          Expanded(
            child: title,
          ),
        ],
      ),
    );
  }
}
