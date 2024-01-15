import 'package:flutter/material.dart';

import 'image_from_network.dart';

class MediaImage extends StatelessWidget {
  final String mediaUrl;
  final int mediaId;
  final double? height;
  final double? width;
  const MediaImage({
    super.key,
    required this.mediaUrl,
    required this.mediaId,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: ImageFromNetwork(
          mediaUrl: mediaUrl,
          mediaId: mediaId,
          height: height,
          width: width,
        ),
      ),
    );
  }
}
