part of 'top_rated_movie_bloc.dart';

abstract class TopRatedMovieState extends Equatable {
  const TopRatedMovieState();
}

class TopRatedMovieInitial extends TopRatedMovieState {
  @override
  List<Object> get props => [];
}

class TopRatedMovieLoaded extends TopRatedMovieState {
  final List<Movie> listMovie;
  TopRatedMovieLoaded({required this.listMovie});
  @override
  List<Object> get props => [listMovie];
}

class TopRatedMovieLoading extends TopRatedMovieState {
  @override
  List<Object> get props => [];
}

class TopRatedMovieError extends TopRatedMovieState {
  final String message;
  TopRatedMovieError({required this.message});
  @override
  List<Object> get props => [message];
}
