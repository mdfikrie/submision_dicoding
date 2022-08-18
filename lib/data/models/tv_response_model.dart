import 'package:ditonton/data/models/tv_model.dart';
import 'package:equatable/equatable.dart';

class TvResponseModel extends Equatable {
  final List<TvModel>? listTv;
  TvResponseModel({this.listTv});

  factory TvResponseModel.fromJson(Map<String, dynamic> json) =>
      TvResponseModel(
        listTv: List<TvModel>.from((json["results"] as List)
            .map((x) => TvModel.fromJson(x))
            .where((element) => element.posterPath != null)),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(listTv!.map((x) => x.toJson())),
      };
  @override
  // TODO: implement props
  List<Object?> get props => [listTv];
}
