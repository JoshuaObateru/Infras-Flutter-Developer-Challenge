// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilmModel _$FilmModelFromJson(Map<String, dynamic> json) {
  return FilmModel(
    id: json['id'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    director: json['director'] as String,
    producer: json['producer'] as String,
    releaseDate: json['release_date'] as String,
    rtScore: json['rt_score'] as String,
  );
}

Map<String, dynamic> _$FilmModelToJson(FilmModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'director': instance.director,
      'producer': instance.producer,
      'release_date': instance.releaseDate,
      'rt_score': instance.rtScore,
    };
