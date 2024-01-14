import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_and_series/presentation/pages/home_page.dart';
import 'package:movies_and_series/presentation/widgets/reusable_widgets/basic_scaffold.dart';

import '../../../data/models/media.dart';
import '../../../logic/blocs/movie_rating_bloc/movie_rating_bloc.dart';
import '../../../logic/blocs/series_rating_bloc/series_rating_bloc.dart';

class FilterByRatingBuilder extends StatelessWidget {
  const FilterByRatingBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final movieRatingState = context.watch<MovieRatingBloc>().state;
        final seriesRatingState = context.watch<SeriesRatingBloc>().state;

        if (movieRatingState is MovieRatingLoading ||
            seriesRatingState is SeriesRatingLoading) {
          return const BasicScaffoldCenter(CircularProgressIndicator());
        } else if (movieRatingState is MovieRatingLoaded &&
            seriesRatingState is SeriesRatingLoaded) {
          final List<Media> mediaList = [
            ...movieRatingState.ratingMovieList,
            ...seriesRatingState.ratingSeriesList,
          ];
          return HomePage(
            mediaList: mediaList,
          );
        } else if (movieRatingState is MovieRatingError) {
          return BasicScaffoldCenter(
              Text('Error: ${(movieRatingState).errorMessage}'));
        } else if (seriesRatingState is SeriesRatingError) {
          return BasicScaffoldCenter(
              Text('Error: ${(seriesRatingState).errorMessage}'));
        } else {
          return const BasicScaffoldCenter(Text('An unexpected error occured'));
        }
      },
    );
  }
}
