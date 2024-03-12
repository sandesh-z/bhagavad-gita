// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
