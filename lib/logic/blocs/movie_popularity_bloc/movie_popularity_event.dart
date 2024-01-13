part of 'movie_popularity_bloc.dart';

sealed class MoviePopularityEvent extends Equatable {
  const MoviePopularityEvent();

  @override
  List<Object> get props => [];
}

final class MoviePopularityLoad extends MoviePopularityEvent {}
