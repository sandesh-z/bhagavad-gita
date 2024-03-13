import 'dart:math';

import 'package:bhagavad_gita/core/shared_preferences/shared_pref_util.dart';

LastReadModel generateRandomVerse() {
  Map<int, int> map = {
    1: 47,
    2: 72,
    3: 43,
    4: 42,
    5: 29,
    6: 47,
    7: 30,
    8: 28,
    9: 34,
    10: 42,
    11: 55,
    12: 20,
    13: 35,
    14: 27,
    15: 20,
    16: 24,
    17: 28,
    18: 78,
  };
  final chapter = map.keys.elementAt(Random().nextInt(map.length));
  final value = map[chapter]!;
  final verse = Random().nextInt(value + 1);

  return LastReadModel(chapterNumber: chapter, verseNumber: verse);
}
