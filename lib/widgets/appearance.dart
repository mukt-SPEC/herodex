// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:herodex/views/details_page.dart';
import 'package:herodex/widgets/appearance_container.dart';
import 'package:icons_plus/icons_plus.dart';

class AppearanceSection extends StatelessWidget {
  final DetailsPage widget;
  const AppearanceSection({super.key, required this.widget});

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
                    title: 'Height',
                    value: widget.superHero!.appearance!.height![0],
                    icon: Iconsax.ruler_bold,
                  ),
                ),
                Expanded(
                  child: AppearanceContainer(
                    title: 'Weight',
                    value: widget.superHero!.appearance!.weight![0],
                    icon: Iconsax.weight_1_bold,
                  ),
                ),
              ],
            ),
            Row(
              spacing: 16,
              children: [
                Expanded(
                  child: AppearanceContainer(
                    title: 'Gender',
                    value: widget.superHero!.appearance!.gender!,
                    icon: Iconsax.profile_2user_bold,
                  ),
                ),
                Expanded(
                  child: AppearanceContainer(
                    title: 'Race',
                    value: widget.superHero!.appearance!.race!,
                    icon: Iconsax.emoji_normal_bold,
                  ),
                ),
              ],
            ),
            Row(
              spacing: 16,
              children: [
                Expanded(
                  child: AppearanceContainer(
                    title: 'Eye Color',
                    value: widget.superHero!.appearance!.eyeColor!,
                    icon: Iconsax.color_swatch_bold,
                  ),
                ),
                Expanded(
                  child: AppearanceContainer(
                    title: 'Hair Color',
                    value: widget.superHero!.appearance!.hairColor!,
                    icon: Iconsax.colors_square_bold,
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
