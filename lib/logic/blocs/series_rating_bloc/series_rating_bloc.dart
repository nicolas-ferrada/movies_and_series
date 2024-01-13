import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/series.dart';

part 'series_rating_event.dart';
part 'series_rating_state.dart';

class SeriesRatingBloc extends Bloc<SeriesRatingEvent, SeriesRatingState> {
  SeriesRatingBloc() : super(SeriesRatingInitial()) {
    on<SeriesRatingLoad>(_onLoad);
  }

  void _onLoad(
    SeriesRatingLoad event,
    Emitter<SeriesRatingState> emit,
  ) async {
    emit(SeriesRatingLoading());
    await Future.delayed(const Duration(seconds: 2)); // api call simulation
    final List<Series> ratingSeriesList = [
      const Series(
        id: 11,
        name: 'Series',
        overview: 'Overview Serie',
        releaseDate: '2021-01-01',
        rating: 8.0,
        rateCount: 100,
        popularity: 1000,
        posterPath: '/3xnWaLQjelJDDF7LT1WBo6f4BRe.jpg',
        backdropPath: '/9faGSFi5jam6pDWGNd0p8JcJgXQ.jpg',
      ),
      const Series(
        id: 20,
        name: 'Serie 2',
        overview: 'Overview serie 2',
        releaseDate: '2024-01-01',
        rating: 8.0,
        rateCount: 100,
        popularity: 1000,
        posterPath: '/3xnWaLQjelJDDF7LT1WBo6f4BRe.jpg',
        backdropPath: '/9faGSFi5jam6pDWGNd0p8JcJgXQ.jpg',
      ),
    ];
    emit(SeriesRatingLoaded(ratingSeriesList: ratingSeriesList));
  }
}
