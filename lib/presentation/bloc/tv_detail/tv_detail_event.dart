part of 'tv_detail_bloc.dart';

abstract class TvDetailEvent extends Equatable {
  const TvDetailEvent();
}

class GetTvDetailEvent extends TvDetailEvent {
  final int? id;
  GetTvDetailEvent({this.id});
  @override
  List<Object> get props => [id!];
}

class AddTvWatchListEvent extends TvDetailEvent {
  final TvDetail? tv;
  AddTvWatchListEvent({this.tv});
  @override
  List<Object> get props => [tv!];
}

class RemoveTvWatchListEvent extends TvDetailEvent {
  final TvDetail? tv;
  RemoveTvWatchListEvent({this.tv});
  @override
  List<Object> get props => [tv!];
}
