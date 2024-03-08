import 'package:bhagavad_gita/ui/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BhagavadGita());
}

class BhagavadGita extends StatelessWidget {
  const BhagavadGita({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage());
  }
}
