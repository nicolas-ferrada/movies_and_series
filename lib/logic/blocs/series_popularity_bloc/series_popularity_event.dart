part of 'series_popularity_bloc.dart';

sealed class SeriesPopularityEvent extends Equatable {
  const SeriesPopularityEvent();

  @override
  List<Object> get props => [];
}

final class SeriesPopularityLoad extends SeriesPopularityEvent {}
