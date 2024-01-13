part of 'movie_popularity_bloc.dart';

sealed class MoviePopularityState extends Equatable {
  const MoviePopularityState();

  @override
  List<Object> get props => [];
}

final class MoviePopularityInitial extends MoviePopularityState {}

final class MoviePopularityLoading extends MoviePopularityState {}

final class MoviePopularityLoaded extends MoviePopularityState {
  final List<Movie> popularityMovieList;

  const MoviePopularityLoaded({required this.popularityMovieList});

  @override
  List<Object> get props => [popularityMovieList];
}

final class MoviePopularityError extends MoviePopularityState {
  final String errorMessage;

  const MoviePopularityError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
