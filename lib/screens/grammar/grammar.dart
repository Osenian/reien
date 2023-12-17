import 'package:flutter/material.dart';
import 'package:reien/screens/grammar/quiz/nouns.dart';
import 'package:reien/screens/grammar/quiz/tenses.dart';
import 'package:reien/screens/grammar/study/tenses.dart';
import 'package:reien/screens/grammar/study/nouns.dart';

class Grammar extends StatelessWidget {
  const Grammar({super.key});

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
        body: const SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GrammarElement(texto: "Verb Tenses"),
                GrammarElement(texto: "Nouns"),
                /*GrammarElement(texto: "Articles"),
                  GrammarElement(texto: "Pronouns"),
                  GrammarElement(texto: "Modals"),
                  GrammarElement(texto: "Test"),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Fila extends StatelessWidget {
  const Fila({required this.texto, super.key});

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 100,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: FilledButton(
                style: FilledButton.styleFrom(
                  side: const BorderSide(width: 1.0, color: Colors.black87),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepOrange[700],
                ),
                onPressed: () {
                  if (texto == "Verb Tenses") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const Tenses()),
                      ),
                    );
                  } else if (texto == "Nouns") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const Nouns()),
                      ),
                    );
                  }
                },
                child: const Text('Study'),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(texto),
            ),
          ),
          SizedBox(
            width: 100,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: FilledButton(
                style: FilledButton.styleFrom(
                  side: const BorderSide(
                    width: 1.0,
                    color: Colors.black87,
                  ),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green[700],
                ),
                onPressed: () {
                  if (texto == "Verb Tenses") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const QuizTenses()),
                      ),
                    );
                  } else if (texto == "Nouns") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const QuizNouns()),
                      ),
                    );
                  }
                },
                child: const Text('Quiz'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GrammarElement extends StatelessWidget {
  final String texto;

  const GrammarElement({required this.texto, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.white70,
            border: Border.fromBorderSide(
              BorderSide(color: Colors.black, width: 2),
            ),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Fila(texto: texto),
        ),
      ),
    );
  }
}
