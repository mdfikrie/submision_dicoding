import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/entities/tv_detail.dart';

abstract class TvRepository {
  Future<Either<Failure, List<Tv>>> getOnTheAitTv();
  Future<Either<Failure, List<Tv>>> getPopularTv();
  Future<Either<Failure, List<Tv>>> getTopRatedTv();
  Future<Either<Failure, TvDetail>> getTvDetail(int params);
  Future<Either<Failure, List<Tv>>> getTvRecommendations(int params);
  Future<Either<Failure, List<Tv>>> searchTv(String params);
  Future<Either<Failure, String>> saveWatchlist(TvDetail params);
  Future<Either<Failure, String>> removeWatchlist(TvDetail params);
}
