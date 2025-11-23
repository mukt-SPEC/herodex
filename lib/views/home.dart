import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herodex/common/enums.dart';
import 'package:herodex/provider/superhero_provider.dart';
import 'package:herodex/utilities/app_images.dart';
import 'package:herodex/views/details_page.dart';
import 'package:herodex/views/search_page.dart';

import 'package:herodex/widgets/superhero_list.dart';
import 'package:provider/provider.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:herodex/utilities/theme/app_theme.dart';

import '../utilities/segmented_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> segments = ['male', 'female'];
  String selectedSegment = 'male';
  int chipIndex = 0;
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SuperheroProvider>().fetchSuperheroes();
    });
  }

  @override
  Widget build(BuildContext context) {
    var superHeroprovider = Provider.of<SuperheroProvider>(context);
    return Scaffold(
      backgroundColor: AppTheme.scaffoldBgColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: AppTheme.scaffoldBgColor,
        title: Text(
          'Herodex',
          style: TextStyle(
            color: AppTheme.textPrimaryColor,
            fontFamily: GoogleFonts.schibstedGrotesk().fontFamily,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final result = await showSearch(
                context: context,
                delegate: SearchHeroPage(superHeroprovider.superheroes!),
              );
            },
            icon: Icon(
              Iconsax.search_normal_1_outline,
              color: AppTheme.textPrimaryColor,
            ),
          ),
          SizedBox(width: 8),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: superHeroprovider.isloading
            ? Center(child: CircularProgressIndicator())
            : !superHeroprovider.errorExist
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesome.binoculars_solid,
                      size: 100,
                      color: AppTheme.buttonBgColor,
                    ),
                    Text(
                      superHeroprovider.errorMessaqge ?? "",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: Row(
                        spacing: 12,
                        children: [
                          ...HeroUniverse.values.map((value) {
                            isSelected =
                                chipIndex == HeroUniverse.values.indexOf(value);
                            return ChoiceChip(
                              shape: RoundedSuperellipseBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              showCheckmark: false,
                              surfaceTintColor: Colors.transparent,
                              selectedColor: AppTheme.buttonBgColor,
                              backgroundColor: AppTheme.scaffoldBgColor,
                              shadowColor: Colors.transparent,
                              elevation: 0,
                              side: BorderSide(style: BorderStyle.none),
                              pressElevation: 0,

                              // avatar: CircleAvatar(
                              //   radius: 24,
                              //   child: Image(
                              //     image: switch (value) {
                              //       HeroUniverse.all => AssetImage(
                              //         AppImages.all,
                              //       ),
                              //       HeroUniverse.dc => AssetImage(
                              //         AppImages.dclogo,
                              //       ),

                              //       HeroUniverse.marvel => AssetImage(
                              //         AppImages.marvelLogo,
                              //       ),
                              //       HeroUniverse.darkHorse => AssetImage(
                              //         AppImages.darkHorseLogo,
                              //       ),
                              //     },
                              //     width: 24,
                              //     height: 24,
                              //     fit: BoxFit.fill,
                              //   ),
                              // ),
                              label: Text(
                                value.label,
                                style: TextStyle(
                                  color: isSelected
                                      ? AppTheme.buttonTextColor
                                      : AppTheme.secondaryButtonTextColor,
                                  fontFamily:
                                      GoogleFonts.schibstedGrotesk().fontFamily,
                                ),
                              ),

                              selected: isSelected,
                              onSelected: (selected) {
                                setState(() {
                                  chipIndex = selected
                                      ? HeroUniverse.values.indexOf(value)
                                      : chipIndex;
                                });
                                switch (HeroUniverse.values.indexOf(value)) {
                                  case 0:
                                    superHeroprovider.sort(
                                      superHeroprovider.superheroes!,
                                    );
                                  case 1:
                                    superHeroprovider.sort(
                                      superHeroprovider.superheroes!
                                          .where(
                                            (hero) =>
                                                hero.biography!.publisher ==
                                                'DC Comics',
                                          )
                                          .toList(),
                                    );
                                  case 2:
                                    superHeroprovider.sort(
                                      superHeroprovider.superheroes!
                                          .where(
                                            (hero) =>
                                                hero.biography!.publisher ==
                                                'Marvel Comics',
                                          )
                                          .toList(),
                                    );
                                  case 3:
                                    superHeroprovider.sort(
                                      superHeroprovider.superheroes!
                                          .where(
                                            (hero) =>
                                                hero.biography!.publisher ==
                                                'Dark Horse Comics',
                                          )
                                          .toList(),
                                    );
                                }
                              },
                            );
                          }),
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    child: superHeroprovider.filteredSuperheroes!.isEmpty
                        ? Center(
                            child: Column(
                              spacing: 8,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'No heroes found',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: GoogleFonts.schibstedGrotesk()
                                        .fontFamily,
                                    fontSize: 16,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    superHeroprovider.fetchSuperheroes();
                                  },
                                  child: Text(
                                    'Retry',
                                    style: TextStyle(
                                      color: AppTheme.buttonTextColor,
                                      fontFamily: GoogleFonts.schibstedGrotesk()
                                          .fontFamily,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            itemCount:
                                superHeroprovider.filteredSuperheroes!.length,
                            itemBuilder: (context, index) {
                              return SuperHeroCard(
                                superHero: superHeroprovider
                                    .filteredSuperheroes![index],
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return DetailsPage(
                                          superHero: superHeroprovider
                                              .filteredSuperheroes![index],
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                  ),
                ],
              ),
      ),
    );
  }
}
