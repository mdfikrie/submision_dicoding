part of 'search_tv_bloc.dart';

abstract class SearchTvState extends Equatable {
  const SearchTvState();
}

class SearchTvInitial extends SearchTvState {
  @override
  List<Object> get props => [];
}

class SearchTvLoaded extends SearchTvState {
  final List<Tv>? listTv;
  SearchTvLoaded({this.listTv});
  @override
  List<Object> get props => [listTv!];
}

class SearchTvLoading extends SearchTvState {
  @override
  List<Object> get props => [];
}

class SearchTvError extends SearchTvState {
  final String? message;
  SearchTvError({this.message});
  @override
  List<Object> get props => [message!];
}
