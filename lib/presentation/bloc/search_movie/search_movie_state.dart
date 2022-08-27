part of 'search_movie_bloc.dart';

abstract class SearchMovieState extends Equatable {
  const SearchMovieState();
}

class SearchMovieInitial extends SearchMovieState {
  @override
  List<Object> get props => [];
}

class SearchMovieLoaded extends SearchMovieState {
  final List<Movie>? listMovie;
  SearchMovieLoaded({this.listMovie});
  @override
  List<Object> get props => [listMovie!];
}

class SearchMovieLoading extends SearchMovieState {
  @override
  List<Object> get props => [];
}

class SearchMovieError extends SearchMovieState {
  final String? message;
  SearchMovieError({this.message});
  @override
  List<Object> get props => [message!];
}
