import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/series.dart';
import '../../../data/repositories/series_rating_repository.dart';

part 'series_rating_event.dart';
part 'series_rating_state.dart';

class SeriesRatingBloc extends Bloc<SeriesRatingEvent, SeriesRatingState> {
  final SeriesRatingRepository repository;
  SeriesRatingBloc({
    required this.repository,
  }) : super(SeriesRatingInitial()) {
    on<SeriesRatingLoad>(_onLoad);
  }

  void _onLoad(
    SeriesRatingLoad event,
    Emitter<SeriesRatingState> emit,
  ) async {
    emit(SeriesRatingLoading());
    final List<Series> ratingSeriesList = await repository.getRatingSeries();
    emit(SeriesRatingLoaded(ratingSeriesList: ratingSeriesList));
  }
}
