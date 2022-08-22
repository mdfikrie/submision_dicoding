import 'dart:convert';
import 'package:ditonton/data/models/tv_model.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../json_reader.dart';

void main() {
  final tTvModel = TvModel(
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    voteAverage: 1,
    voteCount: 1,
    name: 'name',
    originCountry: ['originalCountry'],
    originalLanguage: 'originalLanguage',
    originalName: 'originalName',
  );

  final tTv = Tv(
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    voteAverage: 1,
    voteCount: 1,
    name: 'name',
    originCountry: ['originalCountry'],
    originalLanguage: 'originalLanguage',
    originalName: 'originalName',
  );

  test('should be a subclass of Tv entity', () async {
    final result = tTvModel.toEntity();
    expect(result, tTv);
  });

  test('should be a tv from json', () async {
    // arrange
    final Map<String, dynamic> jsonMap =
        json.decode(readJson('dummy_data/tv.json'));
    // act
    final result = TvModel.fromJson(jsonMap);
    // assert
    expect(result, tTvModel);
  });

  test('should be a tv to json', () async {
    // arrange
    final result = tTvModel.toJson();
    // act
    final expectedJson = {
      "poster_path": "posterPath",
      "popularity": 1.0,
      "id": 1,
      "backdrop_path": "backdropPath",
      "vote_average": 1.0,
      "overview": "overview",
      "origin_country": ["originalCountry"],
      "genre_ids": [1, 2, 3],
      "original_language": "originalLanguage",
      "vote_count": 1,
      "name": "name",
      "original_name": "originalName"
    };
    // assert
    expect(result, expectedJson);
  });
}
