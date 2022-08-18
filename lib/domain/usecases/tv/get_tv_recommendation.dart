import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/usecase/usecase.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/repositories/tv_repositpry.dart';

class GetTvRecommendation implements UseCase<Either<Failure, List<Tv>>, int> {
  TvRepository _tvRepository;
  GetTvRecommendation(this._tvRepository);
  @override
  Future<Either<Failure, List<Tv>>> call(int params) {
    return _tvRepository.getTvRecommendations(params);
  }
}
