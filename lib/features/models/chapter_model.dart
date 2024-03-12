import 'package:json_annotation/json_annotation.dart';

part 'chapter_model.g.dart';

@JsonSerializable()
class ChapterModel {
  final int id;

  @JsonKey(name: "verses_count")
  final int versesCount;

  @JsonKey(name: "chapter_number")
  final int chapterNumber;

  final String name, slug;

  @JsonKey(name: "name_transliterated")
  final String nameTransliterated;

  @JsonKey(name: "name_translated")
  final String nameTranslated;

  @JsonKey(name: "name_meaning")
  final String nameMeaning;

  @JsonKey(name: "chapter_summary")
  final String chapterSummary;

  @JsonKey(name: "chapter_summary_hindi")
  final String chapterSummaryHindi;

  ChapterModel(
      {required this.id,
      required this.versesCount,
      required this.chapterNumber,
      required this.name,
      required this.slug,
      required this.nameTransliterated,
      required this.nameTranslated,
      required this.nameMeaning,
      required this.chapterSummary,
      required this.chapterSummaryHindi});

  factory ChapterModel.fromJson(Map<String, dynamic> json) =>
      _$ChapterModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterModelToJson(this);
}
