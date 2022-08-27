part of 'search_tv_bloc.dart';

class SearchTvEvent extends Equatable {
  final String? keyword;
  const SearchTvEvent({this.keyword});

  @override
  List<Object> get props => [keyword!];
}
