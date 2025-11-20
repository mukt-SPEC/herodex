// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class StatsContainer extends StatelessWidget {
  final String? title;
  final int? value;
  final Icon? icon;
  const StatsContainer({super.key, this.title, this.value, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.grey[200],
      child: Column(
        children: [
          icon!,
          SizedBox(height: 8),
          Text(
            title!,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 4),
          Text(
            value != null ? value.toString() : 'N/A',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
