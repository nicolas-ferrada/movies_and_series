import 'package:flutter/material.dart';

import '../../data/models/media.dart';
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
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          media.name,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: media.id,
                  child: MediaImage(
                    mediaUrl: media.posterPath,
                    mediaId: media.id,
                    height: 300,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    media.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text('Release date: ${media.releaseDate}'),
                Text('Rating: ${media.rating} (${media.rateCount} votes)'),
                Text('Popularity: ${media.popularity}'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    media.overview,
                    textAlign: TextAlign.justify,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MediaImage(
                    mediaUrl: media.backdropPath,
                    mediaId: media.id,
                    width: 300,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
