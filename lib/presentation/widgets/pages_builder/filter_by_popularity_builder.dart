import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_and_series/presentation/pages/home_page.dart';
import 'package:movies_and_series/presentation/widgets/reusable_widgets/basic_scaffold.dart';

import '../../../data/models/media.dart';
import '../../../logic/blocs/movie_popularity_bloc/movie_popularity_bloc.dart';
import '../../../logic/blocs/series_popularity_bloc/series_popularity_bloc.dart';

class FilterByPopularityBuilder extends StatelessWidget {
  const FilterByPopularityBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final seriesPopularityState =
            context.watch<SeriesPopularityBloc>().state;
        final moviePopularityState = context.watch<MoviePopularityBloc>().state;

        if (moviePopularityState is MoviePopularityLoading ||
            seriesPopularityState is SeriesPopularityLoading) {
          return const BasicScaffoldCenter(CircularProgressIndicator());
        } else if (moviePopularityState is MoviePopularityLoaded &&
            seriesPopularityState is SeriesPopularityLoaded) {
          final List<Media> mediaList = [
            ...moviePopularityState.popularityMovieList,
            ...seriesPopularityState.popularitySeriesList,
          ];
          return HomePage(
            mediaList: mediaList,
          );
        } else if (moviePopularityState is MoviePopularityError) {
          return BasicScaffoldCenter(
              Text('Error: ${(moviePopularityState).errorMessage}'));
        } else if (seriesPopularityState is SeriesPopularityError) {
          return BasicScaffoldCenter(
              Text('Error: ${(seriesPopularityState).errorMessage}'));
        } else {
          return const BasicScaffoldCenter(Text('An unexpected error occured'));
        }
      },
    );
  }
}
