import 'package:bhagavad_gita/models/translations_commentaries_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'verse_model.g.dart';

@JsonSerializable()
class VerseModel {
  final int id;

  @JsonKey(name: "verse_number")
  final int verseNumber;

  @JsonKey(name: "chapter_number")
  final int chapterNumber;

  final String? text, slug, transliteration;

  @JsonKey(name: "word_meanings")
  final String? wordMeaning;
  @JsonKey(name: "translations")
  final List<TranslationCommentariseModel> translations;

  @JsonKey(name: "commentaries")
  final List<TranslationCommentariseModel> commentaries;

  VerseModel(this.slug, this.transliteration, this.wordMeaning,
      {required this.id,
      required this.verseNumber,
      required this.chapterNumber,
      required this.text,
      required this.translations,
      required this.commentaries});
  factory VerseModel.fromJson(Map<String, dynamic> json) =>
      _$VerseModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerseModelToJson(this);
}
