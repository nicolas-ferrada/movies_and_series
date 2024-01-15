import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_and_series/data/api/api.dart';

class ImageFromNetwork extends StatelessWidget {
  final String mediaUrl;
  final int mediaId;
  final double? height;
  final double? width;

  const ImageFromNetwork({
    super.key,
    required this.mediaUrl,
    required this.mediaId,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: (Api.imageBaseUrl + mediaUrl),
      height: height,
      width: width,
      fit: BoxFit.cover,
      key: Key(mediaId.toString()),
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(
          color: Colors.grey,
        ),
      ),
    );
  }
}
