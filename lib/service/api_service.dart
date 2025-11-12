import 'dart:convert';

import 'package:http/http.dart';
import 'package:herodex/model/superhero.dart';

const uri = "https://akabab.github.io/superhero-api/api/all.json";

class ApiService {
  static Future<List<SuperHero>> fetchSuperheroes() async {
    Response response = await get(Uri.parse(uri));

    if (response.statusCode == 200) {
      List<dynamic> json = jsonDecode(response.body);
      List<SuperHero> superheroes = json
          .map((hero) => SuperHero.fromJson(hero))
          .toList();
      return superheroes;
    } else {
      throw Exception('Failed to load superheroes');
    }
  }
}
