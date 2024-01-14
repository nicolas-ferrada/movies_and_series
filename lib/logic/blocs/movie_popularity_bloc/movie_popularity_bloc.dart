import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/movie.dart';
import '../../../data/repositories/movie_popularity_repository.dart';

part 'movie_popularity_event.dart';
part 'movie_popularity_state.dart';

class MoviePopularityBloc
    extends Bloc<MoviePopularityEvent, MoviePopularityState> {
  final MoviePopularityRepository repository;

  MoviePopularityBloc({
    required this.repository,
  }) : super(MoviePopularityInitial()) {
    on<MoviePopularityLoad>(_onLoad);
  }

  void _onLoad(
    MoviePopularityLoad event,
    Emitter<MoviePopularityState> emit,
  ) async {
    emit(MoviePopularityLoading());
    final List<Movie> popularityMovieList =
        await repository.getPopularityMovieList();
    emit(MoviePopularityLoaded(popularityMovieList: popularityMovieList));
  }
}
