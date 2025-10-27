// lib/screens/summary_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart'; // Importa el paquete para compartir

import '../models/ui_data.dart'; // Importa el modelo de datos
import '../pages/home_page.dart'; // Importa la página principal para reiniciar

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Escucha los cambios en UiData para obtener los valores más recientes
    final uiData = context.watch<UiData>();

    // Define colores basados en el tema actual para un diseño consistente
    final Color primaryColor = Theme.of(context).primaryColor;
    final Color textColor = Colors.grey.shade800; // Un poco más oscuro para mejor contraste
    final Color cardColor = Colors.white;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumen de tu Selección'),
        centerTitle: true,
        backgroundColor: Colors.transparent, // Fondo transparente para que combine con el body
        elevation: 0,
        foregroundColor: Colors.black, // Color del texto y los iconos del AppBar
      ),
      backgroundColor: Colors.grey[100], // Un fondo gris claro para el cuerpo
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Tarjeta que contiene el resumen
            Card(
              color: cardColor,
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Filas de resumen generadas con un método auxiliar
                    _buildSummaryRow(Icons.edit, 'Texto ingresado:', uiData.inputText, textColor),
                    _buildSummaryRow(Icons.check_box_outline_blank, 'Opción aceptada:', uiData.isChecked ? 'Sí' : 'No', textColor),
                    _buildSummaryRow(Icons.radio_button_checked, 'Preferencia:', uiData.radioOption, textColor),
                    _buildSummaryRow(Icons.notifications_none, 'Notificaciones:', uiData.isSwitchedOn ? 'Activadas' : 'Desactivadas', textColor),
                    _buildSummaryRow(Icons.play_arrow, 'Último botón:', uiData.lastButtonPressed, textColor),
                    _buildSummaryRow(Icons.replay, 'Progreso iniciado:', uiData.wasProgressStarted ? 'Sí' : 'No', textColor),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Botón para compartir el resumen
            ElevatedButton.icon(
              onPressed: () {
                // Construye el texto que se va a compartir
                final summaryString = """
Resumen de mi Selección:
- Texto: ${uiData.inputText}
- Aceptado: ${uiData.isChecked ? 'Sí' : 'No'}
- Preferencia: ${uiData.radioOption}
- Notificaciones: ${uiData.isSwitchedOn ? 'Activadas' : 'Desactivadas'}
- Último botón: ${uiData.lastButtonPressed}
- Progreso iniciado: ${uiData.wasProgressStarted ? 'Sí' : 'No'}
""";
                // Usa el paquete share_plus para abrir el diálogo de compartir
                Share.share(summaryString, subject: 'Mi Resumen de UI App');
              },
              icon: const Icon(Icons.share, color: Colors.white),
              label: const Text('COMPARTIR RESUMEN', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 20),
            // Botón para reiniciar la aplicación
            TextButton(
              onPressed: () {
                // Llama al método para resetear todos los datos en el provider
                Provider.of<UiData>(context, listen: false).resetAllData();
                // Navega a la pantalla principal y elimina todas las rutas anteriores
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const HomePage()),
                      (Route<dynamic> route) => false,
                );
              },
              child: Text(
                'INICIAR NUEVAMENTE',
                style: TextStyle(color: primaryColor, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget auxiliar para construir cada fila del resumen y evitar repetir código
  Widget _buildSummaryRow(IconData icon, String label, String value, Color textColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey.shade600, size: 22),
          const SizedBox(width: 16),
          Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.w500, // Un poco más de peso a la etiqueta
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value, // El valor que viene de UiData
              style: TextStyle(
                color: textColor,
                fontSize: 16,
              ),
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis, // Evita que textos largos se desborden
            ),
          ),
        ],
      ),
    );
  }
}
