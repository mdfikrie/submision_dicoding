part of 'watchlist_bloc.dart';

abstract class WatchlistState extends Equatable {
  const WatchlistState();
}

class WatchlistInitial extends WatchlistState {
  @override
  List<Object> get props => [];
}

class WatchlistLoaded extends WatchlistState {
  final List<Movie>? listWatchlist;
  WatchlistLoaded({this.listWatchlist});
  @override
  List<Object> get props => [listWatchlist!];
}

class WatchlistLoading extends WatchlistState {
  @override
  List<Object> get props => [];
}

class WatchlistError extends WatchlistState {
  final String? error;
  WatchlistError({this.error});
  @override
  List<Object> get props => [error!];
}
