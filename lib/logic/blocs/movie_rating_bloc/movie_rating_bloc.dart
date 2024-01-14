import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/movie.dart';
import '../../../data/repositories/movie_rating_repository.dart';

part 'movie_rating_event.dart';
part 'movie_rating_state.dart';

class MovieRatingBloc extends Bloc<MovieRatingEvent, MovieRatingState> {
  final MovieRatingRepository repository;
  MovieRatingBloc({
    required this.repository,
  }) : super(MovieRatingInitial()) {
    on<MovieRatingLoad>(_onLoad);
  }

  void _onLoad(
    MovieRatingLoad event,
    Emitter<MovieRatingState> emit,
  ) async {
    try {
      emit(MovieRatingLoading());
      List<Movie> movieList = await repository.getTopRatedMovies();
      emit(MovieRatingLoaded(ratingMovieList: movieList));
    } catch (e) {
      emit(MovieRatingError(errorMessage: e.toString()));
    }
  }
}
