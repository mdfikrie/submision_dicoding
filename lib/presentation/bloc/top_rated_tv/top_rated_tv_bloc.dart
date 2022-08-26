import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/usecases/tv/get_top_rated_tv.dart';
import 'package:equatable/equatable.dart';

part 'top_rated_tv_event.dart';
part 'top_rated_tv_state.dart';

class TopRatedTvBloc extends Bloc<TopRatedTvEvent, TopRatedTvState> {
  GetTopRatedTv _getTopRatedTv;
  TopRatedTvBloc(this._getTopRatedTv) : super(TopRatedTvInitial()) {
    on<TopRatedTvEvent>((event, emit) async {
      emit(TopRatedTvLoading());
      final result = await _getTopRatedTv.call(null);
      result.fold((failure) {
        emit(TopRatedTvError(error: failure.message));
      }, (listTv) {
        emit(TopRatedTvLoaded(listTv: listTv));
      });
    });
  }
}
