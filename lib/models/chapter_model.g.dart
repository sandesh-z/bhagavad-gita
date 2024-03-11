// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChapterModel _$ChapterModelFromJson(Map<String, dynamic> json) => ChapterModel(
      id: json['id'] as int,
      versesCount: json['verses_count'] as int,
      chapterNumber: json['chapter_number'] as int,
      name: json['name'] as String,
      slug: json['slug'] as String,
      nameTransliterated: json['name_transliterated'] as String,
      nameTranslated: json['name_translated'] as String,
      nameMeaning: json['name_meaning'] as String,
      chapterSummary: json['chapter_summary'] as String,
      chapterSummaryHindi: json['chapter_summary_hindi'] as String,
    );

Map<String, dynamic> _$ChapterModelToJson(ChapterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'verses_count': instance.versesCount,
      'chapter_number': instance.chapterNumber,
      'name': instance.name,
      'slug': instance.slug,
      'name_transliterated': instance.nameTransliterated,
      'name_translated': instance.nameTranslated,
      'name_meaning': instance.nameMeaning,
      'chapter_summary': instance.chapterSummary,
      'chapter_summary_hindi': instance.chapterSummaryHindi,
    };
