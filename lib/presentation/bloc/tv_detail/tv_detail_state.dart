part of 'tv_detail_bloc.dart';

abstract class TvDetailState extends Equatable {
  const TvDetailState();
}

class TvDetailInitial extends TvDetailState {
  @override
  List<Object> get props => [];
}

class TvDetailLoaded extends TvDetailState {
  final TvDetail? tvDetail;
  final List<Tv>? listRecomendation;
  final bool? isAddedtoWatchlist;
  TvDetailLoaded(
      {this.tvDetail, this.listRecomendation, this.isAddedtoWatchlist});
  @override
  List<Object> get props =>
      [tvDetail!, listRecomendation!, isAddedtoWatchlist!];
}

class TvDetailLoading extends TvDetailState {
  @override
  List<Object> get props => [];
}

class TvDetailError extends TvDetailState {
  final String message;
  TvDetailError({required this.message});
  @override
  List<Object> get props => [message];
}

class WatchlistTvError extends TvDetailState {
  final TvDetail? tvDetail;
  final List<Tv>? listRecomendation;
  final bool? isAddedtoWatchlist;
  final String? error;
  WatchlistTvError(
      {this.tvDetail,
      this.listRecomendation,
      this.isAddedtoWatchlist,
      this.error});
  @override
  List<Object> get props =>
      [tvDetail!, listRecomendation!, isAddedtoWatchlist!, error!];
}
