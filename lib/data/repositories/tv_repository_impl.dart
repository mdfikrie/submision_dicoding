import 'dart:io';

import 'package:ditonton/common/exception.dart';
import 'package:ditonton/common/remote/tv_remote_data_source.dart';
import 'package:ditonton/data/datasources/movie_local_data_source.dart';
import 'package:ditonton/data/models/tv_table.dart';
import 'package:ditonton/domain/entities/tv_detail.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/repositories/tv_repositpry.dart';

class TvRepositoryImpl implements TvRepository {
  final TvRemoteDataSource _tvRemoteDataSource;
  final MovieLocalDataSource localDataSource;

  TvRepositoryImpl(this._tvRemoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, TvDetail>> getTvDetail(int params) async {
    try {
      final result = await _tvRemoteDataSource.getTvDetail(params);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getTvRecommendations(int params) async {
    try {
      final result = await _tvRemoteDataSource.getTvRecommendations(params);
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
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
  Future<Either<Failure, String>> removeWatchlist(TvDetail params) async {
    try {
      final result =
          await localDataSource.removeTvWatchlist(TvTable.fromEntity(params));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> saveWatchlist(TvDetail params) async {
    try {
      final result =
          await localDataSource.insertTvWatchlist(TvTable.fromEntity(params));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> searchTv(String params) async {
    try {
      final result = await _tvRemoteDataSource.searchTv(params);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
