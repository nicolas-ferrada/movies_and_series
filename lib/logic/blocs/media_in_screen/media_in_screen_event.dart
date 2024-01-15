part of 'media_in_screen_bloc.dart';

sealed class MediaInScreenEvent extends Equatable {
  const MediaInScreenEvent();

  @override
  List<Object> get props => [];
}

final class MediaInScreenSetMediaList extends MediaInScreenEvent {
  final List<Media> mediaList;
  const MediaInScreenSetMediaList({required this.mediaList});

  @override
  List<Object> get props => [mediaList];
}

final class MediaInScreenFilterMediaList extends MediaInScreenEvent {
  final String input;
  const MediaInScreenFilterMediaList({required this.input});

  @override
  List<Object> get props => [input];
}
