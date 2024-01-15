part of 'series_rating_bloc.dart';

sealed class SeriesRatingState extends Equatable {
  const SeriesRatingState();

  @override
  List<Object> get props => [];
}

final class SeriesRatingLoading extends SeriesRatingState {}

final class SeriesRatingLoaded extends SeriesRatingState {
  final List<Series> ratingSeriesList;

  const SeriesRatingLoaded({required this.ratingSeriesList});

  @override
  List<Object> get props => [ratingSeriesList];
}

final class SeriesRatingError extends SeriesRatingState {
  final String errorMessage;

  const SeriesRatingError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
