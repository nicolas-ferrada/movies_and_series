import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/blocs/movie_rating_bloc/movie_rating_bloc.dart';
import 'home_page.dart';

class HomePageBuild extends StatelessWidget {
  const HomePageBuild({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final movieRatingState = context.watch<MovieRatingBloc>().state;
        if (movieRatingState is MovieRatingLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (movieRatingState is MovieRatingLoaded) {
          return HomePage(
            mediaList: movieRatingState.ratingMovieList,
          );
        } else if (movieRatingState is MovieRatingError) {
          return Center(
            child: Text('Error: ${movieRatingState.errorMessage}'),
          );
        }
        return const Center(
          child: Text('An unexpected error has occurred.'),
        );
      },
    );
  }
}
