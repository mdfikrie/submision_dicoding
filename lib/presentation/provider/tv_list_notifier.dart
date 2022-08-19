import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/tv/get_top_rated_tv.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_on_the_air.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_popular.dart';
import 'package:flutter/material.dart';

class TvListNotifier extends ChangeNotifier {
  var _listOnTheAirTv = <Tv>[];
  List<Tv> get onAirTv => _listOnTheAirTv;

  RequestState _nowPlayingState = RequestState.Empty;
  RequestState get onAirState => _nowPlayingState;

  var _popularTv = <Tv>[];
  List<Tv> get popularTv => _popularTv;

  RequestState _popularTvState = RequestState.Empty;
  RequestState get popularTvState => _popularTvState;

  var _topRatedTv = <Tv>[];
  List<Tv> get topRatedTv => _topRatedTv;

  RequestState _topRatedTvState = RequestState.Empty;
  RequestState get topRatedTvState => _topRatedTvState;

  String _message = '';
  String get message => _message;

  TvListNotifier(
    this._getTvOnTheAir,
    this._getTvPopular,
    this._getTopRatedTv,
  );

  final GetTvOnTheAir _getTvOnTheAir;
  final GetTvPopular _getTvPopular;
  final GetTopRatedTv _getTopRatedTv;

  Future<void> fetchOnTheAirTv() async {
    _nowPlayingState = RequestState.Loading;
    notifyListeners();

    final result = await _getTvOnTheAir.call(null);
    result.fold(
      (failure) {
        _nowPlayingState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (success) {
        _nowPlayingState = RequestState.Loaded;
        _listOnTheAirTv = success;
        notifyListeners();
      },
    );
  }

  Future<void> fetchPopularTv() async {
    _popularTvState = RequestState.Loading;
    notifyListeners();

    final result = await _getTvPopular.call(null);
    result.fold(
      (failure) {
        _popularTvState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (success) {
        _popularTvState = RequestState.Loaded;
        _popularTv = success;
        notifyListeners();
      },
    );
  }

  Future<void> fetchTopRatedTv() async {
    _topRatedTvState = RequestState.Loading;
    notifyListeners();

    final result = await _getTopRatedTv.call(null);
    result.fold(
      (failure) {
        _topRatedTvState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (success) {
        _topRatedTvState = RequestState.Loaded;
        _topRatedTv = success;
        notifyListeners();
      },
    );
  }
}
