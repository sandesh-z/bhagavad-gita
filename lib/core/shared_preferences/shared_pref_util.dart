import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {
  static const String _keyChapterNumber = 'username';
  static const String _keyVerseNumber = 'logged_in';
  static Future<void> saveLastReadModel(
      int chapterNumber, int verseNumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyChapterNumber, chapterNumber);
    await prefs.setInt(_keyVerseNumber, verseNumber);
  }

  static Future<LastReadModel?> getLastReadModel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int chapterNum = prefs.getInt(_keyChapterNumber) ?? 7;
    int verseNum = prefs.getInt(_keyVerseNumber) ?? 27;
    return LastReadModel(chapterNumber: chapterNum, verseNumber: verseNum);
  }
}

class LastReadModel {
  final int chapterNumber;
  final int verseNumber;

  LastReadModel({required this.chapterNumber, required this.verseNumber});
}
