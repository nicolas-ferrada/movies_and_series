import 'package:flutter/material.dart';

class FilterByCategoryButton extends StatelessWidget {
  final void Function() onTap;
  final String name;
  final bool isSelected;
  const FilterByCategoryButton({
    super.key,
    required this.onTap,
    required this.name,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          color: isSelected ? Colors.grey : null,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(8),
        child: Text(
          name,
          style: TextStyle(
            color: isSelected ? Colors.black : null,
            fontWeight: isSelected ? FontWeight.bold : null,
          ),
        ),
      ),
    );
  }
}
