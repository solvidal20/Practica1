// lib/pages/home_page.dart
import 'package:flutter/material.dart';

// Importamos todas las páginas que hemos creado
import 'buttons_page.dart';
import 'info_page.dart';
import 'lists_page.dart';
import 'selection_elements_page.dart';
import 'textfields_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Variable para saber qué página está seleccionada
  int _selectedIndex = 0;
  // Lista de todas las páginas que se pueden mostrar
  static const List<Widget> _pages = <Widget>[
    InfoPage(),      // Índice 0
    TextFieldsPage(),        // Índice 1
    ButtonsPage(),           // Índice 2
    SelectionElementsPage(), // Índice 3
    ListsPage(),             // Índice 4
  ];
  // Lista de los títulos para la barra superior
  static const List<String> _pageTitles = <String>[
    'Elementos de Información',
    'Campos de Texto (TextField)',
    'Botones',
    'Elementos de Selección',
    'Listas',
  ];

  // Función que se llama cuando se toca un elemento del menú
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Cambiamos la página seleccionada
    });
    Navigator.pop(context); // Cierra el menú lateral (Drawer)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra de título superior
      appBar: AppBar(
        title: Text(_pageTitles[_selectedIndex]), // Muestra el título de la página actual
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // Menú de navegación lateral
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Text(
                'Menú de Widgets',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            // Cada ListTile es una opción del menú
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Elementos de Información'),
              onTap: () => _onItemTapped(0),
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('TextFields'),
              onTap: () => _onItemTapped(1),
            ),
            ListTile(
              leading: const Icon(Icons.touch_app),
              title: const Text('Botones'),
              onTap: () => _onItemTapped(2),
            ),
            ListTile(
              leading: const Icon(Icons.check_box),
              title: const Text('Elementos de Selección'),
              onTap: () => _onItemTapped(3),
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Listas'),
              onTap: () => _onItemTapped(4),
            ),
          ],
        ),
      ),
      // El cuerpo de la pantalla muestra la página que esté seleccionada
      body: _pages[_selectedIndex],
    );
  }
}
