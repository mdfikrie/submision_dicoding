import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/usecases/get_popular_movies.dart';
import 'package:equatable/equatable.dart';

part 'popular_movie_event.dart';
part 'popular_movie_state.dart';

class PopularMovieBloc extends Bloc<PopularMovieEvent, PopularMovieState> {
  GetPopularMovies _getPopularMovies;
  PopularMovieBloc(this._getPopularMovies) : super(PopularMovieInitial()) {
    on<PopularMovieEvent>((event, emit) async {
      emit(PopularMovieLoading());
      final result = await _getPopularMovies.execute();
      result.fold((failure) {
        emit(PopularMovieError(message: failure.message));
      }, (listMovie) {
        emit(PopularMovieLoaded(listMovie: listMovie));
      });
    });
  }
}
