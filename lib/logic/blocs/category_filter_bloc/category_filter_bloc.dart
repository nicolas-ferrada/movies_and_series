import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../utils/enums/category_filter_enum.dart';

part 'category_filter_event.dart';
part 'category_filter_state.dart';

class CategoryFilterBloc
    extends Bloc<CategoryFilterEvent, CategoryFilterState> {
  CategoryFilterBloc() : super(CategoryFilterByRating()) {
    on<CategoryFilterChangeFilterCategory>(_onChangeFilterCategory);
  }

  Future<void> _onChangeFilterCategory(
    CategoryFilterChangeFilterCategory event,
    Emitter<CategoryFilterState> emit,
  ) async {
    if (event.categoryFilter == CategoryFilter.rating) {
      emit(CategoryFilterByRating());
    } else if (event.categoryFilter == CategoryFilter.popular) {
      emit(CategoryFilterByPopularity());
    } else {
      emit(CategoryFilterByRating());
    }
  }
}
