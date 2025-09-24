// Archivo: lib/pages/buttons_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/ui_data.dart';

class ButtonsPage extends StatefulWidget {
  const ButtonsPage({super.key});

  @override
  State<ButtonsPage> createState() => _ButtonsPageState();
}

class _ButtonsPageState extends State<ButtonsPage> {
  // 1. Estado inicial del mensaje
  String _message = 'Presione un botón';

  @override
  Widget build(BuildContext context) {
    // Usamos ListView para un mejor manejo del espacio y evitar desbordamientos
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // 2. Centramos todo el contenido
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Título en grande
            Text(
              'Botones',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 8),

            // Explicación
            Text(
              'Los botones permiten al usuario realizar acciones con un simple clic. Existen botones normales y de imagen.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 32),

            // Botón normal (cambiado de ElevatedButton.icon)
            ElevatedButton(
              child: const Text('Botón normal'),
              onPressed: () {
                const buttonName = 'Botón normal';
                // Informamos al provider
                Provider.of<UiData>(context, listen: false).setLastButton(buttonName);
                // Actualizamos el mensaje local para redibujar la UI
                setState(() {
                  _message = 'Se presionó el $buttonName';
                });
              },
            ),
            const SizedBox(height: 24),

            // Botón de imagen
            IconButton(
              icon: const Icon(Icons.camera_alt),
              iconSize: 48,
              tooltip: 'Botón de Imagen',
              onPressed: () {
                const buttonName = 'Botón de Imagen';
                // Informamos al provider
                Provider.of<UiData>(context, listen: false).setLastButton(buttonName);
                // Actualizamos el mensaje local
                setState(() {
                  _message = 'Se presionó el $buttonName';
                });
              },
            ),
            const SizedBox(height: 32),

            // Muestra el resultado de la última acción
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                _message,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ],
    );
  }
}