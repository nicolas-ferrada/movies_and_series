import 'package:flutter/material.dart';

import '../../data/models/media.dart';

class HomePage extends StatelessWidget {
  final List<Media> mediaList;
  const HomePage({
    super.key,
    required this.mediaList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Top Rated'),
                  Text('Popularity'),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: mediaList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(mediaList[index].name),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
