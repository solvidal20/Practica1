// Archivo: lib/pages/textfields_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/ui_data.dart';

// 1. Convertimos el widget a StatefulWidget
class TextFieldsPage extends StatefulWidget {
  const TextFieldsPage({super.key});

  @override
  State<TextFieldsPage> createState() => _TextFieldsPageState();
}

class _TextFieldsPageState extends State<TextFieldsPage> {
  // 2. Creamos un controlador para leer el texto del TextField
  final _textController = TextEditingController();
  // 3. Creamos una variable para guardar el texto que se mostrará al presionar el botón
  String _submittedText = '';

  // 4. Es importante liberar el controlador cuando el widget se destruye
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView( // Usamos ListView para evitar que el teclado cause un desbordamiento de píxeles
      padding: const EdgeInsets.all(16.0),
      children: [
        // Título en grande
        Text(
          'Edit text (Text Field)',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 8),

        // Explicación
        Text(
          'Los EditText permiten al usuario ingresar y editar texto. Son fundamentales para formularios y entradas de datos.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 24),

        // Campo para que escriba el usuario
        TextField(
          controller: _textController, // Asignamos el controlador
          decoration: const InputDecoration(
            labelText: 'Ingresa texto aquí',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),

        // Botón de "Enviar texto"
        ElevatedButton(
          child: const Text('Enviar texto'),
          onPressed: () {
            // 5. Lógica del botón
            final currentText = _textController.text;
            // Actualizamos el estado global en el provider
            Provider.of<UiData>(context, listen: false).setInputText(currentText);
            // Actualizamos el estado local y redibujamos el widget
            setState(() {
              _submittedText = currentText;
            });
          },
        ),
        const SizedBox(height: 24),

        // 6. Muestra el resultado solo si se ha enviado texto
        if (_submittedText.isNotEmpty)
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              'Texto actual: $_submittedText',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
      ],
    );
  }
}