part of 'now_playing_movie_bloc.dart';

abstract class NowPlayingMovieState extends Equatable {
  const NowPlayingMovieState();
}

class NowPlayingMovieInitial extends NowPlayingMovieState {
  @override
  List<Object> get props => [];
}

class NowPlayingMovieLoaded extends NowPlayingMovieState {
  final List<Movie> listMovie;
  NowPlayingMovieLoaded({required this.listMovie});
  @override
  List<Object> get props => [listMovie];
}

class NowPlayingMovieLoading extends NowPlayingMovieState {
  @override
  List<Object> get props => [];
}

class NowPlayingMovieError extends NowPlayingMovieState {
  final String message;
  NowPlayingMovieError({required this.message});
  @override
  List<Object> get props => [message];
}
