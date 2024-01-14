import 'package:flutter/material.dart';

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
      body: SafeArea(
        child: Text(media.name),
      ),
    );
  }
}
