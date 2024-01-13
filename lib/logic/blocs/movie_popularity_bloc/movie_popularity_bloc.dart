import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/movie.dart';

part 'movie_popularity_event.dart';
part 'movie_popularity_state.dart';

class MoviePopularityBloc
    extends Bloc<MoviePopularityEvent, MoviePopularityState> {
  MoviePopularityBloc() : super(MoviePopularityInitial()) {
    on<MoviePopularityLoad>(_onLoad);
  }

  void _onLoad(
    MoviePopularityLoad event,
    Emitter<MoviePopularityState> emit,
  ) async {
    emit(MoviePopularityLoading());
    await Future.delayed(const Duration(seconds: 2)); // api call simulation
    final List<Movie> popularityMovieList = [
      const Movie(
        id: 6,
        name: 'Movie popularity',
        overview: 'Overview Movie',
        releaseDate: '2021-01-01',
        rating: 8.0,
        rateCount: 100,
        popularity: 500,
        posterPath: '/3xnWaLQjelJDDF7LT1WBo6f4BRe.jpg',
        backdropPath: '/9faGSFi5jam6pDWGNd0p8JcJgXQ.jpg',
      ),
      const Movie(
        id: 10,
        name: 'Movie 2 popularity',
        overview: 'Overview Movie 2',
        releaseDate: '2024-01-01',
        rating: 8.0,
        rateCount: 100,
        popularity: 1000,
        posterPath: '/3xnWaLQjelJDDF7LT1WBo6f4BRe.jpg',
        backdropPath: '/9faGSFi5jam6pDWGNd0p8JcJgXQ.jpg',
      ),
    ];
    emit(MoviePopularityLoaded(popularityMovieList: popularityMovieList));
  }
}
