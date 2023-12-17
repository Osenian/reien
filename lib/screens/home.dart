import 'package:flutter/material.dart';
import 'package:reien/screens/grammar/grammar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[700],
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
          tooltip: "Menú Navegación",
        ),
        title: const Text("Reien"),
      ),
      body: Center(
        child: Column(
          children: [
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
                    child: const Text("Grammar"),
                  ),
                  const SizedBox(height: 20),
                  const ElevatedButton(
                    onPressed: null,
                    child: Text("Vocab (Coming Soon...)"),
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
