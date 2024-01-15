part of 'series_popularity_bloc.dart';

sealed class SeriesPopularityState extends Equatable {
  const SeriesPopularityState();

  @override
  List<Object> get props => [];
}

final class SeriesPopularityLoading extends SeriesPopularityState {}

final class SeriesPopularityLoaded extends SeriesPopularityState {
  final List<Series> popularitySeriesList;

  const SeriesPopularityLoaded({required this.popularitySeriesList});

  @override
  List<Object> get props => [popularitySeriesList];
}

final class SeriesPopularityError extends SeriesPopularityState {
  final String errorMessage;

  const SeriesPopularityError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
