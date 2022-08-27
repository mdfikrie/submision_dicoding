import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/usecases/search_movies.dart';
import 'package:equatable/equatable.dart';

part 'search_movie_event.dart';
part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  SearchMovies _searchMovies;

  SearchMovieBloc(this._searchMovies) : super(SearchMovieInitial()) {
    on<SearchMovieEvent>((event, emit) async {
      emit(SearchMovieLoading());
      final result = await _searchMovies.execute(event.keyword!);
      result.fold((failure) {
        emit(SearchMovieError(message: failure.message));
      }, (listMovie) {
        emit(SearchMovieLoaded(listMovie: listMovie));
      });
    });
  }
}
