import 'media.dart';

class Series extends Media {
  const Series({
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
}
