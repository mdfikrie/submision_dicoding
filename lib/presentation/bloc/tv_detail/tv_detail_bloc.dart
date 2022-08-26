import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/entities/tv_detail.dart';
import 'package:ditonton/domain/usecases/get_watchlist_status.dart';
import 'package:ditonton/domain/usecases/remove_tv_watchlist.dart';
import 'package:ditonton/domain/usecases/save_tv_watchlist.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_detail.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_recommendation.dart';
import 'package:equatable/equatable.dart';
part 'tv_detail_event.dart';
part 'tv_detail_state.dart';

class TvDetailBloc extends Bloc<TvDetailEvent, TvDetailState> {
  GetTvDetail _getTvDetail;
  GetTvRecommendation _getTvRecommendation;
  GetWatchListStatus _getWatchListStatus;
  SaveTvWatchlist _saveWatchlist;
  RemoveTvWatchlist _removeWatchlist;
  TvDetailBloc(this._getTvDetail, this._getTvRecommendation,
      this._getWatchListStatus, this._removeWatchlist, this._saveWatchlist)
      : super(TvDetailInitial()) {
    TvDetail? tvDetail;
    List<Tv>? listRecommendation;
    bool? watchListStatus;
    on<GetTvDetailEvent>((event, emit) async {
      emit(TvDetailLoading());
      final detailResult = await _getTvDetail.call(event.id!);
      final recommendationResult = await _getTvRecommendation.call(event.id!);
      watchListStatus = await _getWatchListStatus.execute(event.id!);
      detailResult.fold((failure) {
        emit(TvDetailError(message: failure.message));
      }, (tv) {
        tvDetail = tv;
        recommendationResult.fold((failed) {
          emit(TvDetailError(message: failed.message));
        }, (movieList) {
          listRecommendation = movieList;
          emit(TvDetailLoaded(
              tvDetail: tvDetail,
              listRecomendation: listRecommendation,
              isAddedtoWatchlist: watchListStatus));
        });
      });
    });
    on<AddTvWatchListEvent>((event, emit) async {
      final result = await _saveWatchlist.execute(event.tv!);
      result.fold((failure) {
        emit(WatchlistTvError(
            tvDetail: tvDetail,
            error: failure.message,
            isAddedtoWatchlist: watchListStatus,
            listRecomendation: listRecommendation));
      }, (message) {
        watchListStatus = true;
        emit(TvDetailLoaded(
            tvDetail: tvDetail,
            isAddedtoWatchlist: watchListStatus,
            listRecomendation: listRecommendation));
      });
    });
    on<RemoveTvWatchListEvent>((event, emit) async {
      final result = await _removeWatchlist.execute(event.tv!);
      result.fold((failure) {
        emit(WatchlistTvError(
            tvDetail: tvDetail,
            error: failure.message,
            isAddedtoWatchlist: watchListStatus,
            listRecomendation: listRecommendation));
      }, (message) {
        watchListStatus = false;
        emit(TvDetailLoaded(
            tvDetail: tvDetail,
            isAddedtoWatchlist: watchListStatus,
            listRecomendation: listRecommendation));
      });
    });
  }
}
