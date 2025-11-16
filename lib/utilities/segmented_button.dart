// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class ToggleButton extends StatelessWidget {
  final List<String> segments;
  final String selectedSegment;
  final ValueChanged<String> onSegmentSelected;
  const ToggleButton({
    super.key,
    required this.segments,
    required this.onSegmentSelected,
    required this.selectedSegment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 40,
      decoration: BoxDecoration(
        color: Color(0xfff7f7f7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: segments.map((segment) {
          final bool isSelected = segment == selectedSegment;
          return GestureDetector(
            onTap: () => onSegmentSelected(segment),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: isSelected ? Colors.black : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                segment,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
