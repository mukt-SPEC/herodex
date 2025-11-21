import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herodex/model/superhero.dart';
import 'package:herodex/utilities/theme/app_theme.dart';
import 'package:herodex/views/details_page.dart';

class SearchHeroPage extends SearchDelegate<SuperHero> {
  final List<SuperHero> data;

  SearchHeroPage(this.data);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, query as SuperHero);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = data
        .where(
          (element) =>
              element.name!.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index].name!),
          onTap: () {
            close(context, results[index]);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return DetailsPage(superHero: results[index]);
                },
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = data
        .where(
          (element) =>
              element.name!.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index].name!),
          onTap: () {
            query = suggestions[index].name!;
            showResults(context);
          },
        );
      },
    );
  }

  @override
  String get searchFieldLabel => 'Search Superheroes';

  @override
  TextStyle? get searchFieldStyle => TextStyle(
    fontSize: 14,
    fontFamily: GoogleFonts.schibstedGrotesk().fontFamily,
    color: Colors.white,
  );

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      hintColor: Colors.white,
      appBarTheme: AppBarTheme(backgroundColor: AppTheme.appBarColor),
    );
  }

  @override
  InputDecorationTheme? get searchFieldDecorationTheme => InputDecorationTheme(
    helperStyle: TextStyle(color: Colors.white),
    labelStyle: TextStyle(color: Colors.white),
    fillColor: Colors.white,
    focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
    outlineBorder: BorderSide.none,
    hintStyle: TextStyle(color: Colors.white),
  );
}
