import 'package:flutter/material.dart';
import 'package:practica_final2_antonio_fdez/models/widget_page_theme.dart';
import 'package:practica_final2_antonio_fdez/widgets/navigation_drawer.dart';

class WidgetPage extends StatefulWidget {
  const WidgetPage({super.key});

  @override
  State<WidgetPage> createState() => _WidgetPageState();
}

class _WidgetPageState extends State<WidgetPage> {
  bool _modoOscuroActivo = false;
  bool _linearGradient = false;

  //declaro las características para el tema claro
  final _lightTheme = WidgetPageTheme(
    backgroundColor: Colors.white,
    textColor: Colors.black,
  );

  //declaro las características para el tema oscuro
  final _darkTheme = WidgetPageTheme(
    backgroundColor: Colors.black,
    textColor: Colors.white,
  );

  late WidgetPageTheme _currentTheme;
  late Widget _currentTitle;

  @override
  void initState() {
    super.initState();
    _currentTheme =
        _lightTheme; //tema por defecto de la pantalla será el tema claro
    _currentTitle =
        const Text('Navigation Drawer'); //el título por defecto del appBar
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: _currentTitle,
          backgroundColor: Colors.blue.shade700,
        ),
        drawer: MyNavigationDrawer(),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          color: _currentTheme.backgroundColor,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '
                'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
                'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                style: TextStyle(color: _currentTheme.textColor),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '
                'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
                'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                style: TextStyle(color: _currentTheme.textColor),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '
                'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
                'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                style: TextStyle(color: _currentTheme.textColor),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () => _bottomSheet(context),
                child: const Text('Abrir BottomSheet'),
              ),
            ],
          ),
        ));
  }

  // Método para abrir el BottomSheet
  _bottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: 200,
              color: Colors.white,
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.nightlight_round),
                    title: const Text('Modo Oscuro'),
                    trailing: Switch(
                      value: _modoOscuroActivo,
                      onChanged: (value) {
                        setState(() {
                          _modoOscuroActivo = value;
                          _toggleTheme(
                              _modoOscuroActivo); // Cambia el tema de la página
                        });
                      },
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.style_rounded),
                    title: const Text('Linear Gradient'),
                    trailing: Switch(
                      value: _linearGradient,
                      onChanged: (value) {
                        setState(() {
                          _linearGradient = value;
                          _toggleTitle(
                              _linearGradient); // aplicar el linearGradient al título del appBar
                        });
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // Cambia el tema de la página
  void _toggleTheme(bool isDarkMode) {
    setState(() {
      if (isDarkMode) {
        _currentTheme = _darkTheme;
      } else {
        _currentTheme = _lightTheme;
      }
    });
  }

  // aplicar el linearGradient al título del appBar
  void _toggleTitle(bool useLinearGradient) {
    setState(() {
      if (useLinearGradient) {
        _currentTitle = Text(
          'Navigation Drawer',
          style: TextStyle(
            foreground: Paint()
              ..shader = const LinearGradient(
                  colors: [Colors.red, Colors.black],
                  stops: [0.5, 0.75]).createShader(
                const Rect.fromLTWH(0.0, 0.0, 300.0, 70.0),
              ),
          ),
        );
      } else {
        _currentTitle = const Text('Navigation Drawer');
      }
    });
  }
}
