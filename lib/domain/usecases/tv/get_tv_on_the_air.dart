import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/usecase/usecase.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/repositories/tv_repositpry.dart';

class GetTvOnTheAir implements UseCase<Either<Failure, List<Tv>>, void> {
  TvRepository _tvRepository;
  GetTvOnTheAir(this._tvRepository);

  @override
  Future<Either<Failure, List<Tv>>> call(void params) {
    return _tvRepository.getOnTheAitTv();
  }
}
