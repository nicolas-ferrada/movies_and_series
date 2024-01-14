import 'package:equatable/equatable.dart';

abstract class Media extends Equatable {
  final int id;
  final String name;
  final String overview;
  final String releaseDate;
  final double rating;
  final int rateCount;
  final double popularity;
  final String posterPath;
  final String backdropPath;

  const Media({
    required this.id,
    required this.name,
    required this.overview,
    required this.releaseDate,
    required this.rating,
    required this.rateCount,
    required this.popularity,
    required this.posterPath,
    required this.backdropPath,
  });
}
