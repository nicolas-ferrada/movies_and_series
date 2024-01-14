import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/media.dart';
import '../../logic/blocs/category_filter_bloc/category_filter_bloc.dart';
import '../../utils/enums/category_filter_enum.dart';

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      context.read<CategoryFilterBloc>().add(
                            const CategoryFilterChangeFilterCategory(
                              categoryFilter: CategoryFilter.rating,
                            ),
                          );
                    },
                    child: const Text('Top Rated'),
                  ),
                  InkWell(
                    onTap: () {
                      context.read<CategoryFilterBloc>().add(
                            const CategoryFilterChangeFilterCategory(
                              categoryFilter: CategoryFilter.popularity,
                            ),
                          );
                    },
                    child: const Text('Popularity'),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: mediaList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(mediaList[index].name),
                      subtitle: Text(mediaList[index].overview),
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
