import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_on_the_air.dart';
import 'package:equatable/equatable.dart';

part 'on_the_air_tv_event.dart';
part 'on_the_air_tv_state.dart';

class OnTheAirTvBloc extends Bloc<OnTheAirTvEvent, OnTheAirTvState> {
  GetTvOnTheAir _getTvOnTheAir;
  OnTheAirTvBloc(this._getTvOnTheAir) : super(OnTheAirTvInitial()) {
    on<OnTheAirTvEvent>((event, emit) async {
      emit(OnTheAirTvLoading());
      final result = await _getTvOnTheAir.call(null);
      result.fold((failure) {
        emit(OnTheAirTvError(error: failure.message));
      }, (listTv) {
        emit(OnTheAirTvLoaded(listTv: listTv));
      });
    });
  }
}
