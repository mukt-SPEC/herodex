import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herodex/common/enums.dart';
import 'package:herodex/provider/superhero_provider.dart';
import 'package:provider/provider.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:herodex/utilities/theme/app_color.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int chipIndex = 0;
  @override
  Widget build(BuildContext context) {
    var superHeroprovider = Provider.of<SuperheroProvider>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 32, 32),
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
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
                    color: AppColor.buttonBgColor,
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
                        ...HeroUniverse.values.map(
                          (value) => ChoiceChip(
                            shape: RoundedSuperellipseBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            showCheckmark: false,
                            label: Text(
                              value.label,
                              style: TextStyle(
                                color: Color(0xff121212),
                                fontFamily:
                                    GoogleFonts.schibstedGrotesk().fontFamily,
                              ),
                            ),
                            selected:
                                chipIndex == HeroUniverse.values.indexOf(value),
                            onSelected: (selected) {
                              setState(() {
                                chipIndex = selected
                                    ? HeroUniverse.values.indexOf(value)
                                    : chipIndex;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
