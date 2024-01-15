import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/media.dart';

part 'media_in_screen_event.dart';
part 'media_in_screen_state.dart';

class MediaInScreenBloc extends Bloc<MediaInScreenEvent, MediaInScreenState> {
  MediaInScreenBloc() : super(MediaInScreenLoading()) {
    on<MediaInScreenUpdateMediaList>(_updateMediaList);
  }

  void _updateMediaList(
    MediaInScreenUpdateMediaList event,
    Emitter<MediaInScreenState> emit,
  ) {
    try {
      emit(MediaInScreenLoading());
      emit(MediaInScreenMediaList(mediaList: event.mediaList));
    } catch (e) {
      emit(MediaInScreenError(errorMessage: e.toString()));
    }
  }
}
