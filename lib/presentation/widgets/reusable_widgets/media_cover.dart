import 'package:flutter/material.dart';
import 'package:movies_and_series/data/models/media.dart';

import '../../../data/api/api.dart';

class MediaCover extends StatelessWidget {
  final Media media;
  const MediaCover({
    super.key,
    required this.media,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(Api.imageBaseUrl + media.posterPath),
          Text(
            media.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('Release date: ${media.releaseDate}'),
          Text('Rating: ${media.rating} (${media.rateCount} votes)'),
          Text('Popularity: ${media.popularity}'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              media.overview,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
