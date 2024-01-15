import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_and_series/logic/blocs/media_in_screen/media_in_screen_bloc.dart';
import 'package:movies_and_series/presentation/widgets/reusable_widgets/search_bar_widget.dart';

class SearchBarComponent extends StatelessWidget {
  const SearchBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBarWidget(
      onChanged: (value) => context
          .read<MediaInScreenBloc>()
          .add(MediaInScreenFilterMediaList(input: value)),
    );
  }
}
