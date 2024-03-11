import 'package:bhagavad_gita/datasource/bhagavad_remote_data_source.dart';
import 'package:bhagavad_gita/ui/pages/verses/verse_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';

import '../../../injectable/injections.dart';
import '../../../providers/home_bloc/home_bloc.dart';
import '../../res/assets.dart';

class ChapterWiseVersePage extends StatefulWidget {
  final int chapter;
  const ChapterWiseVersePage({super.key, required this.chapter});

  @override
  State<ChapterWiseVersePage> createState() => _ChapterWiseVersePageState();
}

class _ChapterWiseVersePageState extends State<ChapterWiseVersePage> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        var bloc = HomeBloc(getIt<BhagavadRemoteDataSource>());

        bloc
          ..add(const HomeEvent.setInitialState())
          ..add(HomeEvent.getChapter(widget.chapter))
          ..add(HomeEvent.getAllVerses(widget.chapter));

        return bloc;
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: BlocBuilder<HomeBloc, HomeState>(
            buildWhen: (previous, current) =>
                previous.isLoading != current.isLoading,
            builder: (context, state) {
              if (!state.isLoading && state.allVerses.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HeadingWidget(
                        count: widget.chapter,
                        title: state.chapter?.nameTranslated ?? "",
                        description: state.chapter?.chapterSummary ?? "",
                      ),
                      const SizedBox(height: 20.0),
                      Expanded(
                        child: ListView.builder(
                            itemCount: state.allVerses.length,
                            itemBuilder: (context, index) => Column(
                                  children: [
                                    const SizedBox(height: 10.0),
                                    VerseItemWidget(
                                      number:
                                          state.allVerses[index].verseNumber,
                                      description: state
                                              .allVerses[index].translations
                                              .where((e) =>
                                                  e.language == 'english')
                                              .first
                                              .description ??
                                          "",
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (_) => VerseDetailPage(
                                                    verseDetail: state
                                                        .allVerses[index])));
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    const Divider()
                                  ],
                                )),
                      ),
                    ],
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}

class HeadingWidget extends StatelessWidget {
  final int count;
  final String title, description;
  const HeadingWidget(
      {super.key,
      required this.count,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 18,
              width: 18,
              child: Image.asset(Assets.chapterIcon),
            ),
            Text("Chapter $count"),
            SizedBox(
              height: 18,
              width: 18,
              child: Image.asset(Assets.chapterIcon),
            )
          ],
        ),
        Text(title),
        const SizedBox(height: 20.0),
        ReadMoreText(
          description,
          trimLines: 4,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'SHOW MORE',
          trimExpandedText: 'SHOW LESS',
          lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          moreStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold), // Style for "Read more" text
        ),
      ],
    );
  }
}

class VerseItemWidget extends StatelessWidget {
  final int number;
  final String description;
  final void Function()? onTap;
  const VerseItemWidget(
      {super.key, required this.number, required this.description, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.description),
            Text("Verse $number"),
            const Spacer(),
            InkWell(
              onTap: onTap,
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 18.0,
              ),
            )
          ],
        ),
        const SizedBox(height: 10.0),
        Text(description),
      ],
    );
  }
}
