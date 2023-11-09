import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class Grammar extends StatelessWidget {
  const Grammar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Column(
          children: [
            AppBar(
              title: Text(
                "Reien",
                style: Theme.of(context).primaryTextTheme.titleLarge,
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  const SizedBox(
                    height: 100,
                    child: Fila(texto: "Grammar"),
                  ),
                  const Fila(texto: "Prueba"),
                  Container(
                    width: 160,
                    height: 200,
                    color: Colors.green,
                  ),
                  Container(
                    width: 160,
                    height: 200,
                    color: Colors.yellow,
                  ),
                  Container(
                    width: 160,
                    height: 200,
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
          ],
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
            child: OutlinedButton(
              onPressed: () {
                debugPrint('Study button pressed');
              },
              child: const Text("Study"),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(texto),
            ),
          ),
          SizedBox(
            width: 100,
            child: OutlinedButton(
              onPressed: () {
                Share.share('Perfect Score!');
              },
              child: const Text('Quiz'),
            ),
          ),
        ],
      ),
    );
  }
}
