import 'package:flutter/material.dart';
import 'package:ese_app_web/model/utils/Costants.dart';
import 'package:ese_app_web/model/Model.dart';
import 'package:ese_app_web/UI/pages/HomePage.dart';

void main() {
  // Istanzio il Model una volta e lo passo in giù
  final model = Model();
  runApp(MyApp(model: model));
}

class MyApp extends StatelessWidget {
  final Model model;
  const MyApp({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Costants.appName,
      theme: Costants.theme,
      home: HomePage(model: model),
      debugShowCheckedModeBanner: false,
    );
  }
}
