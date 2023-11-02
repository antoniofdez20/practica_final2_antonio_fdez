import 'package:flutter/material.dart';
import 'package:practica_final2_antonio_fdez/models/persona.dart';

class MyNavigationDrawer extends StatelessWidget {
  MyNavigationDrawer({super.key});

  // inicializar un objeto persona sin valores para cuando accedemos a personal page usando el navigation drawer
  final _persona = Persona(
      nom: "", cognom: "", dataNaixement: "", correu: "", contrasenya: "");

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
      );

  Widget buildMenuItems(BuildContext context) => Column(
        children: [
          ListTile(
            leading: const Icon(Icons.home_filled),
            title: const Text('Home Page'),
            onTap: () => Navigator.of(context).pushReplacementNamed('/'),
            // con el drawer uso pushReplacement para moverse entre pantallas para no generar una pila infinita de pantallas
          ),
          const Divider(color: Colors.black),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Personal Page'),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed('personal_page', arguments: _persona),
          ),
          const Divider(color: Colors.black),
          ListTile(
            leading: const Icon(Icons.widgets),
            title: const Text('Widget Page'),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed('widget_page'),
          )
        ],
      );
}
