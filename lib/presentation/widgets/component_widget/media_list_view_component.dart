import 'package:flutter/material.dart';

import '../../../data/models/media.dart';
import '../../pages/media_details_page.dart';

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
        return ListTile(
          onTap: () => navigateToMediaDetailsPage(context, index),
          title: Text(mediaList[index].name),
          subtitle: Text(mediaList[index].overview),
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
