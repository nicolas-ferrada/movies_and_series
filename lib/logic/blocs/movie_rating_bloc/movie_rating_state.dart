part of 'movie_rating_bloc.dart';

sealed class MovieRatingState extends Equatable {
  const MovieRatingState();

  @override
  List<Object> get props => [];
}

final class MovieRatingInitial extends MovieRatingState {}

final class MovieRatingLoading extends MovieRatingState {}

final class MovieRatingLoaded extends MovieRatingState {
  final List<Movie> ratingMovieList;

  const MovieRatingLoaded({required this.ratingMovieList});

  @override
  List<Object> get props => [ratingMovieList];
}

final class MovieRatingError extends MovieRatingState {
  final String errorMessage;

  const MovieRatingError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
