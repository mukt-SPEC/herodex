import 'package:flutter/material.dart';
import 'package:herodex/views/details_page.dart';
import 'package:herodex/widgets/stats_container.dart';

class PowerStat extends StatelessWidget {
  final DetailsPage? widget;
  const PowerStat({this.widget, super.key});

  @override
  Widget build(BuildContext context) {
    List<String> powerstats = [
      'Intelligence',
      'Strength',
      'Speed',
      'Durability',
      'Power',
      'Combat',
    ];

    return SingleChildScrollView(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1.0,
        ),
        itemCount: powerstats.length,
        itemBuilder: (contaxt, index) {
          return StatsContainer(title: powerstats[index]);
        },
      ),
    );
  }
}
