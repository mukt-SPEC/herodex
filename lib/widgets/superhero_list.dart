import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:herodex/model/superhero.dart';

class SuperHeroCard extends StatelessWidget {
  final VoidCallback onTap;
  const SuperHeroCard({
    super.key,
    required this.superHero,
    required this.onTap,
  });

  final SuperHero superHero;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: Colors.transparent,
      contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
      onTap: onTap,
      leading: CircleAvatar(
        radius: 24,
        backgroundImage: NetworkImage(superHero.images!.lg!),
      ),
      title: Text(
        superHero.name!,
        style: TextStyle(
          color: Colors.white,
          fontFamily: GoogleFonts.schibstedGrotesk().fontFamily,
        ),
      ),
      subtitle: Text(superHero.biography!.publisher ?? ''),
    );
  }
}
