import 'package:flutter/material.dart';

import '../../data/models/media.dart';
import '../widgets/component_widget/app_bar_media_details_component.dart';
import '../widgets/reusable_widgets/media_image.dart';

class MediaDetailsPage extends StatelessWidget {
  final Media media;
  const MediaDetailsPage({
    super.key,
    required this.media,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMediaDetailsComponent(mediaName: media.name),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  mediaImageCover(),
                  releaseDate(),
                  rating(),
                  popularity(),
                  overview(),
                  mediaImageBackdrop(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget mediaImageBackdrop() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MediaImage(
        mediaUrl: media.backdropPath,
        mediaId: media.id,
        width: 300,
      ),
    );
  }

  Widget overview() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        media.overview,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget popularity() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        'Popularity: ${media.popularity}',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget rating() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        'Rating: ${media.rating} (${media.rateCount} votes)',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget releaseDate() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        'Release date: ${media.releaseDate}',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget mediaImageCover() {
    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 8),
      child: Hero(
        tag: media.id,
        child: MediaImage(
          mediaUrl: media.posterPath,
          mediaId: media.id,
          height: 300,
        ),
      ),
    );
  }
}
