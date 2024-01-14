import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies_and_series/logic/blocs/category_filter_bloc/category_filter_bloc.dart';
import 'package:movies_and_series/utils/enums/category_filter_enum.dart';

void main() {
  group('Category Filter Bloc', () {
    late CategoryFilterBloc bloc;

    setUp(() {
      bloc = CategoryFilterBloc();
    });

    tearDown(() {
      bloc.close();
    });

    group('Bloc initialization', () {
      test('Initial state is CategoryFilterByRating', () {
        expect(bloc.state, CategoryFilterByRating());
      });
    });

    group('Bloc events change state (bloc_test)', () {
      blocTest(
        'ChangeFilterCategory event change state to FilterByRating',
        build: () => CategoryFilterBloc(),
        act: (bloc) => bloc.add(
          const CategoryFilterChangeFilterCategory(
            categoryFilter: CategoryFilter.rating,
          ),
        ),
        expect: () => [CategoryFilterByRating()],
      );

      blocTest(
        'ChangeFilterCategory event change state to FilterByPopularity',
        build: () => CategoryFilterBloc(),
        act: (bloc) => bloc.add(
          const CategoryFilterChangeFilterCategory(
            categoryFilter: CategoryFilter.popularity,
          ),
        ),
        expect: () => [CategoryFilterByPopularity()],
      );
    });

    group('Bloc events (flutter_test)', () {
      test('Changing states do not throw exceptions', () {
        const event = CategoryFilterChangeFilterCategory(
          categoryFilter: CategoryFilter.rating,
        );
        bloc.add(event);
        expect(() => bloc.add(event), returnsNormally);
      });

      test('Bloc can handle multiple events, ignoring repeated events', () {
        const event = CategoryFilterChangeFilterCategory(
          categoryFilter: CategoryFilter.rating,
        );
        const event2 = CategoryFilterChangeFilterCategory(
          categoryFilter: CategoryFilter.popularity,
        );
        bloc.add(event);
        bloc.add(event);
        bloc.add(event2);
        bloc.add(event2);
        bloc.add(event);
        bloc.add(event);
        expectLater(
            bloc.stream,
            emitsInOrder([
              CategoryFilterByRating(),
              CategoryFilterByPopularity(),
              CategoryFilterByRating(),
            ]));
      });
    });
  });
}
