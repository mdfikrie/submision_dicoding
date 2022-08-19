import 'dart:io';

import 'package:ditonton/common/exception.dart';
import 'package:ditonton/common/remote/tv_remote_data_source.dart';
import 'package:ditonton/domain/entities/tv_detail.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/repositories/tv_repositpry.dart';

class TvRepositoryImpl implements TvRepository {
  final TvRemoteDataSource _tvRemoteDataSource;
  TvRepositoryImpl(this._tvRemoteDataSource);

  @override
  Future<Either<Failure, TvDetail>> getTvDetail(int params) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Tv>>> getTvRecommendations(int params) {
    // TODO: implement getMovieRecommendations
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Tv>>> getOnTheAitTv() async {
    try {
      final result = await _tvRemoteDataSource.getOnTheAirTv();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getPopularTv() async {
    try {
      final result = await _tvRemoteDataSource.getPopularTv();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getTopRatedTv() async {
    try {
      final result = await _tvRemoteDataSource.getTopRatedTv();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getWatchlistTv() {
    // TODO: implement getWatchlistTv
    throw UnimplementedError();
  }

  @override
  Future<bool> isAddedToWatchlist(int params) {
    // TODO: implement isAddedToWatchlist
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> removeWatchlist(TvDetail params) {
    // TODO: implement removeWatchlist
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> saveWatchlist(TvDetail params) {
    // TODO: implement saveWatchlist
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Tv>>> searchTv(String params) {
    // TODO: implement searchTv
    throw UnimplementedError();
  }
}
