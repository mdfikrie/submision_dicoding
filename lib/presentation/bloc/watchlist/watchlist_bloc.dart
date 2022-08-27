import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/usecases/get_watchlist_movies.dart';
import 'package:equatable/equatable.dart';

part 'watchlist_event.dart';
part 'watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  GetWatchlistMovies _getWatchlist;
  WatchlistBloc(this._getWatchlist) : super(WatchlistInitial()) {
    on<WatchlistEvent>((event, emit) async {
      emit(WatchlistLoading());
      final result = await _getWatchlist.execute();
      result.fold((failure) {
        emit(WatchlistError(error: failure.message));
      }, (listWatchlist) {
        emit(WatchlistLoaded(listWatchlist: listWatchlist));
      });
    });
  }
}
