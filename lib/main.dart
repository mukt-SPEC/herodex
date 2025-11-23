import 'package:flutter/material.dart';
import 'package:herodex/provider/superhero_provider.dart';
import 'package:herodex/views/home.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => SuperheroProvider())],
        child: Home(),
      ),
    );
  }
}
