import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies_and_series/logic/blocs/category_filter_bloc/category_filter_bloc.dart';
import 'package:movies_and_series/logic/blocs/movie_popularity_bloc/movie_popularity_bloc.dart';
import 'package:movies_and_series/logic/blocs/series_popularity_bloc/series_popularity_bloc.dart';
import 'package:movies_and_series/logic/blocs/series_rating_bloc/series_rating_bloc.dart';
import 'package:movies_and_series/presentation/widgets/pages_builder/home_page_builder.dart';

import 'data/data_provider/movie_rating_api.dart';
import 'data/repositories/movie_rating_repository.dart';
import 'logic/blocs/movie_rating_bloc/movie_rating_bloc.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<MovieRatingRepository>(
          create: (context) => MovieRatingRepository(
            movieRatingProvider: MovieRatingApi(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<MovieRatingBloc>(
            create: (context) => MovieRatingBloc(
              movieRatingRepository: context.read<MovieRatingRepository>(),
            )..add(MovieRatingLoad()),
          ),
          BlocProvider<MoviePopularityBloc>(
            create: (context) =>
                MoviePopularityBloc()..add(MoviePopularityLoad()),
          ),
          BlocProvider<SeriesRatingBloc>(
            create: (context) => SeriesRatingBloc()..add(SeriesRatingLoad()),
          ),
          BlocProvider<SeriesPopularityBloc>(
            create: (context) =>
                SeriesPopularityBloc()..add(SeriesPopularityLoad()),
          ),
          BlocProvider<CategoryFilterBloc>(
              create: (context) => CategoryFilterBloc()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Movies and Series',
          theme: ThemeData(
            brightness: Brightness.dark,
          ),
          home: const HomePageBuilder(),
        ),
      ),
    );
  }
}
