import 'dart:convert';
import 'package:ditonton/data/models/tv_detail_model.dart';
import 'package:ditonton/domain/entities/tv_detail.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../json_reader.dart';

void main() {
  final tTvDetailModel = TvDetailModel(
    backdropPath: 'backdropPath',
    firstAirDate: DateTime.parse("2010-06-08"),
    genres: [],
    homepage: 'homePage',
    id: 1,
    inProduction: true,
    lastAirDate: DateTime.parse("2010-06-08"),
    name: 'name',
    numberOfEpisodes: 1,
    numberOfSeasons: 1,
    originalLanguage: 'originalLanguage',
    originalName: 'originalName',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    status: 'status',
    tagline: 'tagline',
    type: 'type',
    voteAverage: 1.1,
    voteCount: 1,
  );

  final tTvDetail = TvDetail(
    backdropPath: 'backdropPath',
    firstAirDate: DateTime.parse("2010-06-08"),
    genres: [],
    homepage: 'homePage',
    id: 1,
    inProduction: true,
    lastAirDate: DateTime.parse("2010-06-08"),
    name: 'name',
    numberOfEpisodes: 1,
    numberOfSeasons: 1,
    originalLanguage: 'originalLanguage',
    originalName: 'originalName',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    status: 'status',
    tagline: 'tagline',
    type: 'type',
    voteAverage: 1.1,
    voteCount: 1,
  );

  test('should be a subclass of Tv detail entity', () async {
    final result = tTvDetailModel.toEntity();
    expect(result, tTvDetail);
  });

  test('should be a tv detail to json', () async {
    // arrange
    final result = tTvDetailModel.toJson();
    // act
    final expectedJson = {
      "backdrop_path": "backdropPath",
      "first_air_date": "2010-06-08",
      "genres": [],
      "homepage": "homePage",
      "id": 1,
      "in_production": true,
      "last_air_date": "2010-06-08",
      "name": "name",
      "number_of_episodes": 1,
      "number_of_seasons": 1,
      "original_language": "originalLanguage",
      "original_name": "originalName",
      "overview": "overview",
      "popularity": 1,
      "poster_path": "posterPath",
      "status": "status",
      "tagline": "tagline",
      "type": "type",
      "vote_average": 1.1,
      "vote_count": 1
    };
    // assert
    expect(result, expectedJson);
  });
}
