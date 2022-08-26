part of 'top_rated_tv_bloc.dart';

abstract class TopRatedTvState extends Equatable {
  const TopRatedTvState();
}

class TopRatedTvInitial extends TopRatedTvState {
  @override
  List<Object?> get props => [];
}

class TopRatedTvLoading extends TopRatedTvState {
  @override
  List<Object?> get props => [];
}

class TopRatedTvLoaded extends TopRatedTvState {
  final List<Tv>? listTv;
  TopRatedTvLoaded({this.listTv});
  @override
  List<Object?> get props => [listTv];
}

class TopRatedTvError extends TopRatedTvState {
  final String? error;
  TopRatedTvError({this.error});
  @override
  List<Object?> get props => [error];
}
