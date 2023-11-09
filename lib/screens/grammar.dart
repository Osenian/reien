import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                final lowercaseTexto = texto.toLowerCase();
                Share.share('I am studying $lowercaseTexto!');
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
              onPressed: () async {
                final img = await rootBundle.load('images/congratulations.png');
                final bufferImg = img.buffer;
                Share.shareXFiles(
                  [
                    XFile.fromData(
                      bufferImg.asUint8List(
                        img.offsetInBytes,
                        img.lengthInBytes,
                      ),
                      name: 'Congratulations!',
                      mimeType: 'image/png',
                    ),
                  ],
                  subject: 'Reien Quiz Results',
                );
              },
              child: const Text('Quiz'),
            ),
          ),
        ],
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({required this.title, super.key});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(color: Colors.purple[400]),
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
