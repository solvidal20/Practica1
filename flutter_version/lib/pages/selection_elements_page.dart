// lib/pages/selection_elements_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/ui_data.dart'; // Importamos tu modelo de datos

class SelectionElementsPage extends StatelessWidget {
  const SelectionElementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 'watch' hace que la UI se reconstruya cuando los datos en UiData cambien.
    final uiData = context.watch<UiData>();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Elementos de Selección', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 16),
        const Text(
          'Estos widgets permiten al usuario elegir entre varias opciones.',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 24),

        // --- CheckBox ---
        // El estado de este Checkbox es controlado por el Provider.
        CheckboxListTile(
          title: const Text('Guardar configuración (CheckBox)'),
          value: uiData.isChecked, // Leemos el valor desde el provider
          onChanged: (value) {
            // 'read' se usa dentro de callbacks para llamar a una función sin escuchar cambios.
            // Llamamos al método del provider para cambiar el estado centralizado.
            context.read<UiData>().setChecked(value!);
          },
        ),

        // --- Switch ---
        // El estado de este Switch también es controlado por el Provider.
        SwitchListTile(
          title: const Text('Activar notificaciones (Switch)'),
          value: uiData.isSwitchedOn, // Leemos el valor desde el provider
          onChanged: (value) {
            context.read<UiData>().setSwitch(value);
          },
        ),
        const SizedBox(height: 16),
        const Divider(),
        const SizedBox(height: 16),
        const Text('¿Cuál es tu lenguaje favorito? (RadioButtons)'),

        // --- RadioButtons ---
        // Los RadioButtons también usan el estado del Provider.
        RadioListTile<String>(
          title: const Text('Dart'),
          value: 'Dart', // El valor que representa esta opción
          groupValue: uiData.radioOption, // El valor actualmente seleccionado
          onChanged: (value) {
            context.read<UiData>().setRadioOption(value!);
          },
        ),
        RadioListTile<String>(
          title: const Text('Kotlin'),
          value: 'Kotlin',
          groupValue: uiData.radioOption,
          onChanged: (value) {
            context.read<UiData>().setRadioOption(value!);
          },
        ),
        RadioListTile<String>(
          title: const Text('Swift'),
          value: 'Swift',
          groupValue: uiData.radioOption,
          onChanged: (value) {
            context.read<UiData>().setRadioOption(value!);
          },
        ),
      ],
    );
  }
}
