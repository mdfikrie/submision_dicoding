// import 'dart:convert';
// import 'package:ditonton/common/exception.dart';
// import 'package:ditonton/data/datasources/tv_remote_data_source.dart';
// import 'package:ditonton/data/models/tv_response_model.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:http/http.dart' as http;
// import '../../helpers/test_helper.mocks.dart';
// import '../../json_reader.dart';

// void main() {
//   const API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
//   const BASE_URL = 'https://api.themoviedb.org/3';

//   late TvRemoteDataSourceImpl dataSource;
//   late MockHttpClient mockHttpClient;

//   setUp(() {
//     mockHttpClient = MockHttpClient();
//     dataSource = TvRemoteDataSourceImpl(mockHttpClient);
//   });

//   group('get Popular Tv', () {
//     final tMovieList = TvResponseModel.fromJson(
//             json.decode(readJson('dummy_data/popular.json')))
//         .listTv;

//     test('should return list of movies when response is success (200)',
//         () async {
//       // arrange
//       when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY')))
//           .thenAnswer((_) async =>
//               http.Response(readJson('dummy_data/popular_tv.json'), 200));
//       // act
//       final result = await dataSource.getPopularTv();
//       // assert
//       expect(result, tMovieList);
//     });

//     test(
//         'should throw a ServerException when the response code is 404 or other',
//         () async {
//       // arrange
//       when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY')))
//           .thenAnswer((_) async => http.Response('Not Found', 404));
//       // act
//       final call = dataSource.getPopularTv();
//       // assert
//       expect(() => call, throwsA(isA<ServerException>()));
//     });
//   });
// }
