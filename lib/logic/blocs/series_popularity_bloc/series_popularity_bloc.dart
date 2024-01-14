import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/series.dart';

part 'series_popularity_event.dart';
part 'series_popularity_state.dart';

class SeriesPopularityBloc
    extends Bloc<SeriesPopularityEvent, SeriesPopularityState> {
  SeriesPopularityBloc() : super(SeriesPopularityInitial()) {
    on<SeriesPopularityLoad>(_onLoad);
  }

  void _onLoad(
    SeriesPopularityLoad event,
    Emitter<SeriesPopularityState> emit,
  ) async {
    emit(SeriesPopularityLoading());
    await Future.delayed(const Duration(seconds: 2)); // api call simulation
    final List<Series> popularitySeriesList = [
      const Series(
        id: 110,
        name: 'Series popular',
        overview: 'Overview Serie',
        releaseDate: '2021-01-01',
        rating: 8.0,
        rateCount: 100,
        popularity: 2000,
        posterPath: '/3xnWaLQjelJDDF7LT1WBo6f4BRe.jpg',
        backdropPath: '/9faGSFi5jam6pDWGNd0p8JcJgXQ.jpg',
      ),
      const Series(
        id: 120,
        name: 'Serie popular 2',
        overview: 'Overview serie 2',
        releaseDate: '2024-01-01',
        rating: 8.0,
        rateCount: 100,
        popularity: 2000,
        posterPath: '/3xnWaLQjelJDDF7LT1WBo6f4BRe.jpg',
        backdropPath: '/9faGSFi5jam6pDWGNd0p8JcJgXQ.jpg',
      ),
    ];
    emit(SeriesPopularityLoaded(popularitySeriesList: popularitySeriesList));
  }
}
