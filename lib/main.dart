import 'package:bhagavad_gita/core/injectable/injections.dart';
import 'package:bhagavad_gita/features/providers/home_bloc/home_bloc.dart';
import 'package:bhagavad_gita/features/ui/pages/onboarding/intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const BhagavadGita());
}

class BhagavadGita extends StatelessWidget {
  const BhagavadGita({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => getIt<HomeBloc>())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const IntroPage(),
      ),
    );
  }
}
