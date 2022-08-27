import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/usecases/tv/search_tv.dart';
import 'package:equatable/equatable.dart';

part 'search_tv_event.dart';
part 'search_tv_state.dart';

class SearchTvBloc extends Bloc<SearchTvEvent, SearchTvState> {
  SearchTv _searchTv;
  SearchTvBloc(this._searchTv) : super(SearchTvInitial()) {
    on<SearchTvEvent>((event, emit) async {
      emit(SearchTvLoading());
      final result = await _searchTv.call(event.keyword!);
      result.fold((failure) {
        emit(SearchTvError(message: failure.message));
      }, (listTv) {
        emit(SearchTvLoaded(listTv: listTv));
      });
    });
  }
}
