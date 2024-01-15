import 'package:flutter/material.dart';

import '../../../data/models/media.dart';
import '../../pages/media_details_page.dart';
import '../reusable_widgets/media_image.dart';

class MediaListViewComponent extends StatelessWidget {
  final List<Media> mediaList;
  const MediaListViewComponent({
    super.key,
    required this.mediaList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mediaList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => navigateToMediaDetailsPage(context, index),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Hero(
              tag: mediaList[index].id,
              child: MediaImage(
                mediaUrl: mediaList[index].posterPath,
                mediaId: mediaList[index].id,
                height: 400,
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> navigateToMediaDetailsPage(
    BuildContext context,
    int index,
  ) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MediaDetailsPage(media: mediaList[index]),
      ),
    );
  }
}
