import 'package:flutter/material.dart';

import '../../data/api/api.dart';
import '../../data/models/media.dart';

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
                  child: Image.network(
                    Api.imageBaseUrlMediumSize + media.posterPath,
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
                  child: Image.network(
                    Api.imageBaseUrlBigSize + media.backdropPath,
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
