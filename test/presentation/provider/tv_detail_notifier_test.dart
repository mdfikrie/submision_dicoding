import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/usecases/get_watchlist_status.dart';
import 'package:ditonton/domain/usecases/remove_tv_watchlist.dart';
import 'package:ditonton/domain/usecases/save_tv_watchlist.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_detail.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_recommendation.dart';
import 'package:ditonton/presentation/provider/tv_detail_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_detail_notifier_test.mocks.dart';

@GenerateMocks([
  GetTvDetail,
  GetTvRecommendation,
  GetWatchListStatus,
  SaveTvWatchlist,
  RemoveTvWatchlist,
])
void main() {
  late TvDetailNotifier provider;
  late MockGetTvDetail mockGetTvDetail;
  late MockGetTvRecommendation mockGetTvRecommendations;
  late MockGetWatchListStatus mockGetWatchlistStatus;
  late MockSaveTvWatchlist mockSaveWatchlist;
  late MockRemoveTvWatchlist mockRemoveWatchlist;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetTvDetail = MockGetTvDetail();
    mockGetTvRecommendations = MockGetTvRecommendation();
    mockGetWatchlistStatus = MockGetWatchListStatus();
    mockSaveWatchlist = MockSaveTvWatchlist();
    mockRemoveWatchlist = MockRemoveTvWatchlist();
    provider = TvDetailNotifier(
      mockGetTvDetail,
      mockGetTvRecommendations,
      mockGetWatchlistStatus,
      mockSaveWatchlist,
      mockRemoveWatchlist,
    )..addListener(() {
        listenerCallCount += 1;
      });
  });

  final tId = 1;

  final tTvs = Tv(
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    voteAverage: 1,
    voteCount: 1,
    firstAirDate: DateTime.now(),
    name: 'name',
    originCountry: ['originalCountry'],
    originalLanguage: 'originalLanguage',
    originalName: 'originalName',
  );
  final tTv = <Tv>[tTvs];

  void _arrangeUsecase() {
    when(mockGetTvDetail.call(tId))
        .thenAnswer((_) async => Right(testTvDetail));
    when(mockGetTvRecommendations.call(tId))
        .thenAnswer((_) async => Right(tTv));
  }

  test('should get the watchlist status', () async {
    // arrange
    when(mockGetWatchlistStatus.execute(1)).thenAnswer((_) async => true);
    // act
    await provider.loadWatchlistStatus(1);
    // assert
    expect(provider.isAddedToWatchlist, true);
  });

  test('should execute save watchlist when function called', () async {
    // arrange
    when(mockSaveWatchlist.execute(testTvDetail))
        .thenAnswer((_) async => Right('Success'));
    when(mockGetWatchlistStatus.execute(testMovieDetail.id))
        .thenAnswer((_) async => true);
    // act
    await provider.addWatchlist(testTvDetail);
    // assert
    verify(mockSaveWatchlist.execute(testTvDetail));
  });

  test('should execute remove watchlist when function called', () async {
    // arrange
    when(mockRemoveWatchlist.execute(testTvDetail))
        .thenAnswer((_) async => Right('Removed'));
    when(mockGetWatchlistStatus.execute(testTvDetail.id))
        .thenAnswer((_) async => false);
    // act
    await provider.removeFromWatchlist(testTvDetail);
    // assert
    verify(mockRemoveWatchlist.execute(testTvDetail));
  });

  group('Get Tv Detail', () {
    test('should get data from the usecase', () async {
      // arrange
      _arrangeUsecase();
      // act
      await provider.fetchTvDetail(tId);
      // assert
      verify(mockGetTvDetail.call(tId));
      verify(mockGetTvRecommendations.call(tId));
    });

    test('should change state to Loading when usecase is called', () {
      // arrange
      _arrangeUsecase();
      // act
      provider.fetchTvDetail(tId);
      // assert
      expect(provider.tvState, RequestState.Loading);
      expect(listenerCallCount, 1);
    });

    test('should change movie when data is gotten successfully', () async {
      // arrange
      _arrangeUsecase();
      // act
      await provider.fetchTvDetail(tId);
      // assert
      expect(provider.tvState, RequestState.Loaded);
      expect(provider.tv, testTvDetail);
      expect(listenerCallCount, 3);
    });

    test('should change recommendation movies when data is gotten successfully',
        () async {
      // arrange
      _arrangeUsecase();
      // act
      await provider.fetchTvDetail(tId);
      // assert
      expect(provider.tvState, RequestState.Loaded);
      expect(provider.tvRecommendations, tTv);
    });
  });
}
