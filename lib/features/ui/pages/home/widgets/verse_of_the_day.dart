import 'package:bhagavad_gita/features/ui/pages/verses/verse_detail.dart';
import 'package:bhagavad_gita/features/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/injectable/injections.dart';
import '../../../../datasource/bhagavad_remote_data_source.dart';
import '../../../../providers/home_bloc/home_bloc.dart';
import '../../../../utils/assets.dart';
import '../../../../utils/colors.dart';

class VerseOfTheDay extends StatelessWidget {
  const VerseOfTheDay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        var bloc = HomeBloc(getIt<BhagavadRemoteDataSource>());

        bloc
          ..add(const HomeEvent.setInitialState())
          ..add(const HomeEvent.getVerse(true));

        return bloc;
      },
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                  height: 194,
                  child: Image.asset(
                    Assets.verseOfTheDayBackgournd,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )),
              Transform.translate(
                offset: const Offset(0, 60),
                child: Container(
                  height: 161.0,
                  margin: const EdgeInsets.symmetric(horizontal: 25.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      children: [
                        Image.asset(
                          Assets.verseOfTheDayForeground,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12.0, 12, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "VERSE OF THE DAY",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Palette.primary),
                              ),
                              const SizedBox(height: 5.0),
                              BlocBuilder<HomeBloc, HomeState>(
                                builder: (context, state) {
                                  if (state.isLoading) {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        color: Palette.primary,
                                      ),
                                    );
                                  }
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        truncateWithEllipsis(
                                            state.verse?.translations
                                                    .firstWhere((e) =>
                                                        e.language == 'english')
                                                    .description ??
                                                "",
                                            20),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0,
                                          height: 1.1,
                                        ),
                                        overflow: TextOverflow.visible,
                                        maxLines: 4,
                                      ),
                                      const SizedBox(height: 10.0),
                                      InkWell(
                                        onTap: () {
                                          if (state.verse != null) {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        VerseDetailPage(
                                                            verseDetail:
                                                                state.verse!)));
                                          }
                                        },
                                        child: const Text(
                                          " READ MORE",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18.0),
                                        ),
                                      )
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 60)
        ],
      ),
    );
  }
}
