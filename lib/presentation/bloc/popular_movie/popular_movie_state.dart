part of 'popular_movie_bloc.dart';

abstract class PopularMovieState extends Equatable {
  const PopularMovieState();
}

class PopularMovieInitial extends PopularMovieState {
  @override
  List<Object?> get props => [];
}

class PopularMovieLoaded extends PopularMovieState {
  final List<Movie> listMovie;
  PopularMovieLoaded({required this.listMovie});
  @override
  List<Object> get props => [listMovie];
}

class PopularMovieLoading extends PopularMovieState {
  @override
  List<Object> get props => [];
}

class PopularMovieError extends PopularMovieState {
  final String message;
  PopularMovieError({required this.message});
  @override
  List<Object> get props => [message];
}
