// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:herodex/views/details_page.dart';
import 'package:herodex/widgets/appearance_container.dart';
import 'package:icons_plus/icons_plus.dart';

class StatsPage extends StatelessWidget {
  final DetailsPage widget;
  const StatsPage({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
        child: Column(
          spacing: 16,
          children: [
            Row(
              spacing: 16,
              children: [
                Expanded(
                  child: AppearanceContainer(
                    title: 'Combat',
                    value: widget.superHero!.powerstats!.combat!.toString(),
                    icon: FontAwesome.person_harassing_solid,
                  ),
                ),
                Expanded(
                  child: AppearanceContainer(
                    title: 'Durability',
                    value: widget.superHero!.powerstats!.durability!.toString(),
                    icon: FontAwesome.shield_solid,
                  ),
                ),
              ],
            ),
            Row(
              spacing: 16,
              children: [
                Expanded(
                  child: AppearanceContainer(
                    title: 'Intelligence',
                    value: widget.superHero!.powerstats!.intelligence
                        .toString(),
                    icon: FontAwesome.brain_solid,
                  ),
                ),
                Expanded(
                  child: AppearanceContainer(
                    title: 'Power',
                    value: widget.superHero!.powerstats!.power!.toString(),
                    icon: FontAwesome.bolt_lightning_solid,
                  ),
                ),
              ],
            ),
            Row(
              spacing: 16,
              children: [
                Expanded(
                  child: AppearanceContainer(
                    title: 'Speed',
                    value: widget.superHero!.powerstats!.speed!.toString(),
                    icon: FontAwesome.person_running_solid,
                  ),
                ),
                Expanded(
                  child: AppearanceContainer(
                    title: 'Strength',
                    value: widget.superHero!.powerstats!.strength!.toString(),
                    icon: FontAwesome.dumbbell_solid,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
