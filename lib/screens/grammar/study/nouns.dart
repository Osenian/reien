import 'package:flutter/material.dart';

class Nouns extends StatefulWidget {
  const Nouns({super.key});

  @override
  State<Nouns> createState() => _NounsState();
}

class _NounsState extends State<Nouns> {
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
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 8),
                NounSection(
                  title: 'Plurals',
                  content:
                      'The plural of most nouns is formed by adding final -s.\nFinal -es is added to nouns that end in -sh, -ch, -s, -z, and -x.\nThe plural of words that end in -y is spelled -ies.\nThere are nouns with irregular plural forms.',
                ),
                SizedBox(height: 8),
                NounSection(
                  title: 'Possessive Nouns',
                  content:
                      'To express possession, an apostrophe and an s is added to a singular noun.\nFor plural nouns that end in s, only the apostrophe is included.\nExamples: Italo\'s code. The engineers\' project.',
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NounSection extends StatefulWidget {
  final String title;
  final String content;
  const NounSection({required this.title, required this.content, super.key});

  @override
  State<NounSection> createState() => _NounSectionState();
}

class _NounSectionState extends State<NounSection>
    with SingleTickerProviderStateMixin {
  late AnimationController expandController;
  late Animation<double> animation;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
  }

  void prepareAnimations() {
    expandController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    Animation<double> curve = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );

    animation = Tween(begin: 0.0, end: 1.0).animate(curve)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        expandController.forward();
      } else {
        expandController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.purple[200],
          child: InkWell(
            onTap: _toggleExpand,
            child: Container(
              padding: const EdgeInsets.all(25.0),
              width: double.infinity,
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        SizeTransition(
          axisAlignment: 1.0,
          sizeFactor: animation,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(25.0),
            child: Text(
              widget.content,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
