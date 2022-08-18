import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/usecase/usecase.dart';
import 'package:ditonton/domain/entities/tv_detail.dart';
import 'package:ditonton/domain/repositories/tv_repositpry.dart';

class GetTvDetail implements UseCase<Either<Failure, TvDetail>, int> {
  TvRepository _tvRepository;
  GetTvDetail(this._tvRepository);

  @override
  Future<Either<Failure, TvDetail>> call(int params) {
    return _tvRepository.getMovieDetail(params);
  }
}
