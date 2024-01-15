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
      child: Image.network(Api.imageBaseUrlBigSize + media.posterPath),
    );
  }
}
