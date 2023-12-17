import 'package:flutter/material.dart';

class Tenses extends StatefulWidget {
  const Tenses({super.key});

  @override
  State<Tenses> createState() => _TensesState();
}

class _TensesState extends State<Tenses> {
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
                TenseSection(
                  title: 'Simple Present',
                  content: 'Hola',
                ),
                TenseSection(
                  title: 'Present Progressive',
                  content: 'Hello',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TenseSection extends StatefulWidget {
  final String title;
  final String content;
  const TenseSection({required this.title, required this.content, super.key});

  @override
  State<TenseSection> createState() => _TenseSectionState();
}

class _TenseSectionState extends State<TenseSection>
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
