// Archivo: lib/pages/info_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/ui_data.dart';
import '../screens/summary_screen.dart';

// 1. Convertimos a StatefulWidget para manejar el estado local
class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  // 2. Variables de estado para la ProgressBar y el Ícono
  double _progressValue = 0.0;
  bool _showIconInfo = false;

  // Función para simular el progreso
  void _startProgress() async {
    // Informamos al provider que el progreso ha comenzado
    Provider.of<UiData>(context, listen: false).setProgressStarted(true);

    // Reiniciamos el progreso
    setState(() {
      _progressValue = 0.0;
    });

    // Simulamos el avance de la barra
    for (int i = 0; i < 100; i++) {
      // Espera un momento antes de la siguiente actualización
      await Future.delayed(const Duration(milliseconds: 20));
      // Actualizamos el estado para redibujar la barra y el texto
      if (mounted) { // mounted verifica que el widget todavía esté en pantalla
        setState(() {
          _progressValue = (i + 1) / 100.0;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Leemos el texto compartido del provider
    final uiData = context.watch<UiData>();

    // Usamos ListView para que todo el contenido sea desplazable
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // --- Título y Descripción ---
        Text(
          'Elementos de Información',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 8),
        Text(
          'Widgets como Text, Image y LinearProgressIndicator muestran información al usuario de diferentes maneras.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 24),
        const Divider(),

        // --- Sección de Texto Compartido ---
        const SizedBox(height: 16),
        Text(
          'Texto compartido:',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            uiData.inputText.isEmpty ? '(Aún no has escrito nada)' : uiData.inputText,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        const SizedBox(height: 24),
        const Divider(),

        // --- Sección de ProgressBar ---
        const SizedBox(height: 16),
        Text(
          'Progreso:',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        LinearProgressIndicator(
          value: _progressValue,
          minHeight: 10,
        ),
        const SizedBox(height: 8),
        Text(
          'Progreso: ${(_progressValue * 100).toInt()}%',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: _startProgress, // Llama a la función de progreso
          child: const Text('Iniciar progreso'),
        ),
        const SizedBox(height: 24),
        const Divider(),

        // --- Sección del Ícono de Información ---
        const SizedBox(height: 16),
        IconButton(
          icon: const Icon(Icons.info_outline),
          iconSize: 48,
          color: Colors.deepPurple,
          onPressed: () {
            // Alternamos el estado para mostrar/ocultar el texto
            setState(() {
              _showIconInfo = !_showIconInfo;
            });
          },
        ),
        const SizedBox(height: 8),
        Text(
          // Cambiamos el texto según el estado de _showIconInfo
          _showIconInfo
              ? 'Este es un icono de información. Representa detalles adicionales sobre la aplicación.'
              : 'Toca el icono para más información',
          textAlign: TextAlign.center,
          style: TextStyle(fontStyle: _showIconInfo ? FontStyle.normal : FontStyle.italic),
        ),
        const SizedBox(height: 48),

        // --- Botón de Resumen ---
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
          child: const Text('Ver resumen en nueva pantalla'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SummaryScreen()),
            );
          },
        ),
      ],
    );
  }
}