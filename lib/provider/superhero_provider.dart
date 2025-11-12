import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:herodex/model/superhero.dart';
import 'package:herodex/service/api_service.dart';

class SuperheroProvider extends ChangeNotifier {
  List<SuperHero>? superheroes = [];
  List<SuperHero>? filteredSuperheroes = [];
  bool isloading = false;
  String errorMessaqge = "";

  bool get ErrorExist => errorMessaqge == "";

  void toggleLoading() {
    isloading = !isloading;
    notifyListeners();
  }

  void fetchSuperheroes() async {
    toggleLoading();
    errorMessaqge = '';
    superheroes!.clear();

    try {
      superheroes = await ApiService.fetchSuperheroes();
      filteredSuperheroes!.addAll(superheroes!);
    } on SocketException catch (_) {
      errorMessaqge = "No Internet Connection";
    }
    toggleLoading();
  }

  void filter(List<SuperHero> superheroes, String query) {
    filteredSuperheroes!.clear();
    if (query.isEmpty) {
      filteredSuperheroes!.addAll(superheroes);
    } else {
      filteredSuperheroes!.addAll(
        superheroes.where(
          (hero) => hero.name!.toLowerCase().contains(query.toLowerCase()),
        ),
      );
    }
    notifyListeners();
  }

  void sort(List<SuperHero> sortedList) {
    filteredSuperheroes!.clear();
    filteredSuperheroes = sortedList;
    notifyListeners();
  }
}
