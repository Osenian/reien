import 'package:flutter/material.dart';

class Nouns extends StatelessWidget {
  const Nouns({super.key});

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
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Paragraph 1',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget elit convallis aliquet. Curabitur non arcu ullamcorper, imperdiet arcu ac, posuere ligula. Quisque nunc turpis, euismod ut tortor vel, faucibus interdum mi. Nulla facilisi. Duis in enim sagittis, facilisis lectus a, posuere mi. Mauris interdum neque vel lorem auctor, et bibendum mi dictum. Suspendisse et turpis sed dolor auctor vulputate. Sed varius augue eget leo congue, at facilisis augue ultricies. Curabitur scelerisque enim non arcu congue, eu pulvinar elit posuere. Nulla facilisi.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 32.0),
              Text(
                'Paragraph 2',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Nunc sed libero ac eros commodo lobortis. Etiam quis neque metus. Duis consectetur metus eu leo sagittis, et tempus elit condimentum. Quisque auctor orci vitae dolor congue, ac eleifend ligula maximus. Quisque cursus lacus eu mollis feugiat. Suspendisse et mauris massa. Quisque bibendum libero non sem facilisis, at placerat erat fringilla. Duis non augue nibh. Sed ullamcorper justo non ligula ultricies, non faucibus augue pulvinar.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
