// Archivo: lib/pages/selection_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/ui_data.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  String _selectionResult = '';

  @override
  Widget build(BuildContext context) {
    final uiData = context.watch<UiData>();

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Text(
          'Elementos de Selección',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 8),
        Text(
          'Checkbox, RadioButton y Switch permiten al usuario seleccionar opciones de diferentes formas.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 16),

        CheckboxListTile(
          title: const Text('CheckBox Opción'),
          value: uiData.isChecked,
          onChanged: (bool? value) {
            Provider.of<UiData>(context, listen: false).setChecked(value ?? false);
          },
        ),
        const Divider(),
        RadioListTile<String>(
          title: const Text('Opción 1'),
          value: 'Opción 1',
          groupValue: uiData.radioOption,
          onChanged: (String? value) {
            Provider.of<UiData>(context, listen: false).setRadioOption(value ?? 'Ninguno');
          },
        ),
        RadioListTile<String>(
          title: const Text('Opción 2'),
          value: 'Opción 2',
          groupValue: uiData.radioOption,
          onChanged: (String? value) {
            Provider.of<UiData>(context, listen: false).setRadioOption(value ?? 'Ninguno');
          },
        ),
        const Divider(),
        SwitchListTile(
          title: const Text('Switch'),
          value: uiData.isSwitchedOn,
          onChanged: (bool value) {
            Provider.of<UiData>(context, listen: false).setSwitch(value);
          },
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          child: const Text('Mostrar selección'),
          onPressed: () {
            final result = """
Checkbox: ${uiData.isChecked ? 'Sí' : 'No'}
RadioButton: ${uiData.radioOption}
Switch: ${uiData.isSwitchedOn ? 'ON' : 'OFF'}
            """;
            setState(() {
              _selectionResult = result;
            });
          },
        ),
        const SizedBox(height: 16),
        if (_selectionResult.isNotEmpty)
          Container(
            padding: const EdgeInsets.all(12.0),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              _selectionResult,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontFamily: 'monospace'),
            ),
          ),
      ],
    );
  }
}