import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/entities/tv_detail.dart';

abstract class TvRepository {
  Future<Either<Failure, List<Tv>>> getOneTheAitTv();
  Future<Either<Failure, List<Tv>>> getPopularTv();
  Future<Either<Failure, List<Tv>>> getTopRatedTv();
  Future<Either<Failure, TvDetail>> getMovieDetail(int params);
  Future<Either<Failure, List<Tv>>> getMovieRecommendations(int params);
  Future<Either<Failure, List<Tv>>> searchTv(String params);
  Future<Either<Failure, String>> saveWatchlist(TvDetail params);
  Future<Either<Failure, String>> removeWatchlist(TvDetail params);
  Future<bool> isAddedToWatchlist(int params);
  Future<Either<Failure, List<Tv>>> getWatchlistTv();
}
