part of 'movie_rating_bloc.dart';

sealed class MovieRatingEvent extends Equatable {
  const MovieRatingEvent();

  @override
  List<Object> get props => [];
}

final class MovieRatingLoad extends MovieRatingEvent {}
