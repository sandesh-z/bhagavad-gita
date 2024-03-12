import 'package:json_annotation/json_annotation.dart';

part 'translations_commentaries_model.g.dart';

@JsonSerializable()
class TranslationCommentariseModel {
  final int id;
  final String? description;
  @JsonKey(name: "author_name")
  final String? authorName;
  final String? language;

  TranslationCommentariseModel(
      {required this.id,
      required this.description,
      required this.authorName,
      required this.language});

  factory TranslationCommentariseModel.fromJson(Map<String, dynamic> json) =>
      _$TranslationCommentariseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TranslationCommentariseModelToJson(this);
}
