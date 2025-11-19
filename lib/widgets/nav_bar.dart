// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppNavBar extends StatelessWidget {
  final Map<String, Icon> options;
  final bool isSelected;
  final int selected;
  final ValueChanged onSelected;
  const AppNavBar({
    super.key,
    required this.options,
    required this.isSelected,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      currentIndex: selected,
      onTap: (index) => onSelected(index),
      items: options.entries
          .map(
            (entry) =>
                BottomNavigationBarItem(icon: entry.value, label: entry.key),
          )
          .toList(),
    );
  }
}
