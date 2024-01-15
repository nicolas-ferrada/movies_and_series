import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_and_series/presentation/pages/home_page.dart';

import '../../data/models/media.dart';
import '../../logic/blocs/media_in_screen/media_in_screen_bloc.dart';
import '../widgets/reusable_widgets/basic_scaffold.dart';

class MediaBuilder extends StatelessWidget {
  final List<Media> mediaList;
  const MediaBuilder({
    super.key,
    required this.mediaList,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaInScreenBloc, MediaInScreenState>(
      builder: (context, state) {
        // Add the mediaList to the MediaInScreenBloc
        context
            .read<MediaInScreenBloc>()
            .add(MediaInScreenUpdateMediaList(mediaList: mediaList));

        if (state is MediaInScreenError) {
          return BasicScaffoldCenter(
            Text('Error: ${(state).errorMessage}'),
          );
        } else if (state is MediaInScreenMediaList) {
          return HomePage(
            mediaList: (state).mediaList,
          );
        } else {
          return const BasicScaffoldCenter(
              Text('An unexpected error occured displaying the media'));
        }
      },
    );
  }
}
