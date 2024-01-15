import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/media.dart';

part 'media_in_screen_event.dart';
part 'media_in_screen_state.dart';

class MediaInScreenBloc extends Bloc<MediaInScreenEvent, MediaInScreenState> {
  List<Media> originalMediaList = [];
  MediaInScreenBloc() : super(MediaInScreenLoading()) {
    on<MediaInScreenSetMediaList>(_setMediaList);
    on<MediaInScreenFilterMediaList>(_filterMediaList);
  }

  void _setMediaList(
    MediaInScreenSetMediaList event,
    Emitter<MediaInScreenState> emit,
  ) {
    try {
      emit(MediaInScreenLoading());
      emit(MediaInScreenFinalMediaList(mediaList: event.mediaList));
    } catch (e) {
      emit(MediaInScreenError(errorMessage: e.toString()));
    }
  }

  void _filterMediaList(
    MediaInScreenFilterMediaList event,
    Emitter<MediaInScreenState> emit,
  ) {
    try {
      final currentState = state;

      if (currentState is MediaInScreenFinalMediaList) {
        originalMediaList = currentState.mediaList;
      }

      List<Media> filteredMediaList = (originalMediaList).where((media) {
        final mediaName = media.name.toLowerCase();
        final input = event.input.toLowerCase();
        return mediaName.contains(input);
      }).toList();

      if (event.input.isNotEmpty) {
        emit(MediaInScreenFilter(mediaList: filteredMediaList));
      } else {
        emit(MediaInScreenFinalMediaList(mediaList: originalMediaList));
      }
    } catch (e) {
      emit(MediaInScreenError(errorMessage: e.toString()));
    }
  }
}
