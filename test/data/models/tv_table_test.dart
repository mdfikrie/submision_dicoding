import 'dart:convert';
import 'package:ditonton/data/models/tv_table.dart';
import 'package:ditonton/domain/entities/tv_detail.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../json_reader.dart';

void main() {
  var tTvTable = TvTable(
    id: 1,
    title: 'title',
    posterPath: 'posterPath',
    overview: 'overview',
    type: '',
  );

  test('Should be json', () {
    // arrange
    final Map<String, dynamic> jsonMap =
        json.decode(readJson('dummy_data/tv_table.json'));
    // act
    final result = TvTable.fromMap(jsonMap);
    // expect
    expect(result, tTvTable);
  });

  test('should be to json', () {
    // arrange
    final Map<String, dynamic> jsonMap = {
      "id": 1,
      "title": "title",
      "posterPath": "posterPath",
      "overview": "overview",
      "type": ""
    };
    // act
    final result = tTvTable.toJson();
    // expect
    expect(jsonMap, result);
  });

  var tTvDetail = TvDetail(
    backdropPath: 'backdropPath',
    firstAirDate: DateTime.parse("2010-06-08"),
    genres: [],
    homepage: 'homePage',
    id: 1,
    inProduction: true,
    lastAirDate: DateTime.parse("2010-06-08"),
    name: 'title',
    numberOfEpisodes: 1,
    numberOfSeasons: 1,
    originalLanguage: 'originalLanguage',
    originalName: 'originalName',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    status: 'status',
    tagline: 'tagline',
    type: 'tv',
    voteAverage: 1.1,
    voteCount: 1,
  );

  test('Shoule be Tv table from tv detail', () {
    var tTvTable2 = TvTable(
      id: 1,
      title: 'title',
      posterPath: 'posterPath',
      overview: 'overview',
      type: 'tv',
    );
    final result = TvTable.fromEntity(tTvDetail);
    expect(result, tTvTable2);
  });
}
