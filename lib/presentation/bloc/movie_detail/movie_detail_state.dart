part of 'movie_detail_bloc.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();
}

class MovieDetailInitial extends MovieDetailState {
  @override
  List<Object> get props => [];
}

class MovieDetailLoaded extends MovieDetailState {
  final MovieDetail? movieDetail;
  final List<Movie>? listRecomendation;
  final bool? isAddedtoWatchlist;
  MovieDetailLoaded(
      {this.movieDetail, this.listRecomendation, this.isAddedtoWatchlist});
  @override
  List<Object> get props =>
      [movieDetail!, listRecomendation!, isAddedtoWatchlist!];
}

class MovieDetailLoading extends MovieDetailState {
  @override
  List<Object> get props => [];
}

class MovieDetailError extends MovieDetailState {
  final String message;
  MovieDetailError({required this.message});
  @override
  List<Object> get props => [message];
}

class WatchlistError extends MovieDetailState {
  final MovieDetail? movieDetail;
  final List<Movie>? listRecomendation;
  final bool? isAddedtoWatchlist;
  final String? error;
  WatchlistError(
      {this.movieDetail,
      this.listRecomendation,
      this.isAddedtoWatchlist,
      this.error});
  @override
  List<Object> get props =>
      [movieDetail!, listRecomendation!, isAddedtoWatchlist!, error!];
}
