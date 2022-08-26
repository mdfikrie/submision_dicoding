part of 'popular_tv_bloc.dart';

abstract class PopularTvState extends Equatable {
  const PopularTvState();
}

class PopularTvInitial extends PopularTvState {
  @override
  List<Object> get props => [];
}

class PopularTvLoaded extends PopularTvState {
  final List<Tv>? listTv;
  PopularTvLoaded({this.listTv});
  @override
  List<Object> get props => [listTv!];
}

class PopularTvLoading extends PopularTvState {
  @override
  List<Object> get props => [];
}

class PopularTvError extends PopularTvState {
  final String? message;
  PopularTvError({this.message});
  @override
  List<Object> get props => [message!];
}
