part of 'movie_detail_bloc.dart';

abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();
}

class GetMovieDetailEvent extends MovieDetailEvent {
  final int? idMovie;
  GetMovieDetailEvent({this.idMovie});
  @override
  List<Object> get props => [idMovie!];
}

class AddWatchListEvent extends MovieDetailEvent {
  final MovieDetail? movie;
  AddWatchListEvent({this.movie});
  @override
  List<Object> get props => [movie!];
}

class RemoveWatchListEvent extends MovieDetailEvent {
  final MovieDetail? movie;
  RemoveWatchListEvent({this.movie});
  @override
  List<Object> get props => [movie!];
}
