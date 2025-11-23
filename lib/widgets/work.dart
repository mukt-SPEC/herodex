// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:herodex/views/details_page.dart';

class WorkPage extends StatelessWidget {
  final DetailsPage widget;
  const WorkPage({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            widget.superHero!.work!.occupation!,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
