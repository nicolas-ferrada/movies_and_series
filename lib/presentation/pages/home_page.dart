import 'package:flutter/material.dart';
import 'package:movies_and_series/presentation/widgets/component_widget/category_filter_buttons_component.dart';
import 'package:movies_and_series/presentation/widgets/component_widget/search_bar_component.dart';

import '../../data/models/media.dart';
import '../widgets/component_widget/media_list_view_component.dart';

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
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: SearchBarComponent(),
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: CategoryFilterButtonsComponent(),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: MediaListViewComponent(mediaList: mediaList),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
