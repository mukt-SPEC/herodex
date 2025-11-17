import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herodex/model/superhero.dart';
import 'package:herodex/utilities/theme/app_theme.dart';

class DetailsPage extends StatefulWidget {
  final SuperHero? superHero;
  const DetailsPage({super.key, this.superHero});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.scaffoldBgColor,
      appBar: AppBar(
        foregroundColor: AppTheme.textPrimaryColor,
        backgroundColor: AppTheme.scaffoldBgColor,
        title: Text(
          widget.superHero!.name!,
          style: TextStyle(
            fontFamily: GoogleFonts.schibstedGrotesk().fontFamily,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(24),
              child: Image.network(
                width: double.infinity,
                widget.superHero!.images!.lg!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
