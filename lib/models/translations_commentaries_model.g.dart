// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translations_commentaries_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TranslationCommentariseModel _$TranslationCommentariseModelFromJson(
        Map<String, dynamic> json) =>
    TranslationCommentariseModel(
      id: json['id'] as int,
      description: json['description'] as String?,
      authorName: json['author_name'] as String?,
      language: json['language'] as String?,
    );

Map<String, dynamic> _$TranslationCommentariseModelToJson(
        TranslationCommentariseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'author_name': instance.authorName,
      'language': instance.language,
    };
