part of 'media_in_screen_bloc.dart';

sealed class MediaInScreenState extends Equatable {
  const MediaInScreenState();

  @override
  List<Object> get props => [];
}

final class MediaInScreenLoading extends MediaInScreenState {}

final class MediaInScreenMediaList extends MediaInScreenState {
  final List<Media> mediaList;
  const MediaInScreenMediaList({required this.mediaList});

  @override
  List<Object> get props => [mediaList];
}

final class MediaInScreenError extends MediaInScreenState {
  final String errorMessage;
  const MediaInScreenError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
