import 'package:flutter/material.dart';
import 'package:reien/screens/grammar.dart';

class AppBar extends StatelessWidget {
  const AppBar({required this.title, super.key});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(color: Colors.purple[700]),
      child: Row(
        children: [
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.menu),
            tooltip: "Menú Navegación",
          ),
          Expanded(
            child: title,
          ),
        ],
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          AppBar(
            title: Text(
              "Reien",
              style: Theme.of(context).primaryTextTheme.titleLarge,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[700],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const Grammar()),
                      ),
                    );
                  },
                  child: const Text("Gramática"),
                ),
                const SizedBox(height: 20),
                const ElevatedButton(
                  onPressed: null,
                  child: Text("Vocabulario (En Construcción...)"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
