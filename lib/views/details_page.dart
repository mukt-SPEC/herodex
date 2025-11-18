import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herodex/model/superhero.dart';
import 'package:herodex/utilities/theme/app_theme.dart';
import 'package:icons_plus/icons_plus.dart';

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
      body: Stack(
        alignment: AlignmentGeometry.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
            child: Column(
              spacing: 16,
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(24),
                  child: Image.network(
                    width: double.infinity,
                    widget.superHero!.images!.lg!,
                  ),
                ),
                Text(
                  widget.superHero!.biography!.fullName!,
                  style: TextStyle(
                    color: AppTheme.textPrimaryColor,
                    fontSize: 24,
                    fontFamily: GoogleFonts.schibstedGrotesk().fontFamily,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 40,
            //width: MediaQuery.sizeOf(context).width - 48,
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 0,
                ),
                child: Container(
                  padding: EdgeInsets.all(8),

                  decoration: BoxDecoration(
                    color: AppTheme.appBarColor,
                    borderRadius: BorderRadius.circular(48),
                  ),
                  child: Row(
                    spacing: 8,
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppTheme.scaffoldBgColor,
                          borderRadius: BorderRadius.circular(48),
                        ),
                        child: Icon(Iconsax.user_bold, color: Colors.white),
                      ),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          // color: AppTheme.scaffoldBgColor,
                          borderRadius: BorderRadius.circular(48),
                        ),
                        child: Icon(Iconsax.graph_bold),
                      ),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          // color: AppTheme.scaffoldBgColor,
                          borderRadius: BorderRadius.circular(48),
                        ),
                        child: Icon(Iconsax.info_circle_bold),
                      ),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          //color: AppTheme.scaffoldBgColor,
                          borderRadius: BorderRadius.circular(48),
                        ),
                        child: Icon(Iconsax.emoji_normal_bold),
                      ),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          // color: AppTheme.scaffoldBgColor,
                          borderRadius: BorderRadius.circular(48),
                        ),
                        child: Icon(Iconsax.book_square_bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
