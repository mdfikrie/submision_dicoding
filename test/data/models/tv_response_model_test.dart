import 'package:ditonton/data/models/tv_model.dart';
import 'package:ditonton/data/models/tv_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var tTvResponseModel = TvResponseModel(
    listTv: [
      TvModel(
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
      ),
    ],
  );
  test('should be a tv response to json', () async {
    // arrange
    final result = tTvResponseModel.toJson();
    // act
    final expectedJson = {
      'results': [
        {
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
        }
      ]
    };
    // assert
    expect(result, expectedJson);
  });
}
