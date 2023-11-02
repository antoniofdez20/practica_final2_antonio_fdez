import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:practica_final2_antonio_fdez/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //sirve para poder usar el calendario en el input de la fecha de nacimiento
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Pràctica Final U2',
      initialRoute: '/',
      routes: getRoutes(),
    );
  }
}
