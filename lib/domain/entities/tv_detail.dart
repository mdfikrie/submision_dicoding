import 'package:ditonton/domain/entities/genre.dart';
import 'package:equatable/equatable.dart';

class TvDetail extends Equatable {
  TvDetail({
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
  final List<Genre>? genres;
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

  @override
  // TODO: implement props
  List<Object?> get props => [
        backdropPath,
        firstAirDate,
        genres,
        homepage,
        id,
        inProduction,
        lastAirDate,
        name,
        numberOfEpisodes,
        numberOfSeasons,
        originalLanguage,
        originalName,
        overview,
        popularity,
        posterPath,
        status,
        tagline,
        type,
        voteAverage,
        voteCount,
      ];
}
