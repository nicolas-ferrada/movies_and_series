import 'media.dart';

class Movie extends Media {
  const Movie({
    required super.id,
    required super.name,
    required super.overview,
    required super.releaseDate,
    required super.rating,
    required super.rateCount,
    required super.popularity,
    required super.posterPath,
    required super.backdropPath,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      overview,
      releaseDate,
      rating,
      rateCount,
      popularity,
      posterPath,
      backdropPath,
    ];
  }

  factory Movie.fromMap({
    required Map<String, dynamic> map,
  }) {
    return Movie(
      id: map['id'] as int? ?? 0,
      name: map['title'] as String? ?? '',
      overview: map['overview'] as String? ?? '',
      releaseDate: map['release_date'] as String? ?? '',
      rating: map['vote_average'] as double? ?? 0.0,
      rateCount: map['vote_count'] as int? ?? 0,
      popularity: map['popularity'] as double? ?? 0.0,
      posterPath: map['poster_path'] as String? ?? '',
      backdropPath: map['backdrop_path'] as String? ?? '',
    );
  }
}
