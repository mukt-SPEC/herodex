import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herodex/utilities/app_images.dart';
import 'package:herodex/utilities/theme/app_theme.dart';
import 'package:herodex/views/details_page.dart';

class DetailedInfo extends StatelessWidget {
  final DetailsPage widget;
  const DetailedInfo({required this.widget, super.key});

  @override
  Widget build(BuildContext context) {
    final String publisher = widget.superHero!.biography!.publisher!;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Container(
              decoration: BoxDecoration(),
              child: Image(
                image: switch (publisher) {
                  'dccomic' => AssetImage(AppImages.dclogo),
                  'marvelcomic' => AssetImage(AppImages.marvelLogo),
                  'darkhorsecomic' => AssetImage(AppImages.darkHorseLogo),
                  (_) => AssetImage(AppImages.all),
                },
                width: 72,
                height: 72,
              ),
            ),
            Biography(widget: widget),
            // SizedBox(height: 4),
            Connections(widget: widget),
          ],
        ),
      ),
    );
  }
}

class Connections extends StatelessWidget {
  const Connections({super.key, required this.widget});

  final DetailsPage widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Connection',
          style: TextStyle(
            color: Color(0xffb9b9b9),
            fontSize: 16,
            fontFamily: GoogleFonts.schibstedGrotesk().fontFamily,
          ),
        ),

        Text(
          'Ground affliations: ${widget.superHero!.connections!.groupAffiliation!}',
          style: TextStyle(
            color: AppTheme.textPrimaryColor,
            fontSize: 24,
            fontFamily: GoogleFonts.schibstedGrotesk().fontFamily,
          ),
        ),

        Text(
          'Relatives: ${widget.superHero!.connections!.relatives!}',
          style: TextStyle(
            color: AppTheme.textPrimaryColor,
            fontSize: 24,
            fontFamily: GoogleFonts.schibstedGrotesk().fontFamily,
          ),
        ),
        SizedBox(height: 100),
      ],
    );
  }
}

class Biography extends StatelessWidget {
  const Biography({super.key, required this.widget});

  final DetailsPage widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Biography',
          style: TextStyle(
            color: Color(0xffb9b9b9),
            fontSize: 16,
            fontFamily: GoogleFonts.schibstedGrotesk().fontFamily,
          ),
        ),

        Text(
          widget.superHero!.biography!.fullName!,
          style: TextStyle(
            color: AppTheme.textPrimaryColor,
            fontSize: 24,
            fontFamily: GoogleFonts.schibstedGrotesk().fontFamily,
          ),
        ),

        Text(
          'Alter Egos: ${widget.superHero!.biography!.alterEgos!}',
          style: TextStyle(
            color: AppTheme.textPrimaryColor,
            fontSize: 24,
            fontFamily: GoogleFonts.schibstedGrotesk().fontFamily,
          ),
        ),

        Text(
          'Aliases: ${widget.superHero!.biography!.aliases!.join(', ')}',
          style: TextStyle(
            color: AppTheme.textPrimaryColor,
            fontSize: 24,
            fontFamily: GoogleFonts.schibstedGrotesk().fontFamily,
          ),
        ),
        Text(
          'Place of birth: ${widget.superHero!.biography!.placeOfBirth}',
          style: TextStyle(
            color: AppTheme.textPrimaryColor,
            fontSize: 24,
            fontFamily: GoogleFonts.schibstedGrotesk().fontFamily,
          ),
        ),
        Text(
          '1st Appearance: ${widget.superHero!.biography!.firstAppearance}',
          style: TextStyle(
            color: AppTheme.textPrimaryColor,
            fontSize: 24,
            fontFamily: GoogleFonts.schibstedGrotesk().fontFamily,
          ),
        ),
        Text(
          'Publisher: ${widget.superHero!.biography!.publisher}',
          style: TextStyle(
            color: AppTheme.textPrimaryColor,
            fontSize: 24,
            fontFamily: GoogleFonts.schibstedGrotesk().fontFamily,
          ),
        ),
        Text(
          'Alignment: ${widget.superHero!.biography!.alignment![0].toUpperCase()}${widget.superHero!.biography!.alignment!.substring(1)}',
          style: TextStyle(
            color: AppTheme.textPrimaryColor,
            fontSize: 24,
            fontFamily: GoogleFonts.schibstedGrotesk().fontFamily,
          ),
        ),
      ],
    );
  }
}
