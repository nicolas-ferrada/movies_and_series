import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/media.dart';
import '../../logic/blocs/movie_popularity_bloc/movie_popularity_bloc.dart';
import '../../logic/blocs/movie_rating_bloc/movie_rating_bloc.dart';
import '../../logic/blocs/series_popularity_bloc/series_popularity_bloc.dart';
import '../../logic/blocs/series_rating_bloc/series_rating_bloc.dart';
import 'home_page.dart';

class HomePageBuild extends StatelessWidget {
  const HomePageBuild({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final movieRatingState = context.watch<MovieRatingBloc>().state;
        final moviePopularityState = context.watch<MoviePopularityBloc>().state;
        final seriesRatingState = context.watch<SeriesRatingBloc>().state;
        final seriesPopularityState =
            context.watch<SeriesPopularityBloc>().state;

        if (movieRatingState is MovieRatingLoading ||
            moviePopularityState is MoviePopularityLoading ||
            seriesRatingState is SeriesRatingLoading ||
            seriesPopularityState is SeriesPopularityLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (movieRatingState is MovieRatingLoaded &&
            moviePopularityState is MoviePopularityLoaded &&
            seriesRatingState is SeriesRatingLoaded &&
            seriesPopularityState is SeriesPopularityLoaded) {
          final List<Media> mediaList = [
            ...movieRatingState.ratingMovieList,
            ...moviePopularityState.popularityMovieList,
            ...seriesRatingState.ratingSeriesList,
            ...seriesPopularityState.popularitySeriesList,
          ];
          return HomePage(
            mediaList: mediaList,
          );
        } else if (movieRatingState is MovieRatingError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${movieRatingState.errorMessage}'),
            ),
          );
        } else if (moviePopularityState is MoviePopularityError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${moviePopularityState.errorMessage}'),
            ),
          );
        } else if (seriesRatingState is SeriesRatingError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${seriesRatingState.errorMessage}'),
            ),
          );
        } else if (seriesPopularityState is SeriesPopularityError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${seriesPopularityState.errorMessage}'),
            ),
          );
        }
        return const Scaffold(
          body: Center(
            child: Text('An unexpected error has occurred.'),
          ),
        );
      },
    );
  }
}
