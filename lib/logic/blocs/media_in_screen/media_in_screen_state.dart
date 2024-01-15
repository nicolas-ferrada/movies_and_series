part of 'media_in_screen_bloc.dart';

sealed class MediaInScreenState extends Equatable {
  const MediaInScreenState();

  @override
  List<Object> get props => [];
}

final class MediaInScreenLoading extends MediaInScreenState {}

final class MediaInScreenFilter extends MediaInScreenState {
  final List<Media> mediaList;
  const MediaInScreenFilter({required this.mediaList});

  @override
  List<Object> get props => [mediaList];
}

final class MediaInScreenFinalMediaList extends MediaInScreenState {
  final List<Media> mediaList;
  const MediaInScreenFinalMediaList({required this.mediaList});

  @override
  List<Object> get props => [mediaList];
}

final class MediaInScreenError extends MediaInScreenState {
  final String errorMessage;
  const MediaInScreenError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
