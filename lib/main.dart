import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_and_series/presentation/pages/home_page_build.dart';

import 'logic/blocs/movie_rating_bloc/movie_rating_bloc.dart';
import 'presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieRatingBloc>(
          create: (context) => MovieRatingBloc()..add(MovieRatingLoad()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movies and Series',
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: const HomePageBuild(),
      ),
    );
  }
}
