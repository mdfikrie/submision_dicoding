import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_popular.dart';
import 'package:equatable/equatable.dart';

part 'popular_tv_event.dart';
part 'popular_tv_state.dart';

class PopularTvBloc extends Bloc<PopularTvEvent, PopularTvState> {
  GetTvPopular _getTvPopular;
  PopularTvBloc(this._getTvPopular) : super(PopularTvInitial()) {
    on<PopularTvEvent>((event, emit) async {
      emit(PopularTvLoading());
      final result = await _getTvPopular.call(null);
      result.fold((failure) {
        emit(PopularTvError(message: failure.message));
      }, (listTv) {
        emit(PopularTvLoaded(listTv: listTv));
      });
    });
  }
}
