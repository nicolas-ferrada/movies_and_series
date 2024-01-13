import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/movie.dart';

part 'movie_rating_event.dart';
part 'movie_rating_state.dart';

class MovieRatingBloc extends Bloc<MovieRatingEvent, MovieRatingState> {
  MovieRatingBloc() : super(MovieRatingInitial()) {
    on<MovieRatingLoad>(_onMovieRatingLoad);
  }

  void _onMovieRatingLoad(
    MovieRatingLoad event,
    Emitter<MovieRatingState> emit,
  ) async {
    emit(MovieRatingLoading());
    await Future.delayed(const Duration(seconds: 2)); // api call simulation
    final List<Movie> ratingMovieList = [
      const Movie(
        id: 1,
        name: 'Movie',
        overview: 'Overview Movie',
        releaseDate: '2021-01-01',
        rating: 8.0,
        rateCount: 100,
        posterPath: '/3xnWaLQjelJDDF7LT1WBo6f4BRe.jpg',
        backdropPath: '/9faGSFi5jam6pDWGNd0p8JcJgXQ.jpg',
      ),
      const Movie(
        id: 2,
        name: 'Movie 2',
        overview: 'Overview Movie 2',
        releaseDate: '2024-01-01',
        rating: 8.0,
        rateCount: 100,
        posterPath: '/3xnWaLQjelJDDF7LT1WBo6f4BRe.jpg',
        backdropPath: '/9faGSFi5jam6pDWGNd0p8JcJgXQ.jpg',
      ),
    ];
    emit(MovieRatingLoaded(ratingMovieList: ratingMovieList));
  }
}
