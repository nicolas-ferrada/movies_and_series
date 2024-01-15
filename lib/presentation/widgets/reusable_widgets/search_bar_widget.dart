import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final Function(String) onChanged;
  const SearchBarWidget({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      padding: const MaterialStatePropertyAll<EdgeInsets>(
        EdgeInsets.symmetric(horizontal: 16),
      ),
      elevation: const MaterialStatePropertyAll<double>(1),
      leading: const Icon(Icons.search),
      hintText: 'Search here...',
      onChanged: onChanged,
    );
  }
}
