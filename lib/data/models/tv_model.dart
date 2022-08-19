import 'package:ditonton/domain/entities/tv.dart';
import 'package:equatable/equatable.dart';

class TvModel extends Equatable {
  TvModel({
    this.posterPath,
    this.popularity,
    this.id,
    this.backdropPath,
    this.voteAverage,
    this.overview,
    // this.firstAirDate,
    this.originCountry,
    this.genreIds,
    this.originalLanguage,
    this.voteCount,
    this.name,
    this.originalName,
  });

  final String? posterPath;
  final double? popularity;
  final int? id;
  final String? backdropPath;
  final double? voteAverage;
  final String? overview;
  // final DateTime? firstAirDate;
  final List<String>? originCountry;
  final List<int>? genreIds;
  final String? originalLanguage;
  final int? voteCount;
  final String? name;
  final String? originalName;

  factory TvModel.fromJson(Map<String, dynamic> json) => TvModel(
        posterPath: json["poster_path"],
        popularity: json["popularity"].toDouble(),
        id: json["id"],
        backdropPath: json["backdrop_path"],
        voteAverage: json["vote_average"].toDouble(),
        overview: json["overview"],
        // firstAirDate: DateTime.parse(json["first_air_date"]),
        originCountry: List<String>.from(json["origin_country"].map((x) => x)),
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        originalLanguage: json["original_language"],
        voteCount: json["vote_count"],
        name: json["name"],
        originalName: json["original_name"],
      );

  Map<String, dynamic> toJson() => {
        "poster_path": posterPath,
        "popularity": popularity,
        "id": id,
        "backdrop_path": backdropPath,
        "vote_average": voteAverage,
        "overview": overview,
        "origin_country": List<dynamic>.from(originCountry!.map((x) => x)),
        "genre_ids": List<dynamic>.from(genreIds!.map((x) => x)),
        "original_language": originalLanguage,
        "vote_count": voteCount,
        "name": name,
        "original_name": originalName,
      };

  Tv toEntity() => Tv(
        backdropPath: this.backdropPath,
        genreIds: this.genreIds,
        id: this.id,
        name: this.name,
        originCountry: this.originCountry,
        originalLanguage: this.originalLanguage,
        originalName: this.originalName,
        overview: this.overview,
        popularity: this.popularity,
        posterPath: this.posterPath,
        voteAverage: this.voteAverage,
        voteCount: this.voteCount,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        posterPath,
        popularity,
        id,
        backdropPath,
        voteAverage,
        overview,
        originCountry,
        genreIds,
        originalLanguage,
        voteCount,
        name,
        originalName
      ];
}
