import 'package:ditonton/data/models/tv_detail_model.dart';
import 'package:ditonton/data/models/tv_model.dart';

abstract class TvRemoteDataSource {
  Future<List<TvModel>> getOnTheAirTv();
  Future<List<TvModel>> getPopularTv();
  Future<List<TvModel>> getTopRatedTv();
  Future<TvDetailModel> getTvDetail(int id);
  Future<List<TvModel>> getTvRecommendations(int id);
  Future<List<TvModel>> searchTv(String query);
}
