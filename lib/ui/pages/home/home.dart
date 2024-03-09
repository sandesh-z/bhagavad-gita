import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.purple,
          title: const Text("Bhagavad Gita"),
          actions: [
            IconButton(
              onPressed: () => {
                //to setting page
              },
              icon: const Icon(Icons.settings),
            )
          ],
        ),
        body: const Column(children: [
          LatestReadWidget(),
          ChaptersWidget(),
        ]));
  }
}

class LatestReadWidget extends StatelessWidget {
  const LatestReadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 100, color: Colors.blue);
  }
}

class ChaptersWidget extends StatelessWidget {
  const ChaptersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 100, color: Colors.amber);
  }
}
