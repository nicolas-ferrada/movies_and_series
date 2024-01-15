import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_and_series/data/repositories/series_popularity_repository.dart';

import '../../../data/models/series.dart';

part 'series_popularity_event.dart';
part 'series_popularity_state.dart';

class SeriesPopularityBloc
    extends Bloc<SeriesPopularityEvent, SeriesPopularityState> {
  final SeriesPopularityRepository repository;
  SeriesPopularityBloc({
    required this.repository,
  }) : super(SeriesPopularityLoading()) {
    on<SeriesPopularityLoad>(_onLoad);
  }

  void _onLoad(
    SeriesPopularityLoad event,
    Emitter<SeriesPopularityState> emit,
  ) async {
    emit(SeriesPopularityLoading());
    final List<Series> popularitySeriesList =
        await repository.getPopularitySeries();
    emit(SeriesPopularityLoaded(popularitySeriesList: popularitySeriesList));
  }
}
