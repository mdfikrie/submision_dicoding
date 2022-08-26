import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/domain/usecases/get_movie_detail.dart';
import 'package:ditonton/domain/usecases/get_movie_recommendations.dart';
import 'package:ditonton/domain/usecases/get_watchlist_status.dart';
import 'package:ditonton/domain/usecases/remove_watchlist.dart';
import 'package:ditonton/domain/usecases/save_watchlist.dart';
import 'package:equatable/equatable.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  GetMovieDetail _getMovieDetail;
  GetMovieRecommendations _getMovieRecommendations;
  GetWatchListStatus _getWatchListStatus;
  SaveWatchlist _saveWatchlist;
  RemoveWatchlist _removeWatchlist;

  MovieDetailBloc(this._getMovieDetail, this._getMovieRecommendations,
      this._getWatchListStatus, this._saveWatchlist, this._removeWatchlist)
      : super(MovieDetailInitial()) {
    MovieDetail? movieDetail;
    List<Movie>? listRecommendation;
    bool? watchListStatus;
    on<GetMovieDetailEvent>((event, emit) async {
      emit(MovieDetailLoading());
      final detailResult = await _getMovieDetail.execute(event.idMovie!);
      final recommendationResult =
          await _getMovieRecommendations.execute(event.idMovie!);
      watchListStatus = await _getWatchListStatus.execute(event.idMovie!);
      detailResult.fold((failure) {
        emit(MovieDetailError(message: failure.message));
      }, (movie) {
        movieDetail = movie;
        recommendationResult.fold((failed) {
          emit(MovieDetailError(message: failed.message));
        }, (movieList) {
          listRecommendation = movieList;
          emit(MovieDetailLoaded(
              movieDetail: movieDetail,
              listRecomendation: listRecommendation,
              isAddedtoWatchlist: watchListStatus));
        });
      });
    });
    on<AddWatchListEvent>((event, emit) async {
      final result = await _saveWatchlist.execute(event.movie!);
      result.fold((failure) {
        emit(WatchlistError(
            movieDetail: movieDetail,
            error: failure.message,
            isAddedtoWatchlist: watchListStatus,
            listRecomendation: listRecommendation));
      }, (message) {
        watchListStatus = true;
        emit(MovieDetailLoaded(
            movieDetail: movieDetail,
            isAddedtoWatchlist: watchListStatus,
            listRecomendation: listRecommendation));
      });
    });
    on<RemoveWatchListEvent>((event, emit) async {
      final result = await _removeWatchlist.execute(event.movie!);
      result.fold((failure) {
        emit(WatchlistError(
            movieDetail: movieDetail,
            error: failure.message,
            isAddedtoWatchlist: watchListStatus,
            listRecomendation: listRecommendation));
      }, (message) {
        watchListStatus = false;
        emit(MovieDetailLoaded(
            movieDetail: movieDetail,
            isAddedtoWatchlist: watchListStatus,
            listRecomendation: listRecommendation));
      });
    });
  }
}
