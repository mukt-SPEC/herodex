import 'package:flutter/material.dart';
import 'package:herodex/provider/superhero_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var superHeroprovider = Provider.of<SuperheroProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: superHeroprovider.isloading
          ? Center(child: CircularProgressIndicator())
          : superHeroprovider.ErrorExist
          ? Center(child: Text(superHeroprovider.errorMessaqge))
          : Text('go'),
    );
  }
}
