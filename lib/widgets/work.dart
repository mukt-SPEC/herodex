// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:herodex/views/details_page.dart';

class WorkPage extends StatelessWidget {
  final DetailsPage widget;
  const WorkPage({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Occupations',
              style: TextStyle(
                color: Color(0xffb9b9b9),
                fontFamily: GoogleFonts.schibstedGrotesk().fontFamily,
                fontSize: 18,
              ),
            ),

            Text(
              widget.superHero!.work!.occupation!,
              style: TextStyle(
                color: Colors.white,
                fontFamily: GoogleFonts.schibstedGrotesk().fontFamily,
                fontSize: 28,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Base',
              style: TextStyle(
                color: Color(0xffb9b9b9),
                fontFamily: GoogleFonts.schibstedGrotesk().fontFamily,
                fontSize: 18,
              ),
            ),
            Text(
              widget.superHero!.work!.base!,
              style: TextStyle(
                color: Colors.white,
                fontFamily: GoogleFonts.schibstedGrotesk().fontFamily,
                fontSize: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
