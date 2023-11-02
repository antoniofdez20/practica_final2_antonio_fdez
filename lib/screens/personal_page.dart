import 'package:flutter/material.dart';
import 'package:practica_final2_antonio_fdez/models/persona.dart';
import 'package:practica_final2_antonio_fdez/widgets/navigation_drawer.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({super.key});

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  Persona? _persona;
  TextEditingController? _inputFieldDataController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _persona = ModalRoute.of(context)?.settings.arguments
        as Persona; // obtener el objeto persona
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Fernández'),
          backgroundColor: Colors.blue.shade700,
        ),
        drawer: MyNavigationDrawer(),
        //al abrir el teclado me desbordaba de este modo permite abrir el teclado sin problema
        // singlechildScrollView permite que el contenido que desborda sea scrollable
        body: SingleChildScrollView(
          child: Column(
            // de esta forma ocupara el minimo espacio necesario
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListView(
                  shrinkWrap:
                      true, //de esta forma me ocupara el espacio disponible del column
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 20.0),
                  children: [
                    _crearNom(),
                    const Divider(),
                    _crearCognom(),
                    const Divider(),
                    _crearDataNaixement(context),
                    const Divider(),
                    _crearCorreu(),
                    const Divider(),
                    _crearContrasenya(),
                  ]),
              ElevatedButton.icon(
                onPressed: () {
                  // en primer lugar comprobamos si se puede realizar un pop
                  // en caso que no se pueda realizaremos un pushReplacement para volver al home_page
                  if (Navigator.of(context).canPop()) {
                    Navigator.pop(context, _persona);
                  } else {
                    Navigator.of(context).pushReplacementNamed('/');
                  }
                },
                icon: const Icon(Icons.save_alt),
                label: const Text('Desa'),
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(
                      const Size(100.0, 40.0)), //darle un tamaño fijo al botón
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue.shade700),
                  elevation: const MaterialStatePropertyAll<double>(
                      8.0), // Controla la elevación del boton
                  shadowColor:
                      const MaterialStatePropertyAll<Color>(Colors.grey),
                  shape: MaterialStatePropertyAll<OutlinedBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _crearNom() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      autofocus: true,
      decoration: InputDecoration(
          hintText: _persona!.nom,
          labelText: "Nom",
          //helperText: 'Posi el nom complet',
          suffixIcon: const Icon(Icons.person),
          icon: const Icon(Icons.account_circle),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      onChanged: (valor) {
        setState(() {
          _persona!.nom = valor;
        });
      },
    );
  }

  Widget _crearCognom() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          hintText: _persona!.cognom,
          labelText: "Cognom",
          //helperText: 'Posi el teu primer cognom',
          suffixIcon: const Icon(Icons.family_restroom),
          icon: const Icon(Icons.account_circle),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      onChanged: (valor) {
        setState(() {
          _persona!.cognom = valor;
        });
      },
    );
  }

  Widget _crearDataNaixement(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDataController,
      decoration: InputDecoration(
          // lo pongo de esta forma si no, no se visualizaba en ningún momento la fecha de la persona iniciada
          hintText: _persona!.dataNaixement,
          //labelText: "Data naixement",
          helperText: 'Posi la teva data de naixement',
          suffixIcon: const Icon(Icons.perm_contact_calendar),
          icon: const Icon(Icons.calendar_today),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _seleccionaData(context);
      },
    );
  }

  void _seleccionaData(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        locale: const Locale('es', 'ES'),
        initialDate: DateTime.now(),
        firstDate: DateTime(1960),
        lastDate: DateTime(2024));
    if (picked != null) {
      setState(() {
        _persona!.dataNaixement = picked.toString();
        _inputFieldDataController!.text = _persona!.dataNaixement;
      });
    }
  }

  Widget _crearCorreu() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: _persona!.correu,
          labelText: "Correu electrònic",
          //helperText: 'Posi el teu correu electrònic',
          suffixIcon: const Icon(Icons.alternate_email),
          icon: const Icon(Icons.email),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      onChanged: (valor) => setState(() {
        _persona!.correu = valor;
      }),
    );
  }

  Widget _crearContrasenya() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          hintText: _persona!.contrasenya,
          labelText: "Contrasenya",
          //helperText: 'Posi la teva contrasenya',
          suffixIcon: const Icon(Icons.lock_open),
          icon: const Icon(Icons.lock),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      onChanged: (valor) {
        setState(() {
          _persona!.contrasenya = valor;
        });
      },
    );
  }
}
