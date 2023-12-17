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
                SizedBox(height: 8),
                TenseSection(
                  title: 'Simple Present',
                  content:
                      'The simple present says that something was true in the past, is true in the present, and will be true in the future.\nIt expresses general statements of fact and general truths.\nIt is also used to express habitual or everyday activities.\nExample: I study computer science.',
                ),
                SizedBox(height: 8),
                TenseSection(
                  title: 'Present Progressive',
                  content:
                      'The present progressive expresses an activity that is in progress at the moment of speaking.\nIt is a temporary activity that began in the past, is continuing at present, and will probably end at some point in the future.\nExample: I am studying C++ this year.',
                ),
                SizedBox(height: 8),
                TenseSection(
                  title: 'Simple Past',
                  content:
                      'The simple past indicates that an activity or situation began and ended at a particular time in the past.\nExample: I fixed the code yesterday.',
                ),
                SizedBox(height: 8),
                TenseSection(
                  title: 'Past Progressive',
                  content:
                      'The past progressive is used for an ongoing activity that already finished.\nExample: I was studying english at 8:00PM last night.',
                ),
                SizedBox(height: 8),
                TenseSection(
                  title: 'Present Perfect',
                  content:
                      'The present perfect is often used with since and for to talk about situations that began in the past and continue up to now.\nIt follows the form has/have + past participle.\nExample: I have used Python for 3 years.',
                ),
                SizedBox(height: 8),
                TenseSection(
                  title: 'Present Perfect Progressive',
                  content:
                      'The present perfect progressive expresses the duration of an aactivity that began in the past and continues in the present.\nExample: I have been using Flutter since 2023.',
                ),
                SizedBox(height: 8),
                TenseSection(
                  title: 'Past Perfect',
                  content:
                      'The past perfect expresses an activity that was complete before another activity or time in the past.\nIt is often found in more formal writing.\nExample: After everyone had left, I went to bed.',
                ),
                SizedBox(height: 8),
                TenseSection(
                  title: 'Past Perfect Progressive',
                  content:
                      'The past perfect progressive emphasizes the duration of an activity that was in progress before another activity or time in the past.\nIt is less frequent compared to other verb tenses.\nExample: Italo told me that he had been waiting for me.',
                ),
                SizedBox(height: 8),
                TenseSection(
                  title: 'Simple Future',
                  content:
                      'The simple future is used to talk about activities that have not occured yet using either will or be going to.\nExample: I will deploy into production on Friday.',
                ),
                SizedBox(height: 8),
                TenseSection(
                  title: 'Future Progressive',
                  content:
                      'The future progressive expresses an activity that will be in progress at a time in the future.\nExample: I will be contacting you shortly.',
                ),
                SizedBox(height: 8),
                TenseSection(
                  title: 'Future Perfect',
                  content:
                      'The future perfect expresses an activity that will be completed before another time or event in the future.\nExample: By the time I see you, I will have graduated.',
                ),
                SizedBox(height: 8),
                TenseSection(
                  title: 'Future Perfect Progressive',
                  content:
                      'The future perfect progrerssive emphasizes the duration of an activity that will be in progress before another time or event in the future.\nExample: I will have been sleeping for two hours by the time you arrive.',
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
