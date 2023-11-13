import 'package:flutter/material.dart';
import 'package:reien/screens/quiz.dart';
import 'package:reien/screens/quiz2.dart';
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
                children: const <Widget>[
                  SizedBox(
                    height: 120,
                    child:Padding(
                      padding:EdgeInsets.all(10),
                      child:  DecoratedBox(
                        decoration:  BoxDecoration(
                          color:Colors.white70,
                          border:Border.fromBorderSide(BorderSide(color:Colors.black,width:2)),
                          borderRadius:BorderRadius.all(Radius.circular(35.0)),
                          boxShadow: [
                            BoxShadow(
                              color:Colors.black26,
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Fila(texto: "Grammar"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 120,
                    child:Padding(
                      padding:EdgeInsets.all(10),
                      child:  DecoratedBox(
                        decoration:  BoxDecoration(
                          color:Colors.white70,
                          border:Border.fromBorderSide(BorderSide(color:Colors.black,width:2)),
                          borderRadius:BorderRadius.all(Radius.circular(35.0)),
                          boxShadow: [
                            BoxShadow(
                              color:Colors.black26,
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child:Fila(texto: "Prueba"),
                      ),
                    ),
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
            child:Padding(
              padding:EdgeInsets.all(12),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side:const BorderSide(width: 1.0,color: Colors.black87),
                  foregroundColor: Colors.purple[400],
                ),
                onPressed: () {
                  final lowercaseTexto = texto.toLowerCase();
                  Share.share('I am studying $lowercaseTexto!');
                },
                child: const Text("Study"),
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
            child:Padding(
              padding:EdgeInsets.all(12),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side:const BorderSide(width: 1.0,color: Colors.black87),
                  foregroundColor: Colors.purple[400],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      //builder: ((context) => const Quiz()),
                      builder: ((context) => const Quiz2()),
                    ),
                  );
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
