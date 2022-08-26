part of 'on_the_air_tv_bloc.dart';

abstract class OnTheAirTvState extends Equatable {
  const OnTheAirTvState();
}

class OnTheAirTvInitial extends OnTheAirTvState {
  @override
  List<Object> get props => [];
}

class OnTheAirTvLoading extends OnTheAirTvState {
  @override
  List<Object> get props => [];
}

class OnTheAirTvLoaded extends OnTheAirTvState {
  final List<Tv>? listTv;
  OnTheAirTvLoaded({this.listTv});
  @override
  List<Object> get props => [listTv!];
}

class OnTheAirTvError extends OnTheAirTvState {
  final String? error;
  OnTheAirTvError({this.error});
  @override
  List<Object> get props => [error!];
}
