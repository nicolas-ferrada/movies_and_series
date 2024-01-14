import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_and_series/logic/blocs/category_filter_bloc/category_filter_bloc.dart';
import 'package:movies_and_series/presentation/widgets/pages_builder/filter_by_popularity_builder.dart';
import 'package:movies_and_series/presentation/widgets/pages_builder/filter_by_rating_builder.dart';

class HomePageBuilder extends StatelessWidget {
  const HomePageBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryFilterBloc, CategoryFilterState>(
      builder: (context, state) {
        if (state is CategoryFilterByRating) {
          return const FilterByRatingBuilder();
        } else if (state is CategoryFilterByPopularity) {
          return const FilterByPopularityBuilder();
        } else {
          return const FilterByRatingBuilder();
        }
      },
    );
  }
}
