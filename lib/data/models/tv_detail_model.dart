import 'package:ditonton/data/models/genre_model.dart';
import 'package:ditonton/domain/entities/tv_detail.dart';

class TvDetailModel {
  TvDetailModel({
    this.backdropPath,
    this.firstAirDate,
    this.genres,
    this.homepage,
    this.id,
    this.inProduction,
    this.lastAirDate,
    this.name,
    this.numberOfEpisodes,
    this.numberOfSeasons,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.status,
    this.tagline,
    this.type,
    this.voteAverage,
    this.voteCount,
  });

  final String? backdropPath;
  final DateTime? firstAirDate;
  final List<GenreModel>? genres;
  final String? homepage;
  final int? id;
  final bool? inProduction;
  final DateTime? lastAirDate;
  final String? name;
  final int? numberOfEpisodes;
  final int? numberOfSeasons;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? status;
  final String? tagline;
  final String? type;
  final double? voteAverage;
  final int? voteCount;

  factory TvDetailModel.fromJson(Map<String, dynamic> json) => TvDetailModel(
        backdropPath: json["backdrop_path"],
        firstAirDate: DateTime.parse(json["first_air_date"]),
        genres: List<GenreModel>.from(
            json["genres"].map((x) => GenreModel.fromJson(x))),
        homepage: json["homepage"],
        id: json["id"],
        inProduction: json["in_production"],
        lastAirDate: DateTime.parse(json["last_air_date"]),
        name: json["name"],
        numberOfEpisodes: json["number_of_episodes"],
        numberOfSeasons: json["number_of_seasons"],
        originalLanguage: json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        status: json["status"],
        tagline: json["tagline"],
        type: json["type"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "first_air_date":
            "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
        "genres": List<dynamic>.from(genres!.map((x) => x.toJson())),
        "homepage": homepage,
        "id": id,
        "in_production": inProduction,
        "last_air_date":
            "${lastAirDate!.year.toString().padLeft(4, '0')}-${lastAirDate!.month.toString().padLeft(2, '0')}-${lastAirDate!.day.toString().padLeft(2, '0')}",
        "name": name,
        "number_of_episodes": numberOfEpisodes,
        "number_of_seasons": numberOfSeasons,
        "original_language": originalLanguage,
        "original_name": originalName,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "status": status,
        "tagline": tagline,
        "type": type,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };

  TvDetail toEntity() => TvDetail(
        backdropPath: this.backdropPath,
        firstAirDate: this.firstAirDate,
        genres: this.genres!.map((genre) => genre.toEntity()).toList(),
        homepage: this.homepage,
        id: this.id,
        inProduction: this.inProduction,
        lastAirDate: this.lastAirDate,
        name: this.name,
        numberOfEpisodes: this.numberOfEpisodes,
        numberOfSeasons: this.numberOfSeasons,
        originalLanguage: this.originalLanguage,
        originalName: this.originalName,
        overview: this.overview,
        popularity: this.popularity,
        posterPath: this.posterPath,
        status: this.status,
        tagline: this.tagline,
        type: this.type,
        voteAverage: this.voteAverage,
        voteCount: this.voteCount,
      );
}
