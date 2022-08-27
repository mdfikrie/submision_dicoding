part of 'search_movie_bloc.dart';

class SearchMovieEvent extends Equatable {
  final String? keyword;
  const SearchMovieEvent({this.keyword});

  @override
  List<Object> get props => [keyword!];
}
