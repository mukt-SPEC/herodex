import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herodex/common/enums.dart';
import 'package:herodex/provider/superhero_provider.dart';
import 'package:herodex/utilities/app_images.dart';
import 'package:provider/provider.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:herodex/utilities/theme/app_theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int chipIndex = 0;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    var superHeroprovider = Provider.of<SuperheroProvider>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 32, 32),
      appBar: AppBar(
        backgroundColor: AppTheme.appBarColor,
        title: Text(
          'Herodex',
          style: TextStyle(
            color: Color(0xffffffff),
            fontFamily: GoogleFonts.spaceGrotesk().fontFamily,
          ),
        ),
      ),

      body: superHeroprovider.isloading
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
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
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
                            selectedColor: Colors.blue,
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            elevation: 0,

                            avatar: Image(
                              image: switch (value) {
                                HeroUniverse.all => AssetImage(AppImages.all),
                                HeroUniverse.dc => AssetImage(AppImages.dclogo),

                                HeroUniverse.marvel => AssetImage(
                                  AppImages.marvelLogo,
                                ),
                                HeroUniverse.darkHorse => AssetImage(
                                  AppImages.darkHorseLogo,
                                ),
                              },
                              width: 24,
                              height: 24,
                              fit: BoxFit.fill,
                            ),
                            label: Text(
                              value.label,
                              style: TextStyle(
                                color: Color(0xff121212),
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
                            },
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
