import 'package:bhagavad_gita/features/providers/home_bloc/home_bloc.dart';
import 'package:bhagavad_gita/features/ui/pages/home/widgets/chapters_list.dart';
import 'package:bhagavad_gita/features/ui/pages/home/widgets/last_read.dart';
import 'package:bhagavad_gita/features/ui/pages/home/widgets/verse_of_the_day.dart';
import 'package:bhagavad_gita/features/ui/pages/settings/settings.dart';
import 'package:bhagavad_gita/features/ui/widgets/error_widget.dart';
import 'package:bhagavad_gita/features/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/injectable/injections.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomeBloc>().add(const HomeEvent.getAllChapters());
    context.read<HomeBloc>().add(const HomeEvent.getVerse());

    super.initState();
  }

  @override
  void dispose() {
    getIt.resetLazySingleton<HomeBloc>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Palette.primaryBackground,
          title: const Text(
            "BHAGAVAD GITA",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              onPressed: () => {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const SetttingsPage()))
              },
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: Column(
          children: [
            const VerseOfTheDay(),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (!state.isLoading && state.verse != null) {
                  return LastRead(
                    verse: state.verse!,
                  );
                }
                return Container();
              },
            ),
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.failure) {
                    return Center(
                      child: errorView(
                          errorType: ErrorType.server_error,
                          onRefresh: () {
                            context
                                .read<HomeBloc>()
                                .add(const HomeEvent.getAllChapters());
                          }),
                    );
                  }
                  if (state.isLoading) {
                    return Center(
                        child:
                            CircularProgressIndicator(color: Palette.primary));
                  }
                  return ChaptersList(chapters: state.allChapters);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
