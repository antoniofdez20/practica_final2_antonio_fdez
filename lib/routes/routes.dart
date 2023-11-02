import 'package:flutter/material.dart';
import 'package:practica_final2_antonio_fdez/screens/home_page.dart';
import 'package:practica_final2_antonio_fdez/screens/personal_page.dart';
import 'package:practica_final2_antonio_fdez/screens/widget_page.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const HomePage(),
    'personal_page': (BuildContext context) => const PersonalPage(),
    'widget_page': (BuildContext context) => const WidgetPage()
  };
}
