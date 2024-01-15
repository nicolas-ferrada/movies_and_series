import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_and_series/presentation/widgets/reusable_widgets/filter_by_category_button.dart';
import 'package:movies_and_series/utils/enums/category_filter_enum.dart';

import '../../../logic/blocs/category_filter_bloc/category_filter_bloc.dart';

class CategoryFilterButtonsComponent extends StatelessWidget {
  const CategoryFilterButtonsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FilterByCategoryButton(
          onTap: () => filterByRating(context),
          name: 'Rating',
          isSelected: isSelected(CategoryFilter.rating, context),
        ),
        FilterByCategoryButton(
          onTap: () => filterByPopularity(context),
          name: 'Popularity',
          isSelected: isSelected(CategoryFilter.popularity, context),
        ),
      ],
    );
  }

  void filterByRating(BuildContext context) {
    context.read<CategoryFilterBloc>().add(
          const CategoryFilterChangeFilterCategory(
            categoryFilter: CategoryFilter.rating,
          ),
        );
  }

  void filterByPopularity(BuildContext context) {
    context.read<CategoryFilterBloc>().add(
          const CategoryFilterChangeFilterCategory(
            categoryFilter: CategoryFilter.popularity,
          ),
        );
  }

  bool isSelected(CategoryFilter categoryFilter, BuildContext context) {
    final currentState = context.watch<CategoryFilterBloc>().state;

    if (currentState is CategoryFilterByRating) {
      return (categoryFilter == CategoryFilter.rating);
    } else if (currentState is CategoryFilterByPopularity) {
      return (categoryFilter == CategoryFilter.popularity);
    } else {
      return false;
    }
  }
}
