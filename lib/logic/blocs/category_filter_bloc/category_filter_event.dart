part of 'category_filter_bloc.dart';

sealed class CategoryFilterEvent extends Equatable {
  const CategoryFilterEvent();

  @override
  List<Object> get props => [];
}

final class CategoryFilterChangeFilterCategory extends CategoryFilterEvent {
  final CategoryFilter categoryFilter;

  const CategoryFilterChangeFilterCategory({
    required this.categoryFilter,
  });

  @override
  List<Object> get props => [categoryFilter];
}
