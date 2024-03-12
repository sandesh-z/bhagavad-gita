import 'package:bhagavad_gita/features/models/translations_commentaries_model.dart';
import 'package:json_annotation/json_annotation.dart';

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

VerseModel _$VerseModelFromJson(Map<String, dynamic> json) => VerseModel(
      json['slug'] as String?,
      json['transliteration'] as String?,
      json['word_meanings'] as String?,
      id: json['id'] as int,
      verseNumber: json['verse_number'] as int,
      chapterNumber: json['chapter_number'] as int,
      text: json['text'] as String?,
      translations: (json['translations'] as List<dynamic>)
          .map((e) =>
              TranslationCommentariseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      commentaries: (json['commentaries'] as List<dynamic>)
          .map((e) =>
              TranslationCommentariseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VerseModelToJson(VerseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'verse_number': instance.verseNumber,
      'chapter_number': instance.chapterNumber,
      'text': instance.text,
      'slug': instance.slug,
      'transliteration': instance.transliteration,
      'word_meanings': instance.wordMeaning,
      'translations': instance.translations,
      'commentaries': instance.commentaries,
    };
