part of 'category_filter_bloc.dart';

sealed class CategoryFilterState extends Equatable {
  const CategoryFilterState();

  @override
  List<Object> get props => [];
}



final class CategoryFilterByRating extends CategoryFilterState {}

final class CategoryFilterByPopularity extends CategoryFilterState {}
