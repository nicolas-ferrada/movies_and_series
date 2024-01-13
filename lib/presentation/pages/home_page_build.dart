import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/media.dart';
import '../../logic/blocs/movie_popularity_bloc/movie_popularity_bloc.dart';
import '../../logic/blocs/movie_rating_bloc/movie_rating_bloc.dart';
import 'home_page.dart';

class HomePageBuild extends StatelessWidget {
  const HomePageBuild({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final movieRatingState = context.watch<MovieRatingBloc>().state;
        final moviePopularityState = context.watch<MoviePopularityBloc>().state;

        if (movieRatingState is MovieRatingLoading ||
            moviePopularityState is MoviePopularityLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (movieRatingState is MovieRatingLoaded &&
            moviePopularityState is MoviePopularityLoaded) {
          final List<Media> mediaList = [
            ...movieRatingState.ratingMovieList,
            ...moviePopularityState.popularityMovieList,
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
