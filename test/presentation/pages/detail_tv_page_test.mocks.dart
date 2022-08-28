// Mocks generated by Mockito 5.3.0 from annotations
// in ditonton/test/presentation/pages/detail_tv_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i9;
import 'dart:ui' as _i10;

import 'package:ditonton/common/state_enum.dart' as _i7;
import 'package:ditonton/domain/entities/tv.dart' as _i8;
import 'package:ditonton/domain/entities/tv_detail.dart' as _i5;
import 'package:ditonton/domain/usecases/get_watchlist_status.dart' as _i2;
import 'package:ditonton/domain/usecases/remove_tv_watchlist.dart' as _i4;
import 'package:ditonton/domain/usecases/save_tv_watchlist.dart' as _i3;
import 'package:ditonton/presentation/provider/tv_detail_notifier.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeGetWatchListStatus_0 extends _i1.SmartFake
    implements _i2.GetWatchListStatus {
  _FakeGetWatchListStatus_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeSaveTvWatchlist_1 extends _i1.SmartFake
    implements _i3.SaveTvWatchlist {
  _FakeSaveTvWatchlist_1(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeRemoveTvWatchlist_2 extends _i1.SmartFake
    implements _i4.RemoveTvWatchlist {
  _FakeRemoveTvWatchlist_2(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeTvDetail_3 extends _i1.SmartFake implements _i5.TvDetail {
  _FakeTvDetail_3(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [TvDetailNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvDetailNotifier extends _i1.Mock implements _i6.TvDetailNotifier {
  MockTvDetailNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetWatchListStatus get getWatchListStatus =>
      (super.noSuchMethod(Invocation.getter(#getWatchListStatus),
              returnValue: _FakeGetWatchListStatus_0(
                  this, Invocation.getter(#getWatchListStatus)))
          as _i2.GetWatchListStatus);
  @override
  _i3.SaveTvWatchlist get saveTvWatchlist => (super.noSuchMethod(
          Invocation.getter(#saveTvWatchlist),
          returnValue:
              _FakeSaveTvWatchlist_1(this, Invocation.getter(#saveTvWatchlist)))
      as _i3.SaveTvWatchlist);
  @override
  _i4.RemoveTvWatchlist get removeTvWatchlist =>
      (super.noSuchMethod(Invocation.getter(#removeTvWatchlist),
              returnValue: _FakeRemoveTvWatchlist_2(
                  this, Invocation.getter(#removeTvWatchlist)))
          as _i4.RemoveTvWatchlist);
  @override
  _i5.TvDetail get tv => (super.noSuchMethod(Invocation.getter(#tv),
          returnValue: _FakeTvDetail_3(this, Invocation.getter(#tv)))
      as _i5.TvDetail);
  @override
  _i7.RequestState get tvState =>
      (super.noSuchMethod(Invocation.getter(#tvState),
          returnValue: _i7.RequestState.Empty) as _i7.RequestState);
  @override
  List<_i8.Tv> get tvRecommendations =>
      (super.noSuchMethod(Invocation.getter(#tvRecommendations),
          returnValue: <_i8.Tv>[]) as List<_i8.Tv>);
  @override
  _i7.RequestState get recommendationState =>
      (super.noSuchMethod(Invocation.getter(#recommendationState),
          returnValue: _i7.RequestState.Empty) as _i7.RequestState);
  @override
  String get message =>
      (super.noSuchMethod(Invocation.getter(#message), returnValue: '')
          as String);
  @override
  bool get isAddedToWatchlist =>
      (super.noSuchMethod(Invocation.getter(#isAddedToWatchlist),
          returnValue: false) as bool);
  @override
  String get watchlistMessage =>
      (super.noSuchMethod(Invocation.getter(#watchlistMessage), returnValue: '')
          as String);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  _i9.Future<void> fetchTvDetail(int? id) => (super.noSuchMethod(
      Invocation.method(#fetchTvDetail, [id]),
      returnValue: _i9.Future<void>.value(),
      returnValueForMissingStub: _i9.Future<void>.value()) as _i9.Future<void>);
  @override
  _i9.Future<void> addWatchlist(_i5.TvDetail? tv) => (super.noSuchMethod(
      Invocation.method(#addWatchlist, [tv]),
      returnValue: _i9.Future<void>.value(),
      returnValueForMissingStub: _i9.Future<void>.value()) as _i9.Future<void>);
  @override
  _i9.Future<void> removeFromWatchlist(_i5.TvDetail? tv) => (super.noSuchMethod(
      Invocation.method(#removeFromWatchlist, [tv]),
      returnValue: _i9.Future<void>.value(),
      returnValueForMissingStub: _i9.Future<void>.value()) as _i9.Future<void>);
  @override
  _i9.Future<void> loadWatchlistStatus(int? id) => (super.noSuchMethod(
      Invocation.method(#loadWatchlistStatus, [id]),
      returnValue: _i9.Future<void>.value(),
      returnValueForMissingStub: _i9.Future<void>.value()) as _i9.Future<void>);
  @override
  void addListener(_i10.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void removeListener(_i10.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  void notifyListeners() =>
      super.noSuchMethod(Invocation.method(#notifyListeners, []),
          returnValueForMissingStub: null);
}
