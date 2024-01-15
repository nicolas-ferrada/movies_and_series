part of 'media_in_screen_bloc.dart';

sealed class MediaInScreenEvent extends Equatable {
  const MediaInScreenEvent();

  @override
  List<Object> get props => [];
}

final class MediaInScreenUpdateMediaList extends MediaInScreenEvent {
  final List<Media> mediaList;
  const MediaInScreenUpdateMediaList({required this.mediaList});

  @override
  List<Object> get props => [mediaList];
}
