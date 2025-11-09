import 'package:flutter/material.dart';

/// Costanti e stili riutilizzabili nel progetto.
/// (Mantengo il nome "Costants" come da tua richiesta)
class Costants {
  // App
  static const String appName = 'Ese App';

  // Spaziatura
  static const double padding = 16.0;
  static const double radius = 16.0;

  // Colori base
  static const Color primary = Color(0xFF1565C0);
  static const Color accent = Color(0xFF26A69A);
  static const Color bg = Color(0xFFF7F9FC);

  // Tipografia
  static const TextStyle h1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  // Ombra card
  static List<BoxShadow> cardShadow = const [
    BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4)),
  ];

  // Tema (facoltativo, comodo da usare in MaterialApp)
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: primary),
    scaffoldBackgroundColor: bg,
    appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
  );
}
