part of 'series_rating_bloc.dart';

sealed class SeriesRatingEvent extends Equatable {
  const SeriesRatingEvent();

  @override
  List<Object> get props => [];
}

final class SeriesRatingLoad extends SeriesRatingEvent {}
