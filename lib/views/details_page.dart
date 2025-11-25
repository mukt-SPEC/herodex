import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herodex/model/superhero.dart';
import 'package:herodex/provider/superhero_provider.dart';
import 'package:herodex/utilities/theme/app_theme.dart';
import 'package:herodex/views/stats_page.dart';
import 'package:herodex/widgets/Appearance.dart';
import 'package:herodex/widgets/appearance_container.dart';
import 'package:herodex/widgets/nav_bar.dart';
import 'package:herodex/widgets/work.dart';

import 'package:icons_plus/icons_plus.dart';

class DetailsPage extends StatefulWidget {
  final SuperHero? superHero;
  const DetailsPage({super.key, this.superHero});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Map<String, Icon> options = {
    "Profile": Icon(Iconsax.user_bold),
    "Stats": Icon(Iconsax.graph_bold),
    "Info": Icon(Iconsax.info_circle_bold),
    "Appearance": Icon(Iconsax.emoji_happy_bold),
    "Work": Icon(Iconsax.book_square_bold),
  };

  String selectedOption = 'Profile';
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.scaffoldBgColor,
      appBar: AppBar(
        foregroundColor: AppTheme.textPrimaryColor,
        backgroundColor: AppTheme.scaffoldBgColor,
        title: switch (selectedOption) {
          'Profile' => Text(
            'Personal Information',
            style: TextStyle(
              fontFamily: GoogleFonts.schibstedGrotesk().fontFamily,
              fontWeight: FontWeight.w500,
            ),
          ),
          'Stats' => Text(
            'Power Stats',
            style: TextStyle(
              fontFamily: GoogleFonts.schibstedGrotesk().fontFamily,
              fontWeight: FontWeight.w500,
            ),
          ),
          'Info' => Text(
            'Detailed Info',
            style: TextStyle(
              fontFamily: GoogleFonts.schibstedGrotesk().fontFamily,
              fontWeight: FontWeight.w500,
            ),
          ),
          'Appearance' => Text(
            'Appearance',
            style: TextStyle(
              fontFamily: GoogleFonts.schibstedGrotesk().fontFamily,
              fontWeight: FontWeight.w500,
            ),
          ),

          'Work' => Text(
            'Work',
            style: TextStyle(
              fontFamily: GoogleFonts.schibstedGrotesk().fontFamily,
              fontWeight: FontWeight.w500,
            ),
          ),
          _ => Text(
            'details',
            style: TextStyle(
              fontFamily: GoogleFonts.schibstedGrotesk().fontFamily,
              fontWeight: FontWeight.w500,
            ),
          ),
        },
        centerTitle: true,
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage(widget.superHero!.images!.xs!),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        child: switch (selectedOption) {
          'Profile' => PersonalInfo(widget: widget),
          'Stats' => StatsPage(widget: widget),
          'Info' => Container(color: Colors.yellow, height: 200, width: 200),
          'Appearance' => AppearanceSection(widget: widget),
          'Work' => WorkPage(widget: widget),
          _ => Container(),
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: 306,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppTheme.appBarColor,
            borderRadius: BorderRadius.circular(48),
          ),
          child: Row(
            children: options.entries.map((option) {
              return Theme(
                data: Theme.of(context).copyWith(
                  splashFactory: NoSplash.splashFactory,
                  highlightColor: Colors.transparent,
                ),
                child: Tooltip(
                  preferBelow: false,
                  message: option.key,
                  textStyle: TextStyle(
                    fontFamily: GoogleFonts.schibstedGrotesk().fontFamily,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 44, 44, 44).withValues(alpha: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: RawChip(
                    label: Icon(
                      option.value.icon,
                      color: selectedOption == option.key
                          ? AppTheme.scaffoldBgColor
                          : Colors.grey.shade700,
                      size: 24,
                    ),
                    selected: selectedOption == option.key,
                    tooltip: '',
                    shape: CircleBorder(
                      eccentricity: .1,
                      side: BorderSide(style: BorderStyle.none),
                    ),
                    elevation: 0,
                    showCheckmark: false,
                    selectedColor: AppTheme.buttonBgColor,
                    backgroundColor: AppTheme.appBarColor,
                    onSelected: (selected) {
                      setState(() {
                        selectedOption = option.key;
                      });
                    },
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key, required this.widget});

  final DetailsPage widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(24),
          child: Image.network(
            width: double.infinity,
            widget.superHero!.images!.lg!,
          ),
        ),
        Text(
          'Full Name',
          style: TextStyle(
            color: AppTheme.textPrimaryColor,
            fontSize: 14,
            fontFamily: GoogleFonts.schibstedGrotesk().fontFamily,
            fontWeight: FontWeight.normal,
          ),
        ),
        Text(
          widget.superHero!.biography!.fullName!,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppTheme.textPrimaryColor,
            fontSize: 20,
            fontFamily: GoogleFonts.schibstedGrotesk().fontFamily,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'Alias',
          style: TextStyle(
            color: AppTheme.textPrimaryColor,
            fontSize: 14,
            fontFamily: GoogleFonts.schibstedGrotesk().fontFamily,
            fontWeight: FontWeight.normal,
          ),
        ),
        Text(
          widget.superHero!.name!,
          style: TextStyle(
            color: AppTheme.textPrimaryColor,
            fontSize: 20,
            fontFamily: GoogleFonts.schibstedGrotesk().fontFamily,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
