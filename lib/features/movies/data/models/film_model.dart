import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'film_model.g.dart';

@JsonSerializable()
class FilmModel {
  final String id;
  final String title;
  final String description;
  final String director;
  final String producer;
  @JsonKey(name: 'release_date')
  final String releaseDate;
  @JsonKey(name: 'rt_score')
  final String rtScore;

  FilmModel(
      {this.id,
      this.title,
      this.description,
      this.director,
      this.producer,
      this.releaseDate,
      this.rtScore});

  factory FilmModel.fromJson(Map<String, dynamic> json) =>
      _$FilmModelFromJson(json);
  Map<String, dynamic> toJson() => _$FilmModelToJson(this);

  static List<FilmModel> filmModelsParser(String response) =>
      List.from(jsonDecode(response))
          .map((token) => FilmModel.fromJson(token))
          .toList();
}
