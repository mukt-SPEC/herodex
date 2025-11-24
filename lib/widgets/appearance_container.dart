import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herodex/utilities/theme/app_theme.dart';

class AppearanceContainer extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  const AppearanceContainer({
    required this.title,
    required this.value,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Material(
        color: AppTheme.appBarColor,
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: Colors.white),
              Text(
                title,
                style: TextStyle(
                  color: Color(0xffb9b9b9),
                  fontSize: 14,
                  fontFamily: GoogleFonts.schibstedGrotesk().fontFamily,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  color: AppTheme.textPrimaryColor,
                  fontSize: 28,
                  fontFamily: GoogleFonts.schibstedGrotesk().fontFamily,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
