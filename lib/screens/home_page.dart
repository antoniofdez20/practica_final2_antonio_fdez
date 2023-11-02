import 'package:flutter/material.dart';
import 'package:practica_final2_antonio_fdez/models/persona.dart';
import 'package:practica_final2_antonio_fdez/widgets/navigation_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Persona? _persona = ModalRoute.of(context)?.settings.arguments
        as Persona?; // como se trata de un stalesswidget no puedo usar initState()
    // entonces obtengo el objeto persona desde el método build para posteriormente poder mostrar la información del objeto persona

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('SPPMMD'),
          backgroundColor: Colors.blue.shade700,
        ),
        drawer: MyNavigationDrawer(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Center(
              child: Text('Aquesta és la pàgina principal.',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.blueAccent,
                  )),
            ),
            const SizedBox(
              height: 80.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    // Navega a personal_page y espera el objeto Persona actualizado
                    final updatedPersona = await Navigator.of(context)
                        .pushNamed(
                            'personal_page',
                            arguments: Persona(
                                nom: "Antonio",
                                cognom: "Fernández",
                                dataNaixement: "16/04/1998",
                                correu:
                                    "antoniofernandez@paucasesnovescifp.cat",
                                contrasenya: "123456admin"));

                    // Verifica si el objeto actualizado no es nulo
                    if (updatedPersona != null) {
                      // Actualiza el objeto Persona en home_page con los datos actualizados
                      // como home_page se trata de un stl widget no puedo usar un setState para actualizar su estado
                      _persona = updatedPersona as Persona;

                      // Muestra los nuevos datos en un SnackBar
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                        'Nom: ${_persona!.nom}  Cognom: ${_persona!.cognom}',
                        textAlign: TextAlign.center,
                      )));
                    }
                  },
                  icon: const Icon(Icons.person),
                  label: const Text('Personal Page'),
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(const Size(
                        160.0, 40.0)), //darle un tamaño fijo al botón
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue.shade700),
                    elevation: const MaterialStatePropertyAll<double>(
                        8.0), // Controla la elevación del boton
                    shadowColor:
                        const MaterialStatePropertyAll<Color>(Colors.grey),
                    shape: MaterialStatePropertyAll<OutlinedBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    overlayColor:
                        MaterialStateProperty.all<Color>(Colors.greenAccent),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(
                        'widget_page'); //en lugar de apilar la nueva página, directamente reemplaza una por otra
                    // teniendo el menú de navegación Drawer() me ha parecido buena práctica organizarlo de esta manera
                  },
                  icon: const Icon(Icons.widgets),
                  label: const Text('Widget Page'),
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(
                        const Size(160.0, 40.0)),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors
                        .blue
                        .shade700), //como elevated puede cambiar de color segun su estado se necesita usar MaterialStateProperty
                    elevation: const MaterialStatePropertyAll<double>(
                        8.0), // Controla la elevación del boton
                    shadowColor:
                        const MaterialStatePropertyAll<Color>(Colors.grey),
                    shape: MaterialStatePropertyAll<OutlinedBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    overlayColor: MaterialStateProperty.all<Color>(Colors
                        .greenAccent), // permite cambiar el color del boton cuando es pulsado
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
